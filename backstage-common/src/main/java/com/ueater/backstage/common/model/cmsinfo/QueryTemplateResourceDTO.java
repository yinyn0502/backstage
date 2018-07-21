package com.ueater.backstage.common.model.cmsinfo;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * Created by caoli on 2018/1/23.
 */
@Data
public class QueryTemplateResourceDTO {
    private Long templateId;
    private Long styleCode;
    private String templateName;
    private Long templateTypeId;
    private Map<Long,List<String>> entityMap;
    private List<ModuleInfoDTO> moduleList;
}
