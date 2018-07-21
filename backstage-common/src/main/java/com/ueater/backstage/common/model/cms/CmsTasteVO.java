package com.ueater.backstage.common.model.cms;

import lombok.Data;

import java.util.List;

/**
 * 纯粹味道
 */

@Data
public class CmsTasteVO {
    private Long moduleId;
    private Integer sort;
    private String moduleName;    // 模块名字
    List<CmsProductInfoVO> cmsProductInfoList;
}
