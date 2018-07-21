package com.ueater.backstage.common.model.activity;

import lombok.Data;

/**
 * Created by chenyuhua on 2018-01-17.
 */
@Data
public class ActivityLimitCountTO {
    private String sheetId;
    private Integer minBuyN;//'最小买大于等于',
    private Integer maxBuyN;//'最多买小于等于',
    private String updateBy;
}
