package com.ueater.backstage.common.model.backstageorder;

import lombok.Data;

/**
 * Created by chengyuxiang on 2017-10-27.
 */
@Data
public class BackstageOrderAmountTO {

    /**
     * a商品成交金额，单品成交价＊数量
     */
    private String totalAmount;

    /**
     * b商品优惠总金额，sum（集合促销优惠金额）＋sum（商品类型优惠券金额），前台展示带负号展示
     */
    private String benefitAmount;

    /**
     * c运费金额
     */
    private String expressCharge;

    /**
     * d运费优惠,后面需要跟上优惠原因（前台展示带负号展示）
     */
    private String expressChargeDeduct;

    /**
     * 订单成交总金额，a－b＋c－d
     */
    private String bargainAmount;

    /**
     * 现金劵
     */
    private String cashCouponAmount;

    /**
     * 积分支付
     */
    private String memberPointAmount;

    /**
     * 其他支付方式
     */
    private String otherPayAmount;

    /**
     * 集合促销
     */
    private String promoDiscount;

    /**
     * 单品手工折扣
     */
    private String singleManualDiscount;

    /**
     * 整单手工折扣
     */
    private String wholeManualDiscount;

    /**
     * 商品优惠券
     */
    private String couponDiscount;

}

