package com.ueater.backstage.common.model.price;

import lombok.Data;

import java.util.List;

/**
 * Created by mayumeng on 2017/7/27.
 */
@Data
public class PromoCalcInfoDTO {

    private Integer autoRoll;

    private Integer maxRollTimes;

    private List<QualificationBenefitDTO> qualificationBenefits;
    
    
}
