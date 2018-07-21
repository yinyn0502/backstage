package com.ueater.backstage.common.model.coupondistribution;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author liutao
 * @version 1.0.0
 * @date 2018/5/8 15:48
 */
@Data
public class DistributeActivityInfoTO {

    private Long distributeActivityId;//领劵活动ID
    private List<CouponTO> couponTOList;//礼劵集合
    private BigDecimal distributeActivityTotalValue;//领劵活动总价值
    private String step;

}
