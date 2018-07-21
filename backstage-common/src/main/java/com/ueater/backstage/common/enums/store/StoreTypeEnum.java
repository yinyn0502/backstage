package com.ueater.backstage.common.enums.store;

public enum StoreTypeEnum {

    SUPERMARKET(10),
    RESTAURANT(20);

    private Integer type;

    StoreTypeEnum(Integer type){
        this.type = type;
    }

    public Integer getType(){
        return type;
    }

}
