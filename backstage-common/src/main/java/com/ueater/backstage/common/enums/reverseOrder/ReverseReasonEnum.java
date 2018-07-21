package com.ueater.backstage.common.enums.reverseOrder;

/**
 * 退换货服务的申请原因
 */

public enum ReverseReasonEnum {

    QUALITY_QUESTION_RETURN(0, "商品质量有问题"),
    COMMODITY_PACKING_DAMAGE(1, "商品包装破损"),
    GOODS_SHIPPED_WRONG(2, "商品发错货"),
    INCONSISTENT_WITH_DESCRIPTION(3, "商品与描述不符"),
    NO_REASON(4, "七天无理由退货"),
    RECEIVE_NO_GOODS(5, "未收到商品");

    private Integer type;
    private String reason;

    ReverseReasonEnum(Integer type, String reason) {
        this.type = type;
        this.reason = reason;
    }

    public Integer getType() {
        return type;
    }

    public String getReason() {
        return reason;
    }

    public static String getReason(Integer type) {
        ReverseReasonEnum[] reverseReasonEna = ReverseReasonEnum.values();
        for (ReverseReasonEnum reverseReasonEnum : reverseReasonEna) {
            if (reverseReasonEnum.getType().equals(type)) {
                return reverseReasonEnum.reason;
            }
        }
        return null;
    }
}
