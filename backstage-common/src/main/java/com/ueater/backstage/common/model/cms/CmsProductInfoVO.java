package com.ueater.backstage.common.model.cms;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CmsProductInfoVO {
    private Long id;
    private Long productId;                 // 商品id
    private BigDecimal price;               // 商品价格
    private String productTitle;            // 商品标题
    private String status;                  // 状态
    private String productSubtitle;         // 商品副标题
    private BigDecimal stock;               // 库存
    private String productImage;            // 商品图片
    private Integer sort;                   // 位置
    private String targetValue;             //链接地址
    private String targetTitle;             //目标标题
}
