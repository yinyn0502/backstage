package com.ueater.backstage.common.enums.cms;

/**
 * Created by zhangjiannan on 2018/1/15.
 */
public enum TargetTypeEnum {
    WEBPAGE_self(1),//当前页打开H5
    NATIVE_SELF(2),//当前页打开本地页
    WEBPAGE_NEW(3),//新页打开H5
    NATIVE_NEW(4);//新页打开本地页
    private Integer type;

    TargetTypeEnum(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

}
