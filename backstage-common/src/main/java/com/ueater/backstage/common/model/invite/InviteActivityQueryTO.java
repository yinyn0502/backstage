package com.ueater.backstage.common.model.invite;

import lombok.Data;

/**
 * Created by zhangjiannan on 2018/5/3.
 */
@Data
public class InviteActivityQueryTO {

    private Long storeId;
    private Long activityStartTime;
    private String activityStartTimeStr;
    private Long activityEndTime;
    private String activityEndTimeStr;
    private Long createStartTime;
    private String createStartTimeStr;
    private Long createEndTime;
    private String createEndTimeStr;
    private String createdBy;

    private Integer currentPage;
    private Integer pageCount;

}
