package com.ueater.backstage.common.model.coupondistribution;

import lombok.Data;

import java.util.List;

/**
 * @author liutao
 * @version 1.0.0
 * @date 2018/5/8 15:48
 */
@Data
public class DistributeActivityQueryTO {

    private Long storeId;//门店ID
    private Long startTime;
    private Long endTime;
    private List<Long> distributeActivityIds;//领劵活动ID集合
}
