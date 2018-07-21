package com.ueater.backstage.common.model.product;

import com.ueater.backstage.common.model.sendcoupon.BasePagination;
import lombok.Data;

import java.util.List;

/**
 * 类的详细说明
 *
 * @author duyongqiang
 * @version 1.00
 * @Date 2018/4/8
 */

@Data
public class ProductBackstageListDataTO {
    private List<ProductBackstageTO> productListTOList;
    private BasePagination basePagination;
}
