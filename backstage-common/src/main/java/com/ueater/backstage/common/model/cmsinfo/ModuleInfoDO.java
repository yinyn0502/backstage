package com.ueater.backstage.common.model.cmsinfo;

import lombok.Data;

import java.util.Date;

/**
 * Created by zhangjiannan on 2018/1/18.
 */
@Data
public class ModuleInfoDO {
    private Long id;//模块id

    private Long templateId;  // 模板 id

    private Long moduleTypeId;//模块类型id

    private Date startTime;//针对每日抢鲜的开始时间

    private Date endTime;//针对每日抢鲜的结束时间

    private String createdBy;//moduleinfo表中

    private String updatedBy;//moduleinfo表中
}
