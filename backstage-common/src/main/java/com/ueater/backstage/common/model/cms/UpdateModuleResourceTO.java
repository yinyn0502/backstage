package com.ueater.backstage.common.model.cms;

import lombok.Data;

import java.util.List;

/**
 * Created by zhangjiannan on 2018/1/16.
 */
@Data
public class UpdateModuleResourceTO {
    /**
     * 模块id
     */
    private Long moduleId;

    /**
     * 针对纯粹味道的图片地址 两张图地址 以逗号隔开黑色在前，红色在后
     */
    private String updateImage;


    /**
     * 针对每日抢鲜的开始时间(module_info表)
     */
    private Long startTime;

    /**
     * 针对每日抢鲜的结束时间(module_info表)
     */
    private Long endTime;

    /**
     * 针对每日抢鲜的修改(module_info表)
     */
    private String updatedBy;


    private List<CmsResourceInfoTO> resourceInfodto;
}
