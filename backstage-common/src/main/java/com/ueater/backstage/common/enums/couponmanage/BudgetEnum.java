package com.ueater.backstage.common.enums.couponmanage;

/**
 * Created by mayumeng on 2018-03-06.
 */
public enum BudgetEnum {

    // NO_LIMIT(0, "不限制"),

    IN_BUDGET(1, "预算内"),

    OUT_BUDGET(2, "非预算内");

    private Integer status;
    private String names;
    BudgetEnum(Integer status, String names){
        this.status = status;
        this.names = names;
    }
    public Integer getStatus(){
        return  status;
    }

    public String getNames() {
        return names;
    }
}
