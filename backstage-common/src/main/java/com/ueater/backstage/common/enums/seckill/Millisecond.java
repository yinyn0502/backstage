package com.ueater.backstage.common.enums.seckill;

/**
 * Created by zhangjiannan on 2018/4/11.
 */
public enum Millisecond {

    TIME_MILLISECOND(7200000);//多长时间之后(毫秒)


    private Integer type;

    Millisecond(Integer type) {
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

}
