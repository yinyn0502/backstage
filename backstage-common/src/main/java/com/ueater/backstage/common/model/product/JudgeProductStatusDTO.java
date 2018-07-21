package com.ueater.backstage.common.model.product;

import lombok.Data;

/**
 * Created by mayumeng on 2018-06-05.
 */
@Data
public class JudgeProductStatusDTO {

    private Long productId;

    private Integer oldSaleStatus;

    private Integer newSaleStatus;

    private Boolean haveImage;

}
