package com.ueater.backstage.common.model.coupondistribution;

import lombok.Data;

import java.util.List;

/**
 * Created by chenyuhua on 2017-10-12.
 */
@Data
public class CouponDistributeCheckBatchTO {
    private Long activityId;//领券id

    private Long couponActivityId;//礼券id

    private String memberIdList;  //用户id

    private Integer appType;//设备类型

    private Long storeId;   //门店id

    private String createBy;

//    private Long createDate;

    private String updateBy;

//    private Long updateDate;
}
