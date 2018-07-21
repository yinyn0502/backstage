package com.ueater.backstage.common.model.seckill;

import lombok.Data;

/**
 * Created by chenyuhua on 2018-03-22.
 */
@Data
public class SeckillActivityQueryTO {

    private Long storeId;
    private String activityName;
    private Long activityStartTime;
    private String activityStartTimeStr;
    private Long activityEndTime;
    private String activityEndTimeStr;
    private Long createStartTime;
    private String createStartTimeStr;
    private Long createEndTime;
    private String createEndTimeStr;
    private String createdBy;
    private Long productId;

    private Integer currentPage;
    private Integer pageCount;


}
