package com.yongoe.gpms.controller.vo.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
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
public class ProjectExcel {

    private Long id;

    @Excel(name = "项目名", width = 20)
    private String name;

    @Excel(name = "项目代码", width = 20)
    private String projectCode;

    @Excel(name = "启动方式", width = 20)
    private String runType;

    @Excel(name = "技术", width = 20)
    private String technology;

    @Excel(name = "详情", width = 20)
    private String details;

    @Excel(name = "img", width = 20)
    private String img;

    @Excel(name = "运行状态", width = 20)
    private Boolean state;

    @Excel(name = "账号密码", width = 20)
    private String login;

    @Excel(name = "访问地址", width = 20)
    private String url;

    @Excel(name = "创建时间", width = 20)
    private LocalDateTime createTime;

    @Excel(name = "修改时间", width = 20)
    private LocalDateTime updateTime;

    @Excel(name = "创建人", width = 20)
    private String createBy;

    @Excel(name = "修改人", width = 20)
    private String updateBy;

}