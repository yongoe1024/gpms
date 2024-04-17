package com.yongoe.gpms.service;

import com.yongoe.gpms.entity.Project;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

/**
 * 项目管理
 *
 * @author yongoe
 * @since 2024/04/15
 */
public interface ProjectService extends IService<Project> {

    Page<Project> getProjectByPage(Page<Project> page, Project project);

}
