package com.ueater.backstage.common.model.sendcoupon;

import lombok.Data;

/**
 * Created by chenyuhua on 2018-03-16.
 */
@Data
public class SelectCouponTO {
    private Long activityId;

    private String couponName;

    private String createTime;

    private Integer remainNum;

    private Integer couponSelected;
}
