package com.ueater.backstage.common.model.price;

import lombok.Data;

import java.util.List;

/**
 * Created by chengyuxiang on 2017/7/14.
 * <p/>
 * 商品维度对象
 */
@Data
public class ProductDimensionCategoryDTO {

    private Integer type;//product:sku,cate,store

    private List<SpuCategoryDTO> value;//product_id，cate_id，store_id

    private Long storeId;//storeId 当维度是store时，该字段为空
}
