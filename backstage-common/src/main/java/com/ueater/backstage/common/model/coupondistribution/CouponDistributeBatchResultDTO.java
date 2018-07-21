package com.ueater.backstage.common.model.coupondistribution;

import lombok.Data;

import java.util.List;

/**
 * Created by chenyuhua on 2017-10-09.
 */
@Data
public class CouponDistributeBatchResultDTO {
    private List<Long> successMemberIdList;
    private List<Long> failMemberIdList;
}
