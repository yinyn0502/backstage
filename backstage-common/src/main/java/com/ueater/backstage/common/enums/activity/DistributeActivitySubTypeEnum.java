package com.ueater.backstage.common.enums.activity;

public enum DistributeActivitySubTypeEnum {

    NEW_USER(1L), LEVEL_UP(2L), NORMAL(3L);

    private Long type;

    DistributeActivitySubTypeEnum(Long type) {
        this.type = type;
    }

    public Long getType() {
        return type;
    }
}
