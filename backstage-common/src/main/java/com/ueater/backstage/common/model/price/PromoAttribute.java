package com.ueater.backstage.common.model.price;

import lombok.Data;

/**
 * Created by mayumeng on 2017/7/27.
 */
@Data
public class PromoAttribute {
	
	
	private Integer priority;
	
    private Integer promoScope;
    
    private Integer limitScope;

    private Integer limitNumber;

    private Integer overlayStrategy;
    
}
