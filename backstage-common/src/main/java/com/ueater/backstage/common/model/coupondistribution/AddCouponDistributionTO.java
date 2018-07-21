package com.ueater.backstage.common.model.coupondistribution;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by chenyuhua on 2017-10-14.
 */
@Data
public class AddCouponDistributionTO {
    private Long activityId;

    private String couponActivityId;

    private Integer maxCountLimit;

    private Integer dailyMaxCountLimit;

    private Integer costType;

    private BigDecimal cost;

    private Integer distributeMemberCount;

    private Integer distributeMemberRestrictionType;

    private String createBy;


    private String updateBy;
}
