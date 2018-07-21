package com.ueater.backstage.common.model;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class SysUser {
    private Long id;

    private Long companyId;

    private Long officeId;

    private String loginName;

    private String password;

    private String no;

    private String name;

    private String email;

    private String phone;

    private String mobile;

    private String userType;

    private String photo;

    private String loginIp;

    private Date loginDate;

    private String loginFlag;

    private Long createBy;

    private Date createDate;

    private Long updateBy;

    private Date updateDate;

    private String remarks;

    private String delFlag;

    private String qrcode;

    private String sign;

    private SysOffice office;

    private SysOffice company;

    private List<SysRole> roleList ; // 拥有角色列表

    private String newPassword;

    private String oldLoginName;

    private String adFlag;

}