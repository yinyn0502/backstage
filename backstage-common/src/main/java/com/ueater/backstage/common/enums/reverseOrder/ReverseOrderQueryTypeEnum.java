package com.ueater.backstage.common.enums.reverseOrder;

public enum ReverseOrderQueryTypeEnum {

    ALL(0,"全部"),
    TO_AUDIT(1,"待审核"),
    TO_CONFIRM_RECEIPT(2,"待确认退货"),
    TO_REFUND(3,"待确认退款");

    private Integer type;
    private String name;

    ReverseOrderQueryTypeEnum(Integer type, String name) {
        this.type = type;
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public static String getNameByType(Integer type){
        if(type==null){
            return null;
        }
        ReverseOrderQueryTypeEnum[] reverseOrderQueryTypeEnums = ReverseOrderQueryTypeEnum.values();
        for(ReverseOrderQueryTypeEnum reverseOrderQueryTypeEnum:reverseOrderQueryTypeEnums){
            if(reverseOrderQueryTypeEnum.getType().equals(type)){
                return reverseOrderQueryTypeEnum.name;
            }
        }
        return null;
    }
}
