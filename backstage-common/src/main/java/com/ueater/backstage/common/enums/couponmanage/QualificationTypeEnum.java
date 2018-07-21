package com.ueater.backstage.common.enums.couponmanage;

/**
 * Created by chengyuxiang on 2017/7/15.
 */
public enum QualificationTypeEnum {
    NONE(0),
    MONEY(1),
    NUM(2);
    private Integer type;
    QualificationTypeEnum(Integer type){
        this.type = type;
    }
    public Integer getType(){
        return type;
    }
}
