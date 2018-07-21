package com.ueater.backstage.common.model.price;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by mayumeng on 2017/7/27.
 */
@Data
public class PromoBenefitDTO {
    private Integer benefitType;

    private BigDecimal value;
    
}
