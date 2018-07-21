package com.ueater.backstage.common.model.backstageorder;

import lombok.Data;

/**
 * Created by chengyuxiang on 2017-10-26.
 */
@Data
public class BackstageOrderListQueryTO {

    private Long storeId;
    private Long memberPhone;//会员手机号
    private String memberCardId;//会员卡id
    private String orderId;//订单id，用逗号分割
    private Integer status;//订单状态
    private Integer channel;//订单渠道
    private String startTime;//开始时间
    private String endTime;//结束时间
    private Integer currentPage;
    private Integer pageCount;
}
