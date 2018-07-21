package com.ueater.backstage.common.model.couponmanage;

import com.google.common.collect.Lists;


import com.ueater.backstage.common.dto.member.BasePagination;
import lombok.Data;

import java.util.List;

/**
 * Created by mayumeng on 2018-03-06.
 */
@Data
public class CouponInfoPageTO {

    private List<CouponInfoTO> couponInfoTOList = Lists.newArrayList();

    private BasePagination basePagination = new BasePagination();

}
