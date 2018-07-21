package com.ueater.backstage.common.model.sendcoupon;

import lombok.Data;

/**
 * Created by chenyuhua on 2018-03-12.
 */
@Data
public class QuerySendCouponParamTO {
    private String sendActivityName;  // 发券活动名称
    private Integer targetType;       // 目标类型 1.拉新2.沉默激活3.下单奖励4.社群运营5.用户补偿6.品类推广7.目标用户促活8.第三方合作9.其他
    private String createdBy;         // 创建人
    private Long createStartTime;     // 创建日期-开始时间
    private String createStartTimeStr;     // 创建日期-开始时间
    private Long createEndTime;       // 创建日期-结束时间
    private String createEndTimeStr;       // 创建日期-结束时间
    private String executedBy;        // 执行人
    private Long executeStartTime;    // 执行日期-开始时间
    private String executeStartTimeStr;    // 执行日期-开始时间
    private Long executeEndTime;      // 执行日期-结束时间
    private String executeEndTimeStr;      // 执行日期-结束时间
    private String couponActivityId;  // 礼券活动id

    private Integer currentPage;      // 当前页
    private Integer pageCount;        // 页面容量

}
