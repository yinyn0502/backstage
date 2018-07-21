package com.ueater.backstage.common.dto.product;

import lombok.Data;

import java.util.List;

/**
 * Created by xurupeng on 2017/9/21.
 */
@Data
public class StoreProductQueryDTO {

    private Long storeId;

    private List<Long> productIdList;

}

