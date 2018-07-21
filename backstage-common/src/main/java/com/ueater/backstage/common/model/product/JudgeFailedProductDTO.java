package com.ueater.backstage.common.model.product;

import lombok.Data;

/**
 * Created by mayumeng on 2018-06-05.
 */
@Data
public class JudgeFailedProductDTO {

    private Long productId;

    private String failedReason;

    private Integer oldSaleStatus;

    private Integer newSaleStatus;

    private Boolean haveImage;

    private Integer goodsSaleStatus;//商品对应大码销售状态

}
