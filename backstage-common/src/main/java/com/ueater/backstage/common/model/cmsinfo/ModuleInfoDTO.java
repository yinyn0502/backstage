package com.ueater.backstage.common.model.cmsinfo;

import lombok.Data;

import java.util.List;

/**
 * Created by zhangjiannan on 2018/1/17.
 */
@Data
public class ModuleInfoDTO {

    private Long moduleId;

    private String moduleImage;

    private Long moduleTypeId;

    private Integer sort;

    private String title;

    private Long startTime;//返回给前端的Long型时间戳

    private Long endTime;//返回给前端的Long型时间戳

    private List<ResourceInfoDTO> resourceList;
}
