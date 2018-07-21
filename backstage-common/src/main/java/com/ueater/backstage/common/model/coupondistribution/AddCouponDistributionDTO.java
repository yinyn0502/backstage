package com.ueater.backstage.common.model.coupondistribution;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 七月 16 2017 下午12:38
 */
@Data
public class AddCouponDistributionDTO {

    private Long activityId;

    private List<Long> couponActivityId;

    private Integer maxCountLimit;

    private Integer dailyMaxCountLimit;

    private Integer costType;

    private BigDecimal cost;

    private Integer distributeMemberCount;

    private Integer distributeMemberRestrictionType;

    private String createBy;


    private String updateBy;

}
