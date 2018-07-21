package com.ueater.backstage.common.enums.couponmanage;

/**
 * Created by chengyuxiang on 2017/7/16.
 */
public enum DimensionAppTypeEnum {
    //IOS(0,"Ios"),
    //ANDROID(1,"Android"),
    APP(5,"App"),
    H5(2,"H5"),
    OFFLINE(3,"POS")

    //ALL(4,"所有")
    ;


    private Integer type;
    private String names;
    DimensionAppTypeEnum(Integer type,String names){
        this.type = type;
        this.names = names;
    }
    public Integer getType(){
        return  type;
    }

    public String getNames(){ return names;}

    public static String getTypeName(Integer type){
        DimensionAppTypeEnum[] values = DimensionAppTypeEnum.values();
        String names = "";
        for(DimensionAppTypeEnum date:values){
            if(date.type.equals(type)){
                names =  date.names;
                break;
            }
        }
        return names;
    }
}
