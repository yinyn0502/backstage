package com.ueater.backstage.common.enums.couponmanage;

/**
 * Created by chengyuxiang on 2017/7/15.
 */
public enum BenefitTypeEnum {

    REDUCE(0,"减"),//减
    DISCOUNT(1,"折")//折
//    DRIECT(2),
//    FREE(3)
   ;
    private Integer type;
    private String names;
    BenefitTypeEnum(Integer type,String names){
        this.type = type;
        this.names=names;
    }
    public Integer getType(){
        return type;
    }
    public String getNames() { return names;}
}
