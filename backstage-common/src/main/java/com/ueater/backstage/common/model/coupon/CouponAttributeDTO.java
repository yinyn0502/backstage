package com.ueater.backstage.common.model.coupon;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by chenyuhua on 2017-10-09.
 */
@Data
public class CouponAttributeDTO {
    private Long activityId;       //活动id

    private Long couponType;       //礼券类型1:商品券,2:现金券,3:运费券

    private Integer benefitType;       //优惠类型:0:减,1:折

    private BigDecimal benefitValue;       //优惠值

    private Integer qualificationType;       //条件类型0:无条件 1:满额 2:满件

    private String qualificationValue;       //条件值

    private Integer continueDate;       //针对领劵当天生效开始计时:持续时间天数

    private Integer count;         //发放数量

    private Integer totalCount;   //发放礼券总数量

    private Integer couponQualificationScope;//礼券条件作用域

    private String couponIntroduce;//礼券介绍

    private String createBy;

//    private Long createDate;

    private String updateBy;

//    private Long updateDate;

}
