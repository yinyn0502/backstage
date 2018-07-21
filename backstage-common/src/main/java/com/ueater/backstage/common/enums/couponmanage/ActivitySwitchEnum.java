package com.ueater.backstage.common.enums.couponmanage;

/**
 * Created by chengyuxiang on 2017/7/15.
 */
public enum ActivitySwitchEnum {

    OPEN(0, "开启活动"),

    CLOSE(1, "禁用活动"),

    REVIEW(2,"审核活动");

    private Integer status;
    private String name;
    ActivitySwitchEnum(Integer status, String name){
        this.status = status;
        this.name = name;
    }
    public Integer getStatus(){
        return  status;
    }
}
