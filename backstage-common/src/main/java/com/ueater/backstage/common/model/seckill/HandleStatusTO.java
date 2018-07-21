package com.ueater.backstage.common.model.seckill;

import lombok.Data;

/**
 * Created by mayumeng on 2018-03-09.
 */
@Data
public class HandleStatusTO {

    private Long activityId;
    private String handler;         // 操作人
    private Integer reviewStatus;   //
    private String reviewRefuseReason;
    private Integer activitySwitch; //
    private Integer activityType;   // 秒杀活动传ActivityTypeEnum.PRICE.getType();

}
