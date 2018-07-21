package com.ueater.backstage.common.model.coupondistribution;

import lombok.Data;

import java.util.List;

/**
 * Created by chenyuhua on 2017-10-09.
 */
@Data
public class CouponDistributeCheckBatchDTO {
    private Long activityId;//领券id

    private Long couponActivityId;//礼券id

    private List<Long> memberIdList;  //用户id

    private Integer appType;//设备类型

    private Long storeId;   //门店id

    private Long createBy;

    private Long createDate;

    private Long updateBy;

    private Long updateDate;

}
