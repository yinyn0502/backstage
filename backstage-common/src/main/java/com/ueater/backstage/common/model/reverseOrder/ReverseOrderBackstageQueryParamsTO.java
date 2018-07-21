package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.util.List;

/**
 * 用于后台查询逆向单列表传参
 */

@Data
public class ReverseOrderBackstageQueryParamsTO {
    private Long memberId;  // 会员id
    private Integer queryType;  // 查询类型
    private Long storeId;   // 门店
    private String memberPhone; //会员手机号
    private List<String> reverseIdList; // 申请单id集合
}
