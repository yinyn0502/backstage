package com.ueater.backstage.common.enums.cms;

/**
 * Created by zhangjiannan on 2018/1/18.
 */
public enum PageTypeEnum {
    INDEX("index"),
    ACTIVITY("activity");
    private String type;

    PageTypeEnum(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }
}
