package com.ueater.backstage.common.model.sendcoupon;

import lombok.Data;

/**
 * Created by mayumeng on 2018-03-13.
 */
@Data
public class SelectCouponDTO {

    private Long activityId;

    private String couponName;

    private Long createTime;

    private Integer remainNum;

}
