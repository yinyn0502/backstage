package com.ueater.backstage.common.enums.reverseOrder;

/**
 * 申请退换单类型
 * Created by chengyuxiang on 2017/8/17.
 */
public enum ReverseOrderTypeEnum {

    RETURN_GOODS(0,"退货"),//退货单
    EXCHANGE_GOODS(1,"换货"),//换货单
    REFUND(2,"仅退款"),//退款单
    SUPPLY_GOODS(3,"补发货"),//补发单
    POS_RETURN(4,"退货"),//pos退货
    POS_EXCHANGE(5,"换货");    // pos换货(仅供后台系统)
    private Integer type;
    private String names;

    ReverseOrderTypeEnum(Integer type, String names) {
        this.type = type;
        this.names = names;
    }

    public Integer getType() {
        return type;
    }
    public String getNames() {
        return names;
    }

    public static String getNameByType(Integer type){
        if(type==null){
            return null;
        }
        ReverseOrderTypeEnum[] reverseOrderTypeEnums = ReverseOrderTypeEnum.values();
        for(ReverseOrderTypeEnum reverseOrderTypeEnum:reverseOrderTypeEnums){
            if(reverseOrderTypeEnum.getType().equals(type)){
                return reverseOrderTypeEnum.names;
            }
        }
        return null;
    }
}
