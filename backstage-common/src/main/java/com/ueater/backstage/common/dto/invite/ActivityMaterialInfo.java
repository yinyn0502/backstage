package com.ueater.backstage.common.dto.invite;

import com.ueater.backstage.common.model.couponmanage.CouponProductBackstageDTO;
import com.ueater.backstage.common.model.product.ProductListTO;
import lombok.Data;

import java.util.List;

/**
 * Created by zhangjiannan on 2018/5/9.
 */
@Data
public class ActivityMaterialInfo {
    private List<Long> recommendProducts;
    private List<CouponProductBackstageDTO> recommendProductInfos;
    private String shareDescription;
    private String shareImageURL ;
    private String shareTitle ;
}
