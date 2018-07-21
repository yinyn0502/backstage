package com.ueater.backstage.common.enums.cms;

/**
 * Created by zhangjiannan on 2018/1/18.
 */
public enum TemplateTypeEnum {
    NOT_USED(1);

    private Integer type;

    TemplateTypeEnum(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }
}
