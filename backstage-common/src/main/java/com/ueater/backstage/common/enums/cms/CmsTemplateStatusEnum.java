package com.ueater.backstage.common.enums.cms;

public enum CmsTemplateStatusEnum {
    EDIT(0),    // 编辑
    FINISH(1),  // 完成
    CANCEL(2);  // 取消

    private Integer status;

    CmsTemplateStatusEnum(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }
}
