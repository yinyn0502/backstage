package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * 退换货商品信息
 * Created by chengyuxiang on 2017-08-28.
 */
@Data
public class ReverseProductInfoTO {
    private Integer count;//退换货商品数量
    private BigDecimal totalPrice;//预计退款
    private List<Long> productIdList;//商品id
}
