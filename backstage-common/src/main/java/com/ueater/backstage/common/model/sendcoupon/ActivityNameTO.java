package com.ueater.backstage.common.model.sendcoupon;

import lombok.Data;

import java.io.Serializable;

/**
 * @author liutao
 * @version 1.0.0
 * @date 2017/8/22 18:25
 */
@Data
public class ActivityNameTO implements Serializable {
    private Long activityId;
    private String activityName;
}
