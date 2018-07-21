package com.ueater.backstage.common.model.cmsinfo;

import lombok.Data;

/**
 * Created by caoli on 2018/1/22.
 */
@Data
public class CmsPageInfoDTO extends AbtractDTO {
    private Long id;
    private Integer appType;
    private String appVersion;
    private Long storeId;
    private String pageType;
    private Long templateId;
    private Long styleCode;
    private Integer status;
}
