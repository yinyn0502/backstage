package com.ueater.backstage.common.model;

import lombok.Data;

import java.io.Serializable;

@Data
public class BasePagination implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 每页数量
	 */
	protected Integer pageCount;

	/**
	 * 当前页码
	 */
	protected Integer currentPage;
	
	/**
	 * 记录总数
	 */
	protected Long totalCount;
	
}
