package com.ueater.backstage.common.model.cmsinfo;

import lombok.Data;

import java.util.Date;

/**
 * Created by chenyuhua on 2017-10-19.
 */
@Data
public class CmsAppLaunchScreenInfoDTO {
    private Date startTime;
    private Date endTime;
    private Integer type;
    private Integer countDownTime;
    private String imageUrl;
    private String targetValue;
}
