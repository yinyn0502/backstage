package com.ueater.backstage.common.enums.activity;

/**
 * Created by chengyuxiang on 2017/7/15.
 */
public enum ProductDimensionTypeEnum {
    SKU(1),
    CATEGORY(2),
    STORE(3);
    private Integer type;
    ProductDimensionTypeEnum(Integer type){
        this.type = type;
    }
    public Integer getType(){
        return type;
    }

}
