package com.ueater.backstage.common.enums.couponmanage;

/**
 * Created by chenyuhua on 2017/7/15.
 */
public enum ProductGroupTypeEnum {
    CATEGORY_GROUP(1),
    STORE_GROUP(2);

    private Integer groupType;
    ProductGroupTypeEnum(Integer groupType){
        this.groupType = groupType;
    }
    public Integer getGroupType(){
        return groupType;
    }
}
