package com.ueater.backstage.common.enums.couponmanage;

/**
 * Created by chengyuxiang on 2017/7/27.
 */
public enum qualificationScopeEnum {
    SKU(1),
    ALL(2);
    private Integer scope;
    qualificationScopeEnum(Integer scope){
        this.scope = scope;
    }
    public Integer getScope(){
        return scope;
    }
}
