package com.yongoe.gpms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.gpms.entity.Project;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

/**
 * 项目管理
 *
 * @author yongoe
 * @since 2024/04/15
 */
@Mapper
public interface ProjectMapper extends BaseMapper<Project> {

    Page<Project> getProjectByPage(Page<Project> page, @Param("project") Project project);


}
