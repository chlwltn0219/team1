package org.zerock.domain;

import java.util.List;

public class ItemsVO {

	private List<String> item;
	private Integer numOfRows;
	private Integer pageNo;
	private Integer totalCount;

	public List<String> getItem() {
		return item;
	}
	public void setItem(List<String> item) {
		this.item = item;
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

	@Override
	public String toString() {
		return "FestivalListVO [item=" + item + ", numOfRows=" + numOfRows + ", pageNo=" + pageNo + ", totalCount="
				+ totalCount + "]";
	}

}
