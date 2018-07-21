package com.ueater.backstage.common.model;

import lombok.Data;

import java.util.Date;

@Data
public class SysLog {
    private Long id;

    private String type;

    private String bizType;

    private String remoteAddr;

    private String userAgent;

    private String method;

    private Long createBy;

    private Date createDate;

    private Long updateBy;

    private Date updateDate;

}