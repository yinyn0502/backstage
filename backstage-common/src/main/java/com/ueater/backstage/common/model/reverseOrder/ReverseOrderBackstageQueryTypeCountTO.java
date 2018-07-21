package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.util.List;


@Data
public class ReverseOrderBackstageQueryTypeCountTO {
    private List<ReverseOrderBackstageQueryTypeCountItemTO> queryTypeCount;
}
