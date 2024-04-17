package com.yongoe.gpms.system.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.gpms.system.entity.Config;
import com.yongoe.gpms.system.mapper.ConfigMapper;
import com.yongoe.gpms.system.service.ConfigService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 系统配置
 *
 * @author yongoe
 * @since 2023/1/1
 */
@Service
public class ConfigServiceImpl extends ServiceImpl<ConfigMapper, Config> implements ConfigService {

    @Override
    public Page<Config> getConfigByPage(Page<Config> page, Config config) {
        return baseMapper.getConfigByPage(page, config);
    }

    @Override
    public List<Config> getConfig() {
        return baseMapper.getConfig();
    }

}
