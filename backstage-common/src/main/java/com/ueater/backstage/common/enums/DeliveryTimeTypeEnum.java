package com.ueater.backstage.common.enums;

/**
 * Created by chengyuxiang on 2017/7/15.
 */
public enum DeliveryTimeTypeEnum {

    TOMORROW_START_DELIVERY(1),

    TODAY_START_DELIVERY(2),

    TODAY_DELIVERY(3);

    private Integer type;

    DeliveryTimeTypeEnum(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }
}
