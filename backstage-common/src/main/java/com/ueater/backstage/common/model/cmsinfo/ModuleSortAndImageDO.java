package com.ueater.backstage.common.model.cmsinfo;

import lombok.Data;

import java.util.Date;

/**
 * Created by zhangjiannan on 2018/1/17.
 */
@Data
public class ModuleSortAndImageDO {

    private Integer sort;
    private String image;
    private Date startTime;//针对每日抢鲜的开始时间(module_info表)
    private Date endTime;//针对每日抢鲜的结束时间(module_info表)
}
