package com.ueater.backstage.common.response;

import com.ueater.tool.response.IResponseCode;

public enum BackstageResponseCode implements IResponseCode {

    PRODUCT(40000, "", ""),
    PRODUCT_CAN_NOT_CHANGE_STOPSAIL_ERP(40001, "product_can_not_change_stopsail_erp", "中台不可以操作ERP不可售商品!"),
    PRODUCT_LACK_IMAGE_CAN_NOT_CHANGE_STATUS(40002, "product_can_not_change_status_merchant", "商品缺少图片无法修改为:"),
    PRODUCT_HAVE_NO_IMAGE(40003, "product_have_no_image", "商品无图只能改为仅线下!"),
    PRODUCT_DO_NOT_CHANGE(40004,"product_do_not_change","商品状态没有更改!");

    private Integer code;

    private String message;

    private String desc;

    BackstageResponseCode(Integer code, String message, String desc) {
        this.code = code;
        this.message = message;
        this.desc = desc;
    }

    @Override
    public Integer getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    @Override
    public String getDesc() {
        return desc;
    }
}
