package com.ueater.backstage.common.dto.price;

import lombok.Data;

import java.util.List;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 八月 25 2017 下午6:41
 * <p>
 * 门店商品价格查询对象
 */

@Data
public class StoreProductPriceTO {

    private List<Long> productIds;

    private Long storeId;
    
    private Long activityId;

}
