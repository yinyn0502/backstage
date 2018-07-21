package com.ueater.backstage.common.enums.cms;

/**
 * Created by chenyuhua on 2018-01-24.
 */
public enum PageStatusEnum {
    DISCARD(0), EXPIRED(1), PREPUBLISH(2),PUBLISH(3);

    private Integer status;

    PageStatusEnum(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }
}
