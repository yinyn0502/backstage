package com.ueater.backstage.common.model.cmsinfo;

/**
 * Created by zhangjiannan on 2018/1/18.
 */
public enum ModuleTypeIdEnum {
    SHOWCASE(1),//橱窗
    NEW_PRODUCT(2),//新品发现
   ROB_DELICIOUS(3),//每日抢鲜
    ACTIVITY(4),//自定义活动
    FLAVOUR(5),//纯粹味道
    BUYER_RECOMMEND(6),//买手推荐
    EAT_SPEAK(7);//eat说

    private Integer type;

    ModuleTypeIdEnum(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }
}
