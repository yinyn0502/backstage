package com.ueater.backstage.common.model.activity;

import com.ueater.backstage.common.model.coupondistribution.CouponTO;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by zhangjiannan on 2018/5/5.
 */
@Data
public class ActivityRuleTO {
    private Long awardBenefitId; //奖励领券活动id
    private BigDecimal awardBenefitValue; //奖励领券活动价值
    private List<CouponTO> couponTOList;//礼劵集合
    private Integer awardQualificationCeil;
    private Integer awardQualificationFloor ;
    private Integer step ;
}
