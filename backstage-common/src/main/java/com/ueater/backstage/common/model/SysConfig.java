package com.ueater.backstage.common.model;

import lombok.Data;

@Data
public class SysConfig {
    private Long id;

    private String smtp;

    private String port;

    private String mailname;

    private String mailpassword;

    private String smsname;

    private String smspassword;


}