package com.ueater.backstage.common.model.cms;

import lombok.Data;

/**
 * Created by zhangjiannan on 2018/1/15.
 */
@Data
public class HomePageLabelDTO {
    private Integer appType;
    private String appVersion;
    private Integer priority;
    private Integer storeId;
    private String labelName ;
    private Integer targetType;
    private String targetValue;

}
