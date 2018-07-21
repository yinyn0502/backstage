package com.ueater.backstage.common.model.product;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 类的详细说明
 *
 * @author duyongqiang
 * @version 1.00
 * @Date 2018/4/8
 */

@Data
public class ProductBackstageTO {
    private Long productId;
    private Long storeId;
    private String storeName;
    private String productName;
    private String subTitle;
    private Double salesInventory;//库存数
    private boolean haveImage;
    private BigDecimal originPrice;
    private String saleStatus;
    private Integer saleStatusType;
}
