package com.ueater.backstage.common.dto.invite;

import com.ueater.backstage.common.model.coupondistribution.CouponTO;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by mayumeng on 2018-05-07.
 */
@Data
public class CreateShareActivityDTO {

    private Long activityId;

    private Long activityEndTime;

    private Long activityStartTime;

    private String activityStartTimeStr;
    private String activityEndTimeStr;

    private String handler;

    private Long handleTime;

    private String handleTimeString;

    private Long newUserBenefitId;   //新用户邀请专享券对应领券id

    private List<CouponTO> couponTOList;//礼劵集合

    private BigDecimal newUserAwardValue; //价值

    private Long storeId;

    private String storeName;

    private String activityIntroduce;

    private ActivityMaterialInfo activityMaterialInfo;

    private String activityName;

    private List<ShareActivityRuleDTO> activityRuleList;

    private ShareActivityRuleDTO activityRule1;
    private ShareActivityRuleDTO activityRule2;
    private ShareActivityRuleDTO activityRule3;

    public boolean check() {
        if (activityStartTime == null ) {
            return false;
        }
        if (activityEndTime != null ) {
            return false;
        }
        if (handler == null) {
            return false;
        }
        if (storeId == null) {
            return false;
        }
        if (activityRuleList == null || activityRuleList.size()==0) {
            return false;
        }
        return true;
    }
}
