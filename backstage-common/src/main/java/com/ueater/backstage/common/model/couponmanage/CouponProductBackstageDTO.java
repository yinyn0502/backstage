package com.ueater.backstage.common.model.couponmanage;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CouponProductBackstageDTO {

    private String storeName;//门店名称

    private Long productId;//商品id

    private String productName;//商品名称

    private Boolean existPromo;//是否有促销

    private String saleStatus;//销售状态

    private BigDecimal salePrice;//当前售价

    private Double salesInventory;//库存数

    private Long storeId;  //门店Id

}
