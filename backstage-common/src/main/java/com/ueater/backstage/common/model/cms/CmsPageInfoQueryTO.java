package com.ueater.backstage.common.model.cms;

import lombok.Data;

/**
 * Created by chenyuhua on 2018-01-24.
 */
@Data
public class CmsPageInfoQueryTO {
    private Long templateId;
    private Long storeId;
    private String createdBy;
    private String updatedBy;
}
