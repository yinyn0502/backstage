package com.ueater.backstage.common.model.activity;

import lombok.Data;

import java.util.List;

/**
 * Created by chenyuhua on 2017-10-12.
 */
@Data
public class ActivityVO {
    private String activityDescription;

    private Integer activityDimension;//是否选择活动维度
    private List<Integer> dimensionType;//维度类型值
    private List<Integer> memberLevel;//用户维度
    private List<Integer> platformValue;//平台维护
    private String registerChannel;//注册渠道
//    private List<ActivityDimensionTO> activityDimensionList;

    private String activityExceptGroupList;

    private String activityExceptProductIdList;

    private List<Integer> activityGroupType;
    private String activityCategoryGroupValue;
    private String activityStoreGroupValue;


    private String activityName;

    private String activityProductIdList;

    private String activitySubName;

    private Long activitySubType;

    private Integer activityType;

    private String endDate;

    private String startDate;

    private Long storeId;

    private String createBy;

//    private Long createDate;

    private String updateBy;

//    private Long updateDate;
}
