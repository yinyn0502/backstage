package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * 退换货申请记录
 * Created by chengyuxiang on 2017-08-28.
 */

@Data
public class ReverseApplyRecordItemTO {

    private Integer type;                               // 单据类型
    private Boolean isCanRefund;                        // 是否有退款
    private Long reverseId;                             // 逆向单id
    private ReverseProductInfoTO reverseProductInfo;    // 退换货商品信息
    private Integer reverseStatus;                      // 退换货单状态
    private Integer reverseOrderType;                   // 退换货单类型 0:线下餐厅单，1:线上，2:线下pos
    private String reverseStatusName;                   // 退换货单状态name
    private String reverseStatusDesc;                   // 提示信息
    private Long reverseStatusTime;                     // 最新状态时间
    private String sReverseStatusTime;                  // 最新状态时间
    private BigDecimal totalRefundPrice;                // 可退金额
    private Long storeId;                               // 门店id
    private String storeName;                           // 门店名称
    private String username;                            // 用户名称
    private Long createTime;                            // 创建时间
    private String screateTime;
    private ReverseOrderOperationTO reverseOrderOperationTO;    // 最新操作
    private List<Long> productIds;                      // 正向单商品id集合
    private String operationName;                       // 操作名称
}
