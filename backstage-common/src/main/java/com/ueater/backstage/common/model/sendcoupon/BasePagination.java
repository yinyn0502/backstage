package com.ueater.backstage.common.model.sendcoupon;

import lombok.Data;

import java.io.Serializable;

@Data
public class BasePagination implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 每页数量
	 */
	protected int pageCount;

	/**
	 * 当前页码
	 */
	protected int currentPage;

	/**
	 * 记录总数
	 */
	protected long totalCount;

	/**
	 * 上一页
	 */
	public long getPrePage() {
		return currentPage == 1 ? 1 : currentPage - 1;
	}
	/**
	 * 末页
	 */
	public long getLastPage() {
		return totalCount % pageCount == 0 ? totalCount / pageCount : totalCount / pageCount + 1;
	}
	/**
	 * 下一页
	 */
	public long getNextPage(){
		return currentPage == getLastPage() ? getLastPage() : currentPage + 1;
	}

	public Boolean getHasPreviousPage() {
		return currentPage == 1 ? Boolean.FALSE : Boolean.TRUE;
	}

	public Boolean getHasNextPage(){
		return currentPage == getLastPage() ? Boolean.FALSE : Boolean.TRUE;
	}




}
