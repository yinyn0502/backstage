package com.ueater.backstage.common.model.activity;

import lombok.Data;

/**
 * Created by zhangjiannan on 2018/5/8.
 */
@Data
public class CouponBaseInfoTO {
    private Long couponId;

    private String couponName;

    private Integer couponCount;

    private String couponStartTimeStr;

    private String couponEndTimeStr;



}
