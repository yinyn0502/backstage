package com.ueater.backstage.common.model.cms;

import lombok.Data;

import java.util.List;

/**
 * 每日抢鲜
 */

@Data
public class CmsPrereleaseVO {
    private Long moduleId;
    private Integer sort;
    private String startTime;
    private String endTime;
    private List<CmsProductInfoVO> productInfoList;
}
