package com.ueater.backstage.common.enums.couponmanage;

public enum CouponQueryStatusEnum {

    BEFORE_REVIEW(0, "待审核"),

    RUNNING(1, "启用中"),

    REVIEW_REFUSE(2, "审核不通过"),

    FORBIDDEN(3,"已禁用"),

    EXPIRE(4,"已过期");
    private Integer status;
    private String name;
    CouponQueryStatusEnum(Integer status, String name){
        this.status = status;
        this.name = name;
    }
    public Integer getStatus(){
        return  status;
    }
}
