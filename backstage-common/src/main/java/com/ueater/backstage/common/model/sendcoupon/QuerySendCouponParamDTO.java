package com.ueater.backstage.common.model.sendcoupon;

import lombok.Data;

/**
 * Created by chenyuhua on 2018-03-12.
 */
@Data
public class QuerySendCouponParamDTO {
    private String sendActivityName;//发券活动名称
    private Integer targetType;//目标类型 1.拉新2.沉默激活3.下单奖励4.社群运营5.用户补偿6.品类推广7.目标用户促活8.第三方合作9.其他
    private String createdBy;//创建人
    private String executedBy;//执行人
    private Long couponActivityId;
    private String createStartTime;
    private String createEndTime;
    private String executeStartTime;
    private String executeEndTime;
}
