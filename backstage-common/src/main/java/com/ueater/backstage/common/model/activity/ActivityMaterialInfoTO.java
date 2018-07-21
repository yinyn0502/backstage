package com.ueater.backstage.common.model.activity;

import com.ueater.backstage.common.model.product.ProductListTO;
import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * Created by zhangjiannan on 2018/5/5.
 */
@Data
public class ActivityMaterialInfoTO {
    private List<ProductListTO> recommendProductList;
    private List<Long> recommendProducts;
    private String shareDescription;
    private String shareImageURL ;
    private String shareTitle ;
}
