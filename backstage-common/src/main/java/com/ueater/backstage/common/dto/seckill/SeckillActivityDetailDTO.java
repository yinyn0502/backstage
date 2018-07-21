package com.ueater.backstage.common.dto.seckill;

import lombok.Data;

import java.util.List;

@Data
public class SeckillActivityDetailDTO {

    private Long activityId;//活动id

    private String lastOperator;//最后操作人

    private String lastTime;//最后操作时间

    private Long storeId;//门店id

    private String storeName;//门店名称

    private Integer storeType ; //门店类型

    private String seckillName;//场次名称

    private String oldStartTime;//开始时间

    private String oldEndTime;//结束时间

    private String startTime;//开始时间

    private String endTime;//结束时间

    private String pageTitle;//页面标题

    private String shareTitle;//分享标题

    private String shareDescribe;//分享描述

    private String shareImage;//分享小图

    private String bannerImage;//banner图片

    private com.ueater.backstage.common.model.sendcoupon.BasePagination basePagination;

    private List<SeckillActivityProductDTO> seckillActivityDTOList;

}
