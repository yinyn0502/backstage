package com.ueater.backstage.common.enums.order;

/**
 * Created by chengyuxiang on 2017-10-27.
 */
public enum OrderBackstageOperationEnum {

    CHECK_DETAIL(1,"查看详情"),
    CONFIRM_PAY(2,"确认收款"),
    INVOICE(3,"开发票"),
    REVERSE(4,"退换货");

    private Integer operationType;
    private String operationName;
    OrderBackstageOperationEnum(Integer operationType,String operationName){
        this.operationType = operationType;
        this.operationName = operationName;
    }

    public Integer getOperationType(){
        return operationType;
    }
    public String getOperationName(){
        return operationName;
    }
}
