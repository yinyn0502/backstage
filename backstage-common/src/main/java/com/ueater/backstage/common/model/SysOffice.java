package com.ueater.backstage.common.model;

import lombok.Data;

import java.util.Date;

@Data
public class SysOffice {
    private Long id;

    private Long parentId;

    private String parentIds;

    private String name;

    private Long sort;

    private String areaId;

    private String code;

    private String type;

    private String grade;

    private String address;

    private String zipCode;

    private String master;

    private String phone;

    private String fax;

    private String email;

    private String useable;

    private Long primaryPerson;

    private Long deputyPerson;

    private Long createBy;

    private Date createDate;

    private Long updateBy;

    private Date updateDate;

    private String remarks;

    private String delFlag;

    private SysArea area;

    private SysUser primary;//主负责人

    private SysUser deputy;//副负责人

    private SysOffice parent;

   }