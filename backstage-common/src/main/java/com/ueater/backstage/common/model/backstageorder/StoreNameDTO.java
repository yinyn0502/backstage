package com.ueater.backstage.common.model.backstageorder;

import com.ueater.backstage.common.model.couponmanage.CouponProductBackstageInfoDTO;
import lombok.Data;

/**
 * Created by xurupeng on 2017/7/28.
 */
@Data
public class StoreNameDTO {

    private Long id;

    private String name;//店名

    private String city;

    private Integer type;//门店类型

    private CouponProductBackstageInfoDTO couponProductBackstageInfoDTO;
}
