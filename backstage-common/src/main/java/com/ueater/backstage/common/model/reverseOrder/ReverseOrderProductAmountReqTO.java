package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.util.List;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 九月 14 2017 上午8:25
 * <p/>
 * 退货商品金额计算请求对象
 */
@Data
public class ReverseOrderProductAmountReqTO {

    private Long reverseId;

    private Long orderId;

    private Long memberId;

    private Integer refundMode;

    private Integer refundReason;

    private List<ReverseOrderProductAmountItemReqTO> productList;

}
