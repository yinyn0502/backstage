package com.ueater.backstage.common.enums;

/**
 * Created by chengyuxiang on 2017/7/15.
 */
public enum MemberDimensionTypeEnum {
    APPTYPE(1),
    ROLE(2),
    REGISTRY_CHANNEL(3);
    private Integer type;
    MemberDimensionTypeEnum(Integer type){
        this.type = type;
    }
    public Integer getType(){
        return type;
    }
}
