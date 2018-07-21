package com.ueater.backstage.common.dto.invite;

import lombok.Data;

import java.util.Date;
import java.util.List;
import java.util.Set;


@Data
public class ShareActivityQueryDTO {

    private Long storeId;//门店id

    private Long activityStartTime;//活动开始时间
    private Date activityStartDate;//活动开始时间

    private Long activityEndTime;//活动结束时间
    private Date activityEndDate;//活动结束时间

    private Long createStartTime;//活动创建时间
    private Date createStartDate;//活动创建时间

    private Long createEndTime;//活动结束时间
    private Date createEndDate;//活动结束时间


    private String createdBy;//创建人

    private Integer currentPage;//开始页
    private Integer startPage;//开始记录数
    private Integer pageCount;//每页条数

    private Set<Long> activitySets;

}
