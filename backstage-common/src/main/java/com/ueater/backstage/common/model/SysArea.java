package com.ueater.backstage.common.model;

import lombok.Data;

import java.util.Date;

@Data
public class SysArea {
    private Long id;

    private Long parentId;

    private String parentIds;

    private String name;

    private Long sort;

    private String code;

    private String type;

    private Long createBy;

    private Date createDate;

    private Long updateBy;

    private Date updateDate;

    private String remarks;

    private String delFlag;

    private SysArea parent;

   }