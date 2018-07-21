package com.ueater.backstage.common.model.activity;

import lombok.Data;

import java.util.List;

/**
 * Created by zhangjiannan on 2018/5/8.
 */
@Data
public class CouponInfoTO {
    private Long couponActivityId;//领券活动id

    private List<CouponBaseInfoTO> couponBaseInfoTOS;
}
