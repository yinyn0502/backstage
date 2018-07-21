package com.ueater.backstage.common.model.activity;

import lombok.Data;

/**
 * Created by mayumeng on 2017-09-29.
 */
@Data
public class ActivityDimensionTO {

    private Integer type;   //维度类型,1:用户等级 2:平台 3:渠道

    private Integer value;      //维度值
}
