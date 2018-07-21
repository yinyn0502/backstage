package com.ueater.backstage.common.model.cmsinfo;

/**
 * Created by zhangjiannan on 2018/1/18.
 */
public enum ResourceTypeEnum {
    //1、文字链接2、图片链接3、商品4、商品+图片5、商品+buyer
    TEXT_LINK(1),
    PHOTO_LINK(2),
    PRODUCT_LINK(3),
    PRODUCT_AND_PHOTO(4),
    PRODUCT_AND_BUYER(5);



    private Integer type;

    ResourceTypeEnum(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }
}
