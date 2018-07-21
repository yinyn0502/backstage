package com.ueater.backstage.common.enums.reverseOrder;

public enum ReverseOrderReceiveExceptionEnum {
    BREAKAGE(1, "收到商品有破损"),
    QUANTITY_DISCREPANCY(2, "收到商品数量与实际申报不符");

    private Integer type;
    private String desc;

    ReverseOrderReceiveExceptionEnum(Integer type, String desc) {
        this.type = type;
        this.desc = desc;
    }

    public Integer getType() {
        return type;
    }

    public String getDesc() {
        return desc;
    }
}
