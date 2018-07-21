package com.ueater.backstage.common.model.coupondistribution;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author liutao
 * @version 1.0.0
 * @date 2018/5/8 16:16
 */
@Data
public class CouponTO {

    private Long couponId;//礼劵ID
    private String couponName;//礼劵名称
    private Integer leftCoupnoNum;//剩余劵数
    private Long startDate;//开始时间
    private String startTime;
    private Long endDate;//结束时间
    private String endTime;
}
