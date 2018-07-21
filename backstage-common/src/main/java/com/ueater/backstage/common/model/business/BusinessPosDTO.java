package com.ueater.backstage.common.model.business;

import lombok.Data;

/**
 * Created by jinghao on 2018/5/29.
 */
@Data
public class BusinessPosDTO {

    private Long id;
    private String deviceId;
    private String posNo;
    private Long storeId;
    private String appId;
    private String appVersion;
    private Long registTime;
    private Long updateTime;

}
