package com.yongoe.gpms.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("t_project")
public class Project {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
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
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    /**
     * 创建人
     */
    @TableField(fill = FieldFill.INSERT)
    private String createBy;

    /**
     * 修改人
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

}