package com.ueater.backstage.common.model.reverseOrder;

import com.ueater.backstage.common.model.payment.RefundCalcResultTO;
import lombok.Data;

import java.util.List;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 九月 14 2017 上午8:26
 * <p/>
 * 退货商品金额计算返回对象
 */
@Data
public class ReverseOrderProductAmountResTO {

    private String takeGoodsHomeExpressFee; // 上门取件运费

    private RefundCalcResultTO refundCalcResult;  // 退款计算结果

    private String totalFinalRefundAmount;  // 最终可退金额
    private String totalProductRefundAmount;    // 退还的商品的总金额

    private String totalRefundAmount;       // 退款总金额

    private String refundExpressRee;        // 退回正向单的运费

    private List<ReverseOrderProductAmountItemResTO> productList;   // 每个item对应的退款金额
}
