package com.ueater.backstage.common.model.cms;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * Created by zhangjiannan on 2018/1/23.
 */
@Data
public class  CmsCreateNewTemplate {
    private Map<Long,Map<Long,List<Long>>> templateIdModuleMap;
}
