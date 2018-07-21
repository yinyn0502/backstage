package com.ueater.backstage.common.model.reverseOrder;

import lombok.Data;

import java.util.List;

@Data
public class ReverseOrderDetailTO {

    private Long reverseId;
    private Long orderId;
    private Long memberId;
    private Integer reverseImageCount;//申请单图片数量
    private Integer reverseReason;//申请原因
    private String reverseReasonDesc;//申请原因（枚举描述）
    private String reverseReasonDetail;//申请详细原因

    private Integer reverseStatus;//逆向单状态
    private String reverseStatusName;//逆向单状态名字
    private String reverseStatusDesc;//逆向单状态文案

    private Integer reverseMode;//退换货方式
    private String reverseModeDesc;//退换货方式文案

    private String storeName;//店铺名称

    private Integer reverseType;//服务类型
    private String reverseTypeDesc;//服务类型(退换单类型中文枚举)

    private ReverseOrderDetailAddressInfoTO addressInfo;//用户配送地址信息
    private List<ReverseOrderDetailProductInfoTO> productInfo;//商品信息
    private ReverseOrderDetailPriceInfoTO reversePriceInfo;//退款金额明细
    private ReverseOrderDetailStoreInfoTO storeInfo;//门店信息

    private Integer reverseOrderType; // 逆向单类型(线下餐厅/线上/线下POS)
    private List<ReverseOrderBackstageOperationTO> operationList;    // 页面上显示的操作
    private Integer isPickup;   // 是否取回货品(0.不取回/1.取回)
    private Boolean isShowPickGoods;    // 是否展示取回货品
}
