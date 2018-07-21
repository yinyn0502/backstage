package com.ueater.backstage.common.enums.cms;

/**
 * Created by zhangjiannan on 2018/1/18.
 */
public enum EntityIdTypeEnum {
    PRODUCT_ID(1),//商品id--entityIdValue
    ACTIVITY_ID(2);//活动id--entityIdValue

    private Integer type;

    EntityIdTypeEnum(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

}
