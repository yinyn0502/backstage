package com.ueater.backstage.common.model.price;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class ProductPriceDTO {
	
	private Long productId;

	private Long activitySubId;//活动子类型id(单品类)
	
	private Long activityId;//促销活动ID

	private String activityName;
	
	private BigDecimal originPrice;//原价
	
	private BigDecimal price;//正常售价

	private BigDecimal promotionPrice;//促销价

	private BigDecimal salePrice;//最低价

	private Integer count;

	private List<Long> ruleActivityIds;//活动id集合
}
