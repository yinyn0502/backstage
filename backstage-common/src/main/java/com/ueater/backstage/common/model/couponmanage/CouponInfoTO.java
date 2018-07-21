package com.ueater.backstage.common.model.couponmanage;

import lombok.Data;

import java.util.List;

/**
 * Created by mayumeng on 2018-03-06.
 */
@Data
public class CouponInfoTO {

    private Long couponId;

    private String couponType;

    private List<String> storeNameList;

    private String couponName;

    private String validityString;//有效期

    private String status;

    private String createdBy;

    private Long createTime;

    private String reviewedBy;

    private Long reviewedDate;

    private String reviewRefuseReason;

    private String useChannel;

}
