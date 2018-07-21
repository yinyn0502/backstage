package com.ueater.backstage.common.enums.activity;

/**
 * Created by chenyuhua on 2018-03-12.
 */
public enum MemberLevelEnum {
    ORDINARY_MEMBER(0),
    FAMILY_MEMBER(1),
    ENTERPRISE_MEMBER(2);
    private Integer type;
    MemberLevelEnum(Integer type){
        this.type = type;
    }
    public Integer getType(){
        return type;
    }
}
