package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 八月 16 2017 下午9:55
 */
@Data
public class ReverseOrderItemTO {

    private Long itemId;

    private Long productId;

    private String productName;

    private BigDecimal price;

    private Integer count;//数量
}
