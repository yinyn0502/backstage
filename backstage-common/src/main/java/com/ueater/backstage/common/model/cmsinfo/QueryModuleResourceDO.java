package com.ueater.backstage.common.model.cmsinfo;

import lombok.Data;

import java.util.List;

/**
 * Created by zhangjiannan on 2018/1/24.
 */
@Data
public class QueryModuleResourceDO {
    private Long templateId;
    private List<Long> moduleIds;
}
