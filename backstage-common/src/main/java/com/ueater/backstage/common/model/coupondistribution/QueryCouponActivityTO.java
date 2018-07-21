package com.ueater.backstage.common.model.coupondistribution;

import lombok.Data;

import java.util.List;

/**
 * @author liutao
 * @version 1.0.0
 * @date 2018/5/8 17:55
 */
@Data
public class QueryCouponActivityTO {

    private List<Long> distributeCouponIds;//领劵活动ID集合
}
