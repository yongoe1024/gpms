package com.yongoe.gpms.convert;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.gpms.entity.Project;
import com.yongoe.gpms.controller.vo.excel.ProjectExcel;
import com.yongoe.gpms.controller.vo.req.ProjectReq;
import com.yongoe.gpms.controller.vo.res.ProjectRes;
import org.mapstruct.Mapper;

import java.util.List;

/**
 * 项目管理 convert
 *
 * @author yongoe
 * @since 2024/04/15
 */
@Mapper(componentModel = "spring")
public interface ProjectConvert {
    /**
     * entity to vo
     */
    ProjectReq entity2Req(Project entity);

    ProjectRes entity2Res(Project entity);

    ProjectExcel entity2Excel(Project entity);

    /**
     * entity to vo List
     */
    List<ProjectReq> entity2ReqList(List<Project> list);

    List<ProjectRes> entity2ResList(List<Project> list);

    List<ProjectExcel> entity2ExcelList(List<Project> list);

    /**
     * entity to vo Page
     */
    Page<ProjectRes> entity2ResPage(Page<Project> page);

    /**
     * vo to entity
     */
    Project req2Entity(ProjectReq req);

    Project excel2Entity(ProjectExcel excel);

    /**
     * vo to entity List
     */
    List<Project> excel2EntityList(List<ProjectExcel> list);


}