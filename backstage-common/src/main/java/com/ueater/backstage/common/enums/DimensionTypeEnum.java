package com.ueater.backstage.common.enums;

/**
 * Created by chengyuxiang on 2017/7/16.
 */
public enum DimensionTypeEnum {
    MEMBER_ROLE(1),
    APP_PLATFORM(2),
    REGISTRY_CHANNEL(3);

    private Integer type;
    DimensionTypeEnum(Integer type){
        this.type = type;
    }
    public Integer getType(){
        return  type;
    }
}
