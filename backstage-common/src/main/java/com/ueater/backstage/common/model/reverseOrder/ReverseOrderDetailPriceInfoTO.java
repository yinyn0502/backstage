package com.ueater.backstage.common.model.reverseOrder;

import com.ueater.backstage.common.model.payment.RefundCalcResultTO;
import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by chengyuxiang on 2017-08-28.
 */
@Data
public class ReverseOrderDetailPriceInfoTO {
    private BigDecimal orderExpressCharge;//正向单可退运费
    private BigDecimal expressCharge;//上门取货运费
    private BigDecimal productTotalPrice;//商品总金额
    private BigDecimal totalPrice;//合计
    private RefundCalcResultTO refundResult; // 退款明细
}
