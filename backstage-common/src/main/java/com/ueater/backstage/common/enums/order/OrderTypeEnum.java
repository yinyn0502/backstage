package com.ueater.backstage.common.enums.order;
/**
 * 订单type enum
 * @author xurupeng
 * @version 1.0.0
 * @see
 * @date 2017年5月3日 下午3:42:12
 */
public enum OrderTypeEnum {

	OFFLINE_RESTAURANT(0,"线下餐厅"),

	ONLINE(1,"线上"),
	
	OFFLINE_POS(2,"线下POS"),
	
	//SELF_CHECKOUT(3,"自助结账"),

	MERCHANT_POS(4,"商家POS");

	private Integer type;
	
	private String names;
	
	OrderTypeEnum(Integer type, String names){
		this.type = type;
		this.names = names;
	}
	public Integer getType(){
		return type;
	}
	public String getNames(){
		return names;
	}
}
