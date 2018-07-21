package com.ueater.backstage.common.model.price;

import lombok.Data;

/**
 * Created by mayumeng on 2017/7/27.
 */
@Data
public class PromoInfoDTO {

    private String activityName;

    private Long activitySubId;

    private Long startDate;

    private Long endDate;

    private PromoCalcInfoDTO promoCalcInfo;

    private PromoAttribute promoAttribute;

    private String description;


}
