package com.ueater.backstage.common.enums.couponmanage;

import lombok.Getter;

/**
 * coupon 的 目标类型
 *
 * @author duyongqiang
 * @version 1.00
 * @Date 2018/3/18
 */

@Getter
public enum CouponTargetTypeEnum {

    PULL_NEW(1, "拉新"),
    ACTIVATING_SILENT_USER(2, "激活沉默用户"),
    USER_AWARD(3, "用户奖励"),
    ACTIVITY(4, "活动"),
    THIRD_PARTY_COOPERATION(5, "第三方合作"),
    LIVING(6, "促活"),
    OTHER(7, "其他");

    private Integer type;
    private String desc;

    CouponTargetTypeEnum(Integer type, String desc) {
        this.type = type;
        this.desc = desc;
    }

    public static String getNameByType(Integer type) {
        CouponTargetTypeEnum[] values = CouponTargetTypeEnum.values();
        for (CouponTargetTypeEnum value : values) {
            if (value.getType() == type) {
                return value.desc;
            }
        }
        return null;
    }
}
