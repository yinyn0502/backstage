package com.ueater.backstage.common.enums.payment;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 六月 13 2017 下午8:30
 * <p>
 * 支付方式
 */
public enum PaymentTypeEnum {

    DEDUCT_TOTAL_POINT(-13, "退款扣除积分奖励总额"),//退款扣除积分奖励总额
    DEDUCT_POINT(-12, "还需扣除积分奖励金额"),//扣除
    OFFLINE_CARD(0, "线下银联刷卡"),//线下银联刷卡
    OFFLINE_WECHAT_BARCODE(2, "线下微信"),//线下微信
    OFFLINE_ALIPAY_BARCODE(3, "线下支付宝"),//线下支付宝
    OFFLINE_CASH(5, "线下现金"),//线下现金
    ONLINE_WECHAT(6, "线上微信"),//线上微信
    ONLINE_ALIPAY(7, "线上支付宝"),//线上支付宝
    GIFTCARD(10, "礼品卡"),//礼品卡
    CASH_COUPON(11, "现金劵"),//现金劵
    POINT(12, "积分"),//积分
    COUPON(13, "商品劵&运费劵");//商品劵&运费劵

    private Integer type;
    private String desc;

    PaymentTypeEnum(Integer type, String desc) {
        this.type = type;
        this.desc = desc;
    }

    public Integer getType() {
        return type;
    }

    public static String getDescByType(Integer type) {
        if (type == null) {
            return null;
        }
        PaymentTypeEnum[] paymentTypeEnums = PaymentTypeEnum.values();
        for (PaymentTypeEnum paymentTypeEnum : paymentTypeEnums) {
            if (paymentTypeEnum.getType().equals(type)) {
                return paymentTypeEnum.desc;
            }
        }
        return null;
    }
}
