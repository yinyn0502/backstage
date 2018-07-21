package com.ueater.backstage.common.model.cms;

import lombok.Data;

@Data
public class CmsUpdateTemplateStatusParamsTO {
    private Integer status;
    private Long templateId;
}
