package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by chengyuxiang on 2017-08-28.
 */
@Data
public class ReverseOrderDetailProductInfoTO {
    private Long itemId;
    private Long productId;             // 商品id
    private String productName;         // 商品名称
    private BigDecimal productPrice;    // 商品单价
    private Integer buyCount;           // 购买数量
    private BigDecimal discountAmount; // 优惠
    private BigDecimal dealAmount;      // 成交总价
    private Integer count;              // 申请数量
    private BigDecimal price;           // 退款金额
    private String productSaleAttribute;
}
