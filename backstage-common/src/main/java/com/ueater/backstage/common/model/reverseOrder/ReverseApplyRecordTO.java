package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.util.List;

/**
 * 退换货申请记录list
 * Created by chengyuxiang on 2017-08-28.
 */
@Data
public class ReverseApplyRecordTO {

    private List<ReverseApplyRecordItemTO> reverseList;//申请记录list
    private Integer currentPage = 1;//当前页数
    private Integer pageCount = 0;//每页几条
    private Integer totalCount = 0;//总条数
}
