package org.zerock.openapi.tour;


public class SingleBody {
	
	private SingleItems items;
	private Integer numOfRows;
	private Integer pageNo;
	private Integer totalCount;
	
	public SingleItems getItems() {
		return items;
	}
	public void setItems(SingleItems items) {
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
