package com.ueater.backstage.common.model.backstageorder;

import lombok.Data;

import java.util.List;

/**
 * Created by chengyuxiang on 2017-10-26.
 */
@Data
public class BackstageOrderListPageTO {

    private List<BackstageOrderListTO> backstageOrderListTOList;
    private Integer currentPage;//当前页数
    private Integer pageCount;//每页几条
    private Integer totalCount;//总条数

}
