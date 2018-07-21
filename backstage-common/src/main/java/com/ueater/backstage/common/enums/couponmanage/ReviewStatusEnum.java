package com.ueater.backstage.common.enums.couponmanage;

/**
 * Created by chengyuxiang on 2017/7/15.
 */
public enum ReviewStatusEnum {

    UNREVIEW(0, "未审核"),

    REVIEW_UNPASS(1, "审核不通过"),

    REVIEW_PASS(2, "审核通过"),

    REVIEW_STOP(3, "审核终止");

    private Integer status;
    private String name;

    ReviewStatusEnum(Integer status, String name){
        this.status = status;
        this.name = name;
    }
    public Integer getStatus(){
        return  status;
    }
}
