package com.ueater.backstage.common.model.couponmanage;

import lombok.Data;

import java.util.List;

/**
 * Created by mayumeng on 2018-03-06.
 */
@Data
public class QueryCouponInfoDTO {

    private Boolean haveCondition;      //是否带有查询条件

    private Integer couponType;

    private Long couponId;

    private String couponName;

    private Integer isBudget;      //以上四条都是coupon自身属性,如果查询条件包含以上三条,那么先从礼券系统自身查询

    private Long usableStartTime;

    private Long usableEndTime;

    private String createdBy;

    private Long createStartTime;

    private Long createEndTime;

    private String reviewedBy;

    private Long reviewStartTime;

    private Long reviewEndTime;

    private Long status;

    private Long storeId;

    private Long categoryId;

    private List<Long> productIds;

    private List<Integer> useChannel;

    private Integer currentPage;

    private Integer pageCount;

    private List<Long> activityIds;
}
