package com.ueater.backstage.common.model.couponmanage;

import lombok.Data;

import java.util.List;

@Data
public class IndustryCategoryQueryDTO {

    private List<Long> industryCategoryIdList;

    private List<String> industryCategoryPathList;

}
