package com.ueater.backstage.common.model.payment;

import lombok.Data;

import java.util.List;

/**
 * @author: liutao
 * @version: 1.0.0
 * @date: 2017/10/22 19:26
 */
@Data
public class RefundCalcResultTO {

    private String calculateRefundAmount;//预计退回总计金额
    private String deductCreditAmount;//吃货币奖励扣回金额
    private List<RefundCalcTO> refundTOList;//具体退款方式集合

}
