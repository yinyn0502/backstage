package com.ueater.backstage.common.enums.activity;

public enum DimensionAppTypeEnum {
    IOS(0),
    ANDROID(1),
    H5(2),
    OFFLINE(3),
    ALL(4);

    private Integer type;
    DimensionAppTypeEnum(Integer type){
        this.type = type;
    }
    public Integer getType(){
        return  type;
    }
}
