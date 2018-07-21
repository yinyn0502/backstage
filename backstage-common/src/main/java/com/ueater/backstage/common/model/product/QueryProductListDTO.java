package com.ueater.backstage.common.model.product;

import lombok.Data;

import java.util.List;

/**
 * Created by mayumeng on 2018-04-11.
 */
@Data
public class QueryProductListDTO {

    private Long storeId;

    private Long categoryId;

    private List<Long> productIds;

    private String productName;

    private Integer saleStatus;

    private Integer currentPage;

    private Integer pageCount;

}
