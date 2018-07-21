package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

@Data
public class ReverseOrderReceiveExceptionTO {
    private Long memberId;
    private Long reverseId;
    private Integer exceptionType;
    private String exceptionDesc;
    private String operator;
}
