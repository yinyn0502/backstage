package com.ueater.backstage.common.model.cms;

import lombok.Data;

import java.util.List;

@Data
public class CmsQueryModuleResourceParamsTO {
    private Long templateId;
    private List<Long> moduleIds;
}
