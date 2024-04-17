package com.yongoe.gpms.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.gpms.entity.Project;
import com.yongoe.gpms.mapper.ProjectMapper;
import com.yongoe.gpms.service.ProjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 项目管理
 *
 * @author yongoe
 * @since 2024/04/15
 */
@Service
public class ProjectServiceImpl extends ServiceImpl<ProjectMapper, Project> implements ProjectService {

    @Override
    public Page<Project> getProjectByPage(Page<Project> page, Project project) {
       return baseMapper.getProjectByPage(page, project);
    }

}
