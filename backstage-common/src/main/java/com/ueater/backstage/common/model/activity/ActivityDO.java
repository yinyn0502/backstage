package com.ueater.backstage.common.model.activity;

import com.ueater.backstage.common.AbtractDO;
import lombok.Data;

import java.util.Date;

/**
 * Created by chengyuxiang on 2017/7/14.
 */
@Data
public class ActivityDO extends AbtractDO {
    private String sheetId;
    private Long storeId;// '店铺id',
    private String activityName;// '活动名称',
    private String activitySubName;//活动副标题
    private String activityTag;// '活动标签，商家可自定义活动标签',
    private String description;
    private Integer activityType;// '活动类型，促销活动1',
    private Long activitySubType;// '活动子类型id',
    private Integer reviewStatus;//'审核状态，9999, "全部"，0, "待审核"，1, "审核未通过"，2,"审核通过"',
    private Integer activityStatus;//'活动状态 0, "未开始"、1, "进行中"、2, "已结束"',
    private Date reviewChangedDate;//审核更新时间
    private Long startDate;//'开始时间',
    private Long endDate;//'结束时间',
    private String reviewedBy;
    private String reviewRefuseReason;
    private Integer isBudget;//是否预算内

}
