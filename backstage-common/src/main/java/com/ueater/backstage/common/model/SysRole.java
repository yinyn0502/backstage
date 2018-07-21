package com.ueater.backstage.common.model;

import lombok.Data;

import java.util.Date;

@Data
public class SysRole {
    private Long id;

    private Long officeId;

    private String name;

    private String enname;

    private String roleType;

    private String dataScope;

    private String isSys;

    private String useable;

    private Long createBy;

    private Date createDate;

    private Long updateBy;

    private Date updateDate;

    private String remarks;

    private String delFlag;

    private SysOffice office;

    private String oldName;

    private String oldEnname;

    private String menuIds;

   }