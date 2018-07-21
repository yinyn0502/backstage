package com.ueater.backstage.common.model.price;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class PriceProductActivityDTO {
    private Map<Long,PromoInfoDTO> ruleActivityInfoMap;//key是activityID,value是对应的促销详细信息
	private List<ProductPriceDTO> productPriceList;//活动id和商品具体维度的
}
