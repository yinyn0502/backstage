package com.ueater.backstage.common.enums.cms;

/**
 * Created by zhangjiannan on 2018/1/18.
 */
public enum ResourceTypeEnum {
    //1、文字链接2、图片链接3、商品4、商品+图片5、商品+buyer
    TEXT_LINK(1L),
    PHOTO_LINK(2L),
    PRODUCT_LINK(3L),
    PRODUCT_AND_PHOTO(4L),
    PRODUCT_AND_BUYER(5L);



    private Long type;

    ResourceTypeEnum(Long type) {
        this.type = type;
    }

    public Long getType() {
        return type;
    }
}
