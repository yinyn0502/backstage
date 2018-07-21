package com.ueater.backstage.common.enums.product;


public enum ProductSaleStatusEnum {
	STOPSAIL(0, "不可售"),
	SAILING(1, "可售"),
	ONLINE(2, "仅线上可售"),
	OFFLINE(3, "仅线下可售"),
	NOT_SOLD_AT_THE_STORE(4, "不在该门店销售");

	private Integer status;
	private String desc;

	ProductSaleStatusEnum(Integer status, String desc){
		this.status = status;
		this.desc = desc;
	}
	public Integer getStatus() {
		return status;
	}
	public String getDesc() {
		return desc;
	}

	public static Integer getSize(){
		return ProductSaleStatusEnum.values().length;
	}

	public static String getDescByStatus(Integer status) {
		if (status == null) {
			return null;
		}
		ProductSaleStatusEnum[] productSaleStatus = ProductSaleStatusEnum.values();
		for (ProductSaleStatusEnum productSaleStatusEnum : productSaleStatus) {
			if (productSaleStatusEnum.getStatus().equals(status)) {
				return productSaleStatusEnum.desc;
			}
		}
		return null;
	}
	public static Integer getTypeByDesc(String desc) {
		if (desc == null) {
			return null;
		}
		ProductSaleStatusEnum[] productSaleStatus = ProductSaleStatusEnum.values();
		for (ProductSaleStatusEnum productSaleStatusEnum : productSaleStatus) {
			if (productSaleStatusEnum.getDesc().equals(desc)) {
				return productSaleStatusEnum.status;
			}
		}
		return null;
	}
}
