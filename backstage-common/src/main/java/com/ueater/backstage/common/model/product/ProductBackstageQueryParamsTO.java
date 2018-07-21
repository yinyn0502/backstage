package com.ueater.backstage.common.model.product;

import lombok.Data;

import java.util.List;

/**
 * 类的详细说明
 *
 * @author duyongqiang
 * @version 1.00
 * @Date 2018/4/8
 */
@Data
public class ProductBackstageQueryParamsTO {
    private Long storeId;
    private Long categoryId;
    private List<Long> productIds;
    private String productName;
    private Integer saleStatus;
    private Integer pageCount;
    private Integer currentPage;
}
