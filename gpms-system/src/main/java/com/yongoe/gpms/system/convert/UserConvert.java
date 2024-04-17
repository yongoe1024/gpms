package com.yongoe.gpms.system.convert;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.gpms.system.controller.vo.req.UserReq;
import com.yongoe.gpms.system.controller.vo.res.UserInfoRes;
import com.yongoe.gpms.system.controller.vo.res.UserRes;
import com.yongoe.gpms.system.entity.User;
import org.mapstruct.Mapper;

/**
 * 用户 convert
 *
 * @author yongoe
 * @since 2023/1/1
 */
@Mapper(componentModel = "spring")
public interface UserConvert {

    Page<UserRes> entity2ResPage(Page<User> page);

    User req2Entity(UserReq reqVo);

    UserInfoRes entity2UserInfo(User entity);


}