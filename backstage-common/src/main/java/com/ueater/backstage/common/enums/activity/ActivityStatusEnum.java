package com.ueater.backstage.common.enums.activity;

public enum ActivityStatusEnum {

    BEFORE_START(0, "未开始"),

    RUNNING(1, "进行中"),

    ENDED(2, "已结束"),

    FORBIDDEN(3,"已禁用");

    private Integer status;
    private String name;
    ActivityStatusEnum(Integer status,String name){
        this.status = status;
        this.name = name;
    }
    public Integer getStatus(){
        return  status;
    }
}