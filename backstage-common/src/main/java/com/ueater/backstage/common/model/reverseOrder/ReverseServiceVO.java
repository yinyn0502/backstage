package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.util.List;

/**
 * 退换货申请页-申请服务
 */

@Data
public class ReverseServiceVO {
    private Integer type;       // 退换货服务类型
    private String serviceName; // 退换货服务名称
    private List<ReverseReasonVO> reasonList; // 申请原因
}
