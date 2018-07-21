package com.ueater.backstage.common.dto.invite;

import com.ueater.backstage.common.model.coupondistribution.CouponTO;
import com.ueater.backstage.common.model.coupondistribution.DistributeActivityInfoTO;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by zhangjiannan on 2018/5/9.
 */
@Data
public class ShareActivityRuleDTO {
    private Long awardBenefitId; //奖励领券活动id
    private BigDecimal awardBenefitValue; //奖励领券活动价值
    private List<CouponTO> couponTOList;//礼劵集合
    private Integer awardQualificationCeil;
    private Integer awardQualificationFloor ;
    private Integer step ;

}
