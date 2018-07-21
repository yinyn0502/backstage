package com.ueater.backstage.common.dto.seckill;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class SeckillActivityProductDTO {

    private Long productId;//商品id

    private String productName;//商品名称

    private String saleStatus;//销售状态

    private Double salesInventory;//库存数

    private BigDecimal salePrice;//正常售价

    private BigDecimal activityPrice;//活动价

    private Double activityInventory;//活动库存

    private Integer limitCount;//限购数

    private Integer sort;//排序

}
