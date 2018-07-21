package com.ueater.backstage.common.model.product;

import lombok.Data;

import java.util.List;

/**    
 * @Description:  商品审核查询参数
 * @Author:       ajian   
 * @CreateDate:   2018/6/6 11:46     
 */
@Data
public class QueryReviewProductDTO {

    private Long storeId;

    private List<Long> merchantIds;

    private String merchantName;

    private List<Integer> reviewStatus;

    private List<Long> productIds;

    /**
     * 当前页数
     */
    private Integer pageCount = 1;

    /**
     * 每页显示数量
     */
    private Integer pageSize = 10;

}
