package com.ueater.backstage.common.enums.couponmanage;

public enum MemberCardTypeEnum {

    ORDINARY_MEMBER(0,"普通会员"),
    WHITE(1,"Eater"),//白卡
    RED(2,"Super Eater"),//红卡
    BLACK(3,"Business Eater");//黑卡

    private Integer type;
    private String levelName;

    MemberCardTypeEnum(Integer type,String levelName){
        this.type = type;
        this.levelName = levelName;
    }

    public Integer getType(){
        return type;
    }


    public String getLevelName(){
        return levelName;
    }

    public static String getLevelName(Integer type){
        MemberCardTypeEnum[] memberCardTypeEnums = MemberCardTypeEnum.values();
        for ( MemberCardTypeEnum memberCardTypeEnum : memberCardTypeEnums ) {
            if( memberCardTypeEnum.getType().equals(type) ){
                return memberCardTypeEnum.getLevelName();
            }
        }
        return null;
    }

}
