package com.yongoe.gpms.basic.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.gpms.basic.entity.Dict;
import com.yongoe.gpms.basic.entity.DictData;

import java.util.List;

/**
 * 数据字典
 *
 * @author yongoe
 * @since 2023/1/1
 */
public interface DictService extends IService<Dict> {

    Page<Dict> getDictByPage(Page<Dict> page, Dict dict);

    List<DictData> getDict(String name);
}
