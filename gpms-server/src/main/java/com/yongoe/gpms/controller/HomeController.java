package com.yongoe.gpms.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yongoe.gpms.basic.entity.DictData;
import com.yongoe.gpms.basic.service.DictDataService;
import com.yongoe.gpms.entity.Project;
import com.yongoe.gpms.service.ProjectService;
import com.yongoe.gpms.utils.R;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 项目管理
 *
 * @author yongoe
 * @since 2024/04/15
 */
@RestController
@RequestMapping("/home")
public class HomeController {
    @Resource
    private ProjectService projectService;
    @Resource
    private DictDataService dictDataService;

    @RequestMapping("/top")
    public R top() {
        long count = projectService.count();
        long count1 = projectService.count(new LambdaQueryWrapper<Project>().eq(Project::getState, true));
        Map<String, Long> map = Map.of("total", count, "running", count1);
        return R.success().put(map);
    }

    @RequestMapping("/pie")
    public R pie() {
        List<Project> list = projectService.list(new LambdaQueryWrapper<Project>()
                .select(Project::getTechnology));
        List<String> list1 = list.stream().map(Project::getTechnology).toList();
        Map<String, Integer> map = new HashMap<>();
        for (String s : list1) {
            String[] split = s.split(",");
            if (split.length > 0) {
                for (String s1 : split) {
                    map.merge(s1, 1, Integer::sum);
                }
            }
        }
        List<Map<String, Object>> pie = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : map.entrySet()) {
            Map<String, Object> map1 = new HashMap<>();
            map1.put("value", entry.getValue());
            DictData one = dictDataService.getOne(new LambdaQueryWrapper<DictData>()
                    .eq(DictData::getDictId, 1).eq(DictData::getDictValue, entry.getKey()));
            map1.put("name", one.getDictKey());
            pie.add(map1);
        }
        return R.success().put(pie);
    }

    @RequestMapping("/line")
    public R line() {
        // 计算前30天访问量
        List<LocalDate> time = new ArrayList<>();
        List<Integer> value = new ArrayList<>();
        for (int i = 0; i < 30; i++) {
            time.add(LocalDate.now().minusDays(i));
            // 随机0.5-1 之间的数
            value.add((int) ((Math.random() * 0.5 + 0.5) * 1000));
        }
        Map<String, Object> map = new HashMap<>();
        map.put("time", time);
        map.put("value", value);
        return R.success().put(map);
    }


}