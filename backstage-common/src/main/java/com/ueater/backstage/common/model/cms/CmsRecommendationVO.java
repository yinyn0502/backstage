package com.ueater.backstage.common.model.cms;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 买手推荐
 */

@Data
public class CmsRecommendationVO {
    private Long id;
    private Integer sort;       // 位置
    private String buyer;       // 买手名称
    private String headImage;   // 头像图
    private String document;    // 文案
    private Long productId;     // 商品ID
    private String productImage;// 商品图
    private BigDecimal price;   // 价格
    private String productTitle;// 商品名称
    private String productSubTitle;// 商品副名称
    private String status;      // 商品销售状态
    private BigDecimal stock;   // 可售库存
    private Boolean isMore;
    private String filePath;
    private String title;
}
