package com.yongoe.gpms.basic.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.gpms.basic.entity.Letter;

/**
 * 信件
 *
 * @author yongoe
 * @since 2023/1/1
 */
public interface LetterService extends IService<Letter> {

    Page<Letter> getLetterByPage(Page<Letter> page, Letter letter);

}
