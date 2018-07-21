package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

@Data
public class ReverseOrderAuditPassParamTO {
    private Long memberId;
    private Long reverseId;
    private Integer isPickup;   // 是否取回退货(0.不取/1.取回)
    private String operator;
}
