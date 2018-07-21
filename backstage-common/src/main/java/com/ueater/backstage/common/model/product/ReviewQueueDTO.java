package com.ueater.backstage.common.model.product;

import lombok.Data;

/**
 * Created by mayumeng on 2018-06-04.
 */
@Data
public class ReviewQueueDTO {

    private Long queueId;

    private Integer reviewStatus;

    private String rejectReason;

    private String handler;
}
