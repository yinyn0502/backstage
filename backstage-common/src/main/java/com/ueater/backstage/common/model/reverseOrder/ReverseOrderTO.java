package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 八月 16 2017 下午9:30
 */
@Data
public class ReverseOrderTO {
    private Long memberId;//会员id
    private Long storeId;//门店id

    private Long addressId;//取货地址id
    private String consigneeName;//收货人姓名
    private String consigneeMobile;//收货人电话
    private Long orderId;//订单id
    private String reasonDesc;//退款原因描述
    private Integer refundMode;//退货方式
    private Integer refundReason;//退款原因
    private Integer refundType;//0:整单退，1:部分退
    private Long reverseId;//逆向单id
    private Integer reverseType;//0:退货单，1:换货单，2:退款单

    private Integer isPickup;   // 是否取回货品
}
