package com.ueater.backstage.common.model.backstageorder;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by chengyuxiang on 2017-10-27.
 */
@Data
public class BackstageOrderDetailTO {

    private BackstageOrderBaseInfoTO baseInfo;//订单基本信息
    private BackstageOrderAmountTO orderAmount;//订单金额明细
    private List<BackstageOrderItemTO> orderItemList;//订单商品明细
    private List<BackstageOrderFlowTO> orderFlowList;//订单状态变化
    private List<BackstageOrderOperation> operationList;//订单操作
    private BigDecimal shouldPayAmount; // 应付金额

}
