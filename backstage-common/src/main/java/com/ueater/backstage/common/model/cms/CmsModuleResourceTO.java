package com.ueater.backstage.common.model.cms;


import lombok.Data;

import java.util.List;

/**
 * Created by zhangjiannan on 2018/1/16.
 */
@Data
public class  CmsModuleResourceTO  {
    /**
     * 模板 id  (update的时候不需要)
     */
    private Long templateId;

    /**
     * 模块id
     */
    private Long moduleId;

    /**
     * 现在的sort
     */
    private Integer sort;

    /**
     * 原来的sort
     */
    private Integer formerSort;

    private Long moduleTypeId;

    /**
     * 针对每日抢鲜的开始时间
     */
    private Long startTime;

    /**
     * 针对每日抢鲜的结束时间
     */
    private Long endTime;

    /**
     * moduleinfo表中
     */
    private String createdBy;

    /**
     * moduleinfo表中
     */
    private String updatedBy;

    private List<CmsResourceInfoTO> resourceInfodto;

    /**
     * 针对纯粹味道的图片地址 两张图地址 以逗号隔开黑色在前，红色在后(仅支持修改,不支持添加)
     */
    private String updateImage;

    /**
     * 更新纯粹味道的标题
     */
    private  String title;
}
