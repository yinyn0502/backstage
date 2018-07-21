package com.ueater.backstage.common.model.backstageorder;

import lombok.Data;

/**
 * Created by chengyuxiang on 2017-10-27.
 */
@Data
public class BackstageOrderBaseInfoTO {
    private Long orderId;
    private Long memberId;
    private String memberName;  // 下单用户
    private Integer orderType;  // 订单类型
    private String storeName;   //
    private String channel;     // 渠道
    private String status;
    private String orderCreateTime; // 下单时间
    private String payedTime;       // 支付时间
    private String deliveryTime;    // 送达时间
    private String invoiceContent;  // 发票的头
    private String taxpayerNumber;  // 税号
}
