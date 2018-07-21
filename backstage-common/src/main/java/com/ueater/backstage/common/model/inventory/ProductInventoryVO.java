package com.ueater.backstage.common.model.inventory;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 商品库存Vo
 *
 * @author chengyuxiang
 * @version 1.0.0
 * @date 2017年4月13日上午11:50:12
 */
@Data
public class ProductInventoryVO {

    private Long productId;

    private BigDecimal salesInventory;//销售库存

}
