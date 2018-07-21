package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

/**
 * Created by chengyuxiang on 2017-08-28.
 */
@Data
public class ReverseOrderDetailAddressInfoTO {

    private String address;//详细地址
    private String addressLabel;//地址标签
    private String consigneeMobile;//收货人手机
    private String consigneeName;//收货人姓名
}
