package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;


@Data
public class ReverseOrderOperationTO {
    private Integer operationType;  // 操作类型
    private String operationName;   // 操作名称
    private String updateBy;        // 操作人
    private Long updateTime;        // 操作时间
    private String supdateTime;

}
