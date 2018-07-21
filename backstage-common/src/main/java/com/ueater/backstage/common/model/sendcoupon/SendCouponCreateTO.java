package com.ueater.backstage.common.model.sendcoupon;

import lombok.Data;

/**
 * Created by chenyuhua on 2018-03-16.
 */
@Data
public class SendCouponCreateTO {
    private Long sendActivityId;//发券活动id(创建时没有)
    private String sendActivityName;//发券活动名称
    private Integer targetType;//目标类型 1.拉新2.沉默激活3.下单奖励4.社群运营5.用户补偿6.品类推广7.目标用户促活8.第三方合作9.其他
    private String createdBy;//创建人
    private String executedBy;//执行人
    private String mobileText;//用户手机号(多个英文逗号分隔)
    private String couponActivityIdInfo;//优惠券活动id值(多个英文逗号分隔)
    private Integer memberSize;//绑劵用戶數量
    private String filePath;
    private String operateType;//操作类型
}

