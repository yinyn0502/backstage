package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 八月 21 2017 上午5:49
 */

@Data
public class ReverseOrderItemApportionTO {

    private Long itemId;
    private Long productId;                 // 商品id
    private String productName;             // 商品名称
    private Integer buyCount;               // 购买数量
    private BigDecimal salePrice;           // 商品售价
    private BigDecimal discountAmount;      // 享受优惠
    private Integer alloctCount;            // 实配数量
    private BigDecimal dealAmount;          // 实际成交总价
    private Integer count;                  // 可申请数量(可申请的最大值)
    private BigDecimal price;               // 成交价
    private List<ReverseSpecialProductTO> specialInfo;//特殊商品，影响退换货的信息
}
