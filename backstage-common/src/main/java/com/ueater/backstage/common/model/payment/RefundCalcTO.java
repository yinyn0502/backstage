package com.ueater.backstage.common.model.payment;

import lombok.Data;

/**
 * @author: liutao
 * @version: 1.0.0
 * @date: 2017/9/4 16:27
 */
@Data
public class RefundCalcTO {
    private Integer payType;
    private String payTypeDesc;
    private String refundAmount;
}
