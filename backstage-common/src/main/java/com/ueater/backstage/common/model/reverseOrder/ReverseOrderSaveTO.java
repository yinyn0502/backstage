package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.util.List;

/**
 * Created by chengyuxiang on 2017/8/16.
 */
@Data
public class ReverseOrderSaveTO {

    private ReverseOrderTO reverseOrderTO;

    private List<ReverseOrderItemTO> reverseOrderItemTOList;

    private String operator;
}
