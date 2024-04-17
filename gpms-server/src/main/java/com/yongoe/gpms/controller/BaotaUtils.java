package com.yongoe.gpms.controller;

import cn.hutool.core.text.UnicodeUtil;
import cn.hutool.crypto.digest.MD5;
import cn.hutool.http.HttpRequest;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.yongoe.gpms.entity.Project;
import com.yongoe.gpms.service.ProjectService;
import com.yongoe.gpms.system.entity.Log;
import com.yongoe.gpms.system.service.LogService;
import com.yongoe.gpms.utils.UserUtils;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 宝塔
 *
 * @author yongoe
 * @since 2024/4/15
 */
@Component
public class BaotaUtils {
    private static final String btSign = "fP0PblEnXRCm3sL8EqKBMJ7RYL8DQdau";
    private static final String host = "http://47.113.105.67:31462";
    private static List<Map> project_list = new ArrayList<>();
    /**
     * project_list结构
     * "path" -> "/www/server/panel/data/compose/tomcat7/template/tomcat7.yaml"
     * "name" -> "tom7"
     * "template_id" -> {Integer@10447} 2
     * "remark" -> ""
     * "id" -> {Integer@10451} 1
     * "time" -> {BigDecimal@10453} "1713277632.3392432"
     * "run_status" -> "running"
     * "status" -> "1"
     */
    @Resource
    private LogService logService;
    @Resource
    private ProjectService projectService;

    public void dockerStart(String code) {
        String dockerId = getDockerId(code);
        String json = "project_id=" + dockerId + "&status=start";
        String s = sendPost("/btdocker/compose/set_compose_status", json);
        JSONObject jsonObject = JSON.parseObject(s);
        saveLog("宝塔-docker启动-" + code, json, jsonObject.toJSONString());
    }

    public void dockerStop(String code) {
        String dockerId = getDockerId(code);
        String json = "project_id=" + dockerId + "&status=stop";
        String s = sendPost("/btdocker/compose/set_compose_status", json);
        JSONObject jsonObject = JSON.parseObject(s);
        saveLog("宝塔-docker停止-" + code, json, jsonObject.toJSONString());
    }

    private String getDockerId(String code) {
        for (Map map : project_list) {
            if (code.equals(map.get("name"))) {
                return String.valueOf(map.get("id"));
            }
        }
        throw new RuntimeException("获取项目不存在错误");
    }

    public void getDockerList() {
        List<Project> projects = projectService.list();
        String s = sendPost("/btdocker/compose/compose_project_list", "");
        // 字符串转list
        List<Map> list = JSON.parseArray(s, Map.class);
        for (Map l : list) {
            String run_status = (String) l.get("run_status");
            String name = (String) l.get("name");
            updateStatus(name, run_status, projects);
        }
        project_list = list;
    }

    private void updateStatus(String code, String run_status, List<Project> projects) {
        boolean status = "running".equals(run_status);
        for (Project entity : projects) {
            if (code.equals(entity.getProjectCode())) {
                if (entity.getState().equals(status)) {
                    continue;
                } else {
                    entity.setState(true);
                    projectService.updateById(entity);
                }
                break;
            }
        }
    }

    /**
     * 发送请求
     */
    private String sendPost(String url, String param) {
        long timestamp = new Date().getTime();
        String md5Sign = new MD5().digestHex(btSign);
        String temp = timestamp + md5Sign;
        String token = new MD5().digestHex(temp);
        String json = "request_time=" + timestamp + "&request_token=" + token + "&" + param;
        String result = HttpRequest.post(host + url)
                .body(json)
                .timeout(200000)//超时，毫秒
                .execute().body();
        String s = UnicodeUtil.toString(result);
        if (s.startsWith("{")) {
            JSONObject jsonObject = JSON.parseObject(s);
            if (!jsonObject.getBoolean("status")) {
                throw new RuntimeException("宝塔请求错误：" + jsonObject.getString("msg"));
            }
        }
        return s;
    }

    private void saveLog(String title, String param, String result) {
        Log entity = new Log();
        entity.setName(UserUtils.getName());
        entity.setType("操作");
        entity.setTitle(title);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("入参", param);
        jsonObject.put("出参", result);
        entity.setDetails(JSONObject.toJSONString(jsonObject, SerializerFeature.PrettyFormat));
        logService.save(entity);
    }

}
