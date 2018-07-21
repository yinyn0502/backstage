package com.ueater.backstage.common.model.cms;

import lombok.Data;

import java.util.List;

/**
 * Created by zhangjiannan on 2018/1/17.
 */
@Data
public class QueryModuleResourceTO {
    /**
     * module_info表中的位置(针对纯粹味道)
     */
    private Integer sort;

    /**
     * 针对每日抢鲜的开始时间(module_info表)
     */
    private Long startTime;

    /**
     * 针对每日抢鲜的结束时间(module_info表)
     */
    private Long endTime;

    /**
     * module_info表中图片地址(针对纯粹味道)
     */
    private String image;

    /**
     * 模块名字
     */
    private String title;

    /**
     * 最小
     */
    private Integer minimum;

    /**
     * 最大
     */
    private Integer maximum;

    /**
     * 模块id
     */
    private Long moduleId ;

    /**
     * 模块类型
     */
    private Long moduleType;

    /**
     * 模板id
     */
    private Long templateId;

    /**
     * 为什么是List<Object>针对ert说一张图两个targetValue
     */
    private List<CmsResourceInfoTO> resourceInfoDTOS;
}
