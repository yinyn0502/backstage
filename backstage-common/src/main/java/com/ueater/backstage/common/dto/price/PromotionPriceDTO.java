package com.ueater.backstage.common.dto.price;

import lombok.Data;

import java.math.BigDecimal;

/**
 * Created by xurupeng on 2017/7/26.
 */
@Data
public class PromotionPriceDTO {

    private Long storeId;

    private Long productId;

    private Long activityId;

    private BigDecimal promotionPrice;

    private BigDecimal originPrice;

}
