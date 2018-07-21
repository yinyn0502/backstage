package com.ueater.backstage.common.enums.reverseOrder;

/**
 * 后台系统 逆向单列表页 操作枚举
 */

public enum ReverseBackstageOperationEnum {

    AUDIT_PASS(0, "审核通过"),
    AUDIT_DENY(1, "审核不通过"),
    COMFIRM_GOODS(2, "客服确认收货"),
    COMFIRM_GOODS_EXCEPTION(3, "客服确认收货异常"),
    AUDIT_REFUND_PASS(4, "退款审核通过"),
    AUDIT_REFUND_DENY(5, "退款审核拒绝");

    private Integer type;
    private String desc;

    ReverseBackstageOperationEnum(Integer type, String desc) {
        this.type = type;
        this.desc = desc;
    }

    public Integer getType() {
        return type;
    }

    public String getDesc() {
        return desc;
    }

    public static String getDescByType(Integer type) {
        if (type == null) {
            return null;
        }
        ReverseBackstageOperationEnum[] refundModeEnums = ReverseBackstageOperationEnum.values();
        for (ReverseBackstageOperationEnum refundModeEnum : refundModeEnums) {
            if (refundModeEnum.getType().equals(type)) {
                return refundModeEnum.desc;
            }
        }
        return null;
    }
}
