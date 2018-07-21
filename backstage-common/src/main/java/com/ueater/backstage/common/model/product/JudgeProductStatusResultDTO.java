package com.ueater.backstage.common.model.product;

import lombok.Data;

import java.util.List;

/**
 * Created by mayumeng on 2018-06-05.
 */
@Data
public class JudgeProductStatusResultDTO {

    private List<Long> verifiableProductIds;

    private List<JudgeFailedProductDTO> judgeFailedProductDTOS;

}
