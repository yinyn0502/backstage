package com.ueater.backstage.common.model.couponmanage;

import lombok.Data;

/**
 * Created by mayumeng on 2018-03-09.
 */
@Data
public class HandleStatusDTO {

    private Long activityId;

    private String handler;//操作人

    private Integer reviewStatus;

    private String reviewRefuseReason;

    private Integer activitySwitch;

}
