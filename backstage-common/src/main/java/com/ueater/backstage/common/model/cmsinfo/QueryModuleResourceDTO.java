package com.ueater.backstage.common.model.cmsinfo;


import lombok.Data;

import java.util.List;

/**
 * Created by zhangjiannan on 2018/1/17.
 */
@Data
public class QueryModuleResourceDTO {
    private Integer sort;//module_info表中的位置(针对纯粹味道)

    private Long startTime;//针对每日抢鲜的开始时间(module_info表)
    private Long endTime;//针对每日抢鲜的结束时间(module_info表)

    private String image;//module_info表中图片地址(针对纯粹味道)

    private Integer maximum;//最大
    private Integer minimum;//最小
    private Long moduleId ;//模块id
    private Long moduleType;//模块类型
    private Long templateId;//模板id

    private List<ResourceInfoDTO> resourceInfoDTOS;//为什么是List<Object>针对ert说一张图两个targetValue。
}
