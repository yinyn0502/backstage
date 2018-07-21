package com.ueater.backstage.common.model.activity;

import lombok.Data;

import java.util.List;

/**
 * Created by mayumeng on 2017-11-01.
 */
@Data
public class QueryDistributeActivityTO {

    private List<ActivityDimensionTO> activityDimensionTOList;

    private Long storeId;

    private Long activitySubType;

    private Integer activityType;
}
