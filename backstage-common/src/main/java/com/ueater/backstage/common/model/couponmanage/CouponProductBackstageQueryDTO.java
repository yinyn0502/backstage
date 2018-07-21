package com.ueater.backstage.common.model.couponmanage;

import lombok.Data;

import java.util.List;

@Data
public class CouponProductBackstageQueryDTO {

    private Integer pageCount;//每页数量

    private Integer currentPage;//当前页

    private List<Long> storeIdList;

    private List<Long> productIdList;


}
