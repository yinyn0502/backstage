package com.ueater.backstage.common.model.backstageorder;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by chengyuxiang on 2017-10-26.
 */
@Data
public class BackstageOrderListTO {
    private Long storeId;
    private String storeName;       // 门店名称
    private String orderChannel;    // 订单渠道
    private Long orderId;           // 订单id
    private Integer orderType;      // 订单类型
    private String memberName;      // 会员名称
    private String bargainAmount;   // 订单成交金额(已减优惠)
    private String memberPointPayed;// 会员积分抵扣金额
    private String cashCouponAmount;// 现金券支付金额
    private String giftCardPayed;   // 礼品卡支付金额
    private String otherPayed;      // 其他方式支付
    private String payType;         // 支付方式
    private String status;          // 订单状态
    private String orderCreateTime; // 订单提交时间
    private List<BackstageOrderOperation> operationList;    // 操作
    private Long memberId;              // 会员
    private List<Long> productIdList;   // 商品id
    private BigDecimal shouldPayAmount; // 应付金额
}
