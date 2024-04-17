package com.yongoe.gpms.controller.vo.req;

import com.yongoe.gpms.utils.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 项目管理
 *
 * @author yongoe
 * @since 2024/04/15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProjectReq  extends BaseEntity {

    /**
     * id
     */
    private Long id;
    /**
     * 项目名
     */
    private String name;
    /**
     * 项目代码
     */
    private String projectCode;
    /**
     * 启动方式
     */
    private String runType;
    /**
     * 技术
     */
    private String technology;
    /**
     * 详情
     */
    private String details;
    /**
     * img
     */
    private String img;
    /**
     * 运行状态
     */
    private Boolean state;
    /**
     * 账号密码
     */
    private String login;
    /**
     * 访问地址
     */
    private String url;
    /**
     * 创建时间
     */
    private LocalDateTime createTime;
    /**
     * 修改时间
     */
    private LocalDateTime updateTime;
    /**
     * 创建人
     */
    private String createBy;
    /**
     * 修改人
     */
    private String updateBy;
}