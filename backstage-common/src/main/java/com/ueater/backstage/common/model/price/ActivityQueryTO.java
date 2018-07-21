package com.ueater.backstage.common.model.price;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * Created by chengyuxiang on 2017/7/14.
 * <p/>
 * 活动查询对象
 */
@Data
public class ActivityQueryTO {

    private Integer activityType;//活动类型（1促销，2礼券.3价格） // 3

    private ProductDimensionCategoryDTO productDimensionCategoryDTO;//商品维度

    private List<MemberDimensionTO> memberDimensionDTOList;//用户维度   null

    private Integer status; // 0

    private Date startTime; // null

    private Date endTime;   // null

}
