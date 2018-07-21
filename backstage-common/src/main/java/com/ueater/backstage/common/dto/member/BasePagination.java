package com.ueater.backstage.common.dto.member;

import lombok.Data;

@Data
public class BasePagination {


	/**
	 * 总页数
	 */

	protected Boolean hasPreviousPage;

	protected Long nextPage;

	protected Boolean hasNextPage;

	protected Long prePage;

	protected Long lastPage;





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
	protected Long totalCount;




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
		if(totalCount == 0)return 1;
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


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public void setNextPage(Long nextPage) {
		this.nextPage = nextPage;
	}

	public void setHasPreviousPage(Boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;

	}

	public void setPrePage(Long prePage) {
		this.prePage = prePage;
	}
}
