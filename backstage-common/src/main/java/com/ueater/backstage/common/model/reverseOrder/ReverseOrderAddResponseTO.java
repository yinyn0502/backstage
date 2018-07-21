package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 八月 17 2017 下午10:46
 */
@Data
public class ReverseOrderAddResponseTO {

    private Long reverseId;             // 逆向单id

    private Long orderId;               // 正向单id

    private Long storeId;               // 门店id

    private Boolean isCanReverse;       // 是否可以申请退换货服务

    private String canNotReverseReason; // 不能申请退换货的原因

    private String consigneeName;       // 收货人姓名

    private String consigneeMobile;     // 收货人电话

    private String address;             // 地址

    private BigDecimal expressCharge;   // 订单运费

    private String takeGoodsHomeDesc;   //上门取件运费描述

    private BigDecimal takeGoodsHomeExpressFee;//上门取货运费

    private List<ReverseServiceVO> reverseServiceList;   // 服务类型(退货/换货/退款/补发)

    private String specialCircumstancesExplanation;     // 退换货特殊情况说明

    private List<RefundModeTO> refundModeList;

    private ReverseOrderApportionTO reverseOrderApportionTO;

    private Boolean isReturnedGoods;   // 是否取回货品
}
