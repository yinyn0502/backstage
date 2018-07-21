package com.ueater.backstage.common.enums.image;

/**
 * @author fanlei
 * @version 1.0.0
 * @date 八月 22 2017 上午11:11
 * <p/>
 * 图片系统，图片类型枚举
 */
public enum ImageTypeEnum {

    REVERSE(4);

    Integer type;

    ImageTypeEnum(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }
}
