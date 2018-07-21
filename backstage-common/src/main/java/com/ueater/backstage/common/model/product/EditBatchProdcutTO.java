package com.ueater.backstage.common.model.product;

import lombok.Data;

import java.util.List;

/**
 * Created by mayumeng on 2018-04-12.
 */
@Data
public class EditBatchProdcutTO {

    // private List<Long> productIds;

    private List<StoreProductTO> storeProductDTOS;

    private EditProductTO editProductDTO;

    private String handler;

}
