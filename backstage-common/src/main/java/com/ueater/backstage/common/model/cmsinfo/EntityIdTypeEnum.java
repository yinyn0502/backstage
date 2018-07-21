package com.ueater.backstage.common.model.cmsinfo;

/**
 * Created by zhangjiannan on 2018/1/18.
 */
public enum EntityIdTypeEnum {
    PRODUCT_ID(1),//商品id
    ACTIVITY_ID(2);//活动id
    private Integer type;

    EntityIdTypeEnum(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

}
