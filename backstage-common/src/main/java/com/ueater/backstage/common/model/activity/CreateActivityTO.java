package com.ueater.backstage.common.model.activity;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * Created by mayumeng on 2017-09-29.
 */
@Data
public class CreateActivityTO {

    private String activityDescription;

    private List<ActivityDimensionTO> activityDimensionList;

    private List<ActivityGroupAndExpTO> activityExceptGroupList;

    private List<Long> activityExceptProductIdList;

    private  List<ActivityGroupAndExpTO> activityGroupList;

    private String activityName;

    private List<Long> activityProductIdList;

    private String activitySubName;

    private Long activitySubType;

    private Integer activityType;

    private Long endDate;

    private Long startDate;

    private Long storeId;

    private String createBy;

//    private Long createDate;

    private String updateBy;

//    private Long updateDate;

}
