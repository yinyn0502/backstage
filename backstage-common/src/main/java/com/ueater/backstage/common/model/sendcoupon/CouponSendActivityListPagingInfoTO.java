package com.ueater.backstage.common.model.sendcoupon;

import lombok.Data;

import java.util.List;

/**
 * Created by chengyuxiang on 2018-03-12.
 */
@Data
public class CouponSendActivityListPagingInfoTO {

    private List<CouponSendActivityQueryResTO> list;
    private BasePagination basePagination;
}
