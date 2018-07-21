package com.ueater.backstage.common.model.product;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by mayumeng on 2018-04-11.
 */
@Data
public class ProductListTO {

    private Long productId;

    private Long storeId;

    private String productName;

    private String subTitle;

    private Double salesInventory;//库存数

    private Boolean haveImage;

    private BigDecimal originPrice;

    private String saleStatus;//销售状态

}
