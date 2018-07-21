package com.ueater.backstage.common.enums.cms;

/**
 * Created by zhangjiannan on 2018/1/18.
 */
public enum ModuleTypeIdEnum {
    SHOWCASE(1L),        // 橱窗
    NEW_PRODUCT(2L),     // 新品发现
    ROB_DELICIOUS(3L),   // 每日抢鲜
    ACTIVITY(4L),        // 自定义活动
    FLAVOUR(5L),         // 纯粹味道
    BUYER_RECOMMEND(6L), // 买手推荐
    EAT_SPEAK(7L);       // eat说

    private Long type;

    ModuleTypeIdEnum(Long type) {
        this.type = type;
    }

    public Long getType() {
        return type;
    }
}
