package com.ueater.backstage.common.model.cmsinfo;


import lombok.Data;

import java.util.List;

/**
 * Created by zhangjiannan on 2018/1/16.
 */
@Data
public class  AddModuleResourceDTO  {
    private Long templateId;  // 模板 id

    private Long moduleId;        //模块id

    private Long moduleTypeId;//模块类型id(针对每日抢鲜)

    private Long startTime;//针对每日抢鲜的开始时间

    private Long endTime;//针对每日抢鲜的结束时间

    private String createdBy;//moduleinfo表中

    private String updatedBy;//moduleinfo表中

    private List<ResourceInfoDTO> resourceInfodto;


}
