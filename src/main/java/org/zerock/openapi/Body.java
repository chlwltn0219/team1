package org.zerock.openapi;

import org.zerock.domain.PageMaker;

public class Body {
	
	private Items items;
	private Integer numOfRows;
	private Integer pageNo;
	private Integer totalCount;
	private PageMaker pageMaker;
	
	
	public PageMaker getPageMaker() {
		return pageMaker;
	}
	public void setPageMaker(PageMaker pageMaker) {
		this.pageMaker = pageMaker;
	}
	public Items getItems() {
		return items;
	}
	public void setItems(Items items) {
		this.items = items;
	}
	public Integer getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(Integer numOfRows) {
		this.numOfRows = numOfRows;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	
}
