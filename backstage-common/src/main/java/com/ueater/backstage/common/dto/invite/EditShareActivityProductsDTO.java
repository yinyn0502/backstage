package com.ueater.backstage.common.dto.invite;

import lombok.Data;

import java.util.List;

/**
 * Created by mayumeng on 2018-05-08.
 */
@Data
public class EditShareActivityProductsDTO {

    private Long activityId;

    private List<Long> productIdLists;

}
