package com.yongoe.gpms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.gpms.config.aop.WebLog;
import com.yongoe.gpms.controller.vo.excel.ProjectExcel;
import com.yongoe.gpms.controller.vo.res.ProjectRes;
import com.yongoe.gpms.convert.ProjectConvert;
import com.yongoe.gpms.entity.Project;
import com.yongoe.gpms.controller.vo.req.ProjectReq;
import com.yongoe.gpms.service.ProjectService;
import com.yongoe.gpms.utils.ExcelUtils;
import com.yongoe.gpms.utils.PageUtils;
import com.yongoe.gpms.utils.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 项目管理
 *
 * @author yongoe
 * @since 2024/04/15
 */
@Tag(name = "项目管理")
@RestController
@RequestMapping("/gpms/project")
public class ProjectController {
    @Resource
    private ProjectService projectService;
    @Resource
    private ProjectConvert projectConvert;
    @Resource
    private BaotaUtils baotaUtils;

    @Operation(summary = "启动停止docker")
    @RequestMapping("/docker/{projectCode}/{status}")
    public R docker(@PathVariable String projectCode, @PathVariable String status) {
        if ("true".equals(status)) {
            baotaUtils.dockerStart(projectCode);
        } else if ("false".equals(status)) {
            baotaUtils.dockerStop(projectCode);
        }
        return R.success("操作成功");
    }

    @WebLog
    @Operation(summary = "查询分页数据")
    @PostMapping("/page")
    public R page(@RequestBody ProjectReq req) {
        Project entity = projectConvert.req2Entity(req);
        Page<Project> page = projectService.getProjectByPage(Page.of(req.getCurrent(), req.getSize()), entity);
        Page<ProjectRes> resPage = projectConvert.entity2ResPage(page);
        return R.success().put(new PageUtils(resPage));
    }

    @WebLog
    @Operation(summary = "添加数据")
    @PostMapping("/add")
    public R add(@RequestBody ProjectReq req) {
        Project project = projectConvert.req2Entity(req);
        projectService.save(project);
        return R.success("添加成功");
    }

    @WebLog
    @Operation(summary = "修改数据")
    @PostMapping("/update")
    public R update(@RequestBody ProjectReq req) {
        Project project = projectConvert.req2Entity(req);
        projectService.updateById(project);
        return R.success("修改成功");
    }

    @WebLog
    @Operation(summary = "删除数据")
    @PostMapping("/delete/{ids}")
    public R delete(@PathVariable List<Long> ids) {
        projectService.removeByIds(ids);
        return R.success("删除成功");
    }

    @WebLog
    @Operation(summary = "导入数据")
    @PostMapping("/upload")
    public R upload(MultipartFile file) {
        List<ProjectExcel> excelList = ExcelUtils.upload(file, ProjectExcel.class);
        List<Project> list = projectConvert.excel2EntityList(excelList);
        projectService.saveBatch(list);
        return R.success("导入成功");
    }

    @WebLog
    @Operation(summary = "导出数据")
    @GetMapping("/export")
    public void export(ProjectReq req, HttpServletResponse response) {
        Project entity = projectConvert.req2Entity(req);
        Page<Project> page = projectService.getProjectByPage(Page.of(-1, -1), entity);
        List<ProjectExcel> list = projectConvert.entity2ExcelList(page.getRecords());
        ExcelUtils.export(response, list, ProjectExcel.class);
    }
}