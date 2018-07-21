package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

/**
 * 逆向单申请原因
 */

@Data
public class ReverseReasonVO {
    private Integer type;   // 原因类型
    private String desc;    // 原因描述
}
