package com.ueater.backstage.common.model.cms;

import lombok.Data;

@Data
public class CmsModuleTO {
    private Long moduleId;                      // 模块id
    private CmsResourceInfoTO resourceInfo;
    private Long templateId;                    // 	模板id
}
