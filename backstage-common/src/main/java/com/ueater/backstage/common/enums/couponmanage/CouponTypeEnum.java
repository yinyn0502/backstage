package com.ueater.backstage.common.enums.couponmanage;

/**
 * @author liutao
 * @version 1.0.0
 * @date 2017/7/20 20:59
 */
public enum CouponTypeEnum {
    PRODUCT(1,"商品劵"),
    CASH(2,"现金券"),
    EXPRESS_FEE(3,"运费劵");
    private Integer type;
    private String names;
    CouponTypeEnum(Integer type,String names){
        this.type = type;
        this.names=names;
    }
    public Integer getType(){
        return type;
    }

    public String getNames(){
        return names;
    }
}
