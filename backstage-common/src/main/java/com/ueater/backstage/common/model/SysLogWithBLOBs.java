package com.ueater.backstage.common.model;

import lombok.Data;

@Data
public class SysLogWithBLOBs extends SysLog {
    private String requestUri;

    private String params;

    private String exception;

}