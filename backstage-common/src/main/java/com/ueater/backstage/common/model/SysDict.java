 package com.ueater.backstage.common.model;

import lombok.Data;

import java.util.Date;

@Data
public class SysDict {
    private Long id;

    private String value;

    private String label;

    private String type;

    private String description;

    private Long sort;

    private String parentId;

    private Long createBy;

    private Date createDate;

    private Long updateBy;

    private Date updateDate;

    private String remarks;

    private String delFlag;

    }