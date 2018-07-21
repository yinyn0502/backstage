package com.ueater.backstage.common.model.coupondistribution;

import lombok.Data;

import java.util.List;

/**
 * Created by chenyuhua on 2017-10-14.
 */
@Data
public class AddCouponDistributionRequestDTO {
    private List<AddCouponDistributionDTO> addCouponDistributionDTOList;
}
