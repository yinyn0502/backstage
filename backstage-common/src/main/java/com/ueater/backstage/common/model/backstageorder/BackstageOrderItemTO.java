package com.ueater.backstage.common.model.backstageorder;

import lombok.Data;

/**
 * Created by chengyuxiang on 2017-10-27.
 */
@Data
public class BackstageOrderItemTO {

    private Long productId;
    private String productName;
    private String price;//商品单价
    private Integer orderCount;//购买数量
    private String benefitAmount;//享受优惠：该商品享受的集合级促销＋商品优惠券的分摊金额总和
    private String bargainAmount;//实际成交总价＝price*orderCount-benefitAmount
    private String bargainPrice;//成交单价=实际成交总价／购买数量，向下取整
    private Integer allotCount;//实配数量
}
