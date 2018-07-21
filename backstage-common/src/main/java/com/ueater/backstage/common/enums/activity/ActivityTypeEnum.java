package com.ueater.backstage.common.enums.activity;

/**
 * Created by chengyuxiang on 2017/7/15.
 */
public enum ActivityTypeEnum {
    PROMO(1),   //礼券
    COUPON(2),  //领券
    PRICE(3),   //价格
    DISTRIBUTE(4),
    USER_SHARE(5);
    private Integer type;
    ActivityTypeEnum(Integer type){
        this.type = type;
    }
    public Integer getType(){
        return type;
    }
}
