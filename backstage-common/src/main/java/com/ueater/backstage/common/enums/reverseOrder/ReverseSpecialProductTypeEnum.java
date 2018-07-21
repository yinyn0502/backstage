package com.ueater.backstage.common.enums.reverseOrder;

/**
 * Created by chengyuxiang on 2017-09-06.
 */
public enum ReverseSpecialProductTypeEnum {

    OPERATED(1,"该商品已经申请过退换货"),

    FRESH_GOODS_OVERTIME(2,"该商品为生鲜商品且超过24小时");

    private Integer type;
    private String desc;
    ReverseSpecialProductTypeEnum(Integer type, String desc){
        this.type = type;
        this.desc = desc;
    }
    public Integer getType(){
        return type;
    }
    public String getDesc(){
        return desc;
    }
}
