package com.ueater.backstage.common.enums.backstage;

public enum BackstageResponseCodeEnum {

    SUCCESS(0, "成功"),

    FAILED(2, "失败");


    private Integer status;
    private String name;
    BackstageResponseCodeEnum(Integer status, String name){
        this.status = status;
        this.name = name;
    }
    public Integer getStatus(){
        return  status;
    }
}