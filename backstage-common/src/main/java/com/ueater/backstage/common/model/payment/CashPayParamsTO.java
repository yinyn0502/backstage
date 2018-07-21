package com.ueater.backstage.common.model.payment;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CashPayParamsTO {
    private BigDecimal amount;  // 支付金额
    private Long orderId;       // 订单ID
    private Integer payType;    // 支付方式0:线下银联刷卡 5:线下现金
    private String requestNo;   // 请求号
    private Integer orderType;   // 订单类型
}
