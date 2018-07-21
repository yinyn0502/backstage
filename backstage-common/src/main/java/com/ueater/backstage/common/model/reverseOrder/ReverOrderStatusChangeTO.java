package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

@Data
public class ReverOrderStatusChangeTO {
    private Long memberId;
    private Long reverseId;
    private String operator;
}
