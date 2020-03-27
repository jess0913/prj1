package com.board.board.common.util;

public class Pagination {

	private int rowCnt = 10; 		// 페이지별 Row 수
	private int pageCnt = 5; 		// 한번에 노출되는 페이지 수, (1,2,3,4,5 -> 6,7,8,9,10)
	private int startPageIndex = 1; // 시작 페이지 번호
	private int endPageIndex = 1;	// 끝 페이지 번호
	private int totalPageCnt = 0; 	// 총 페이지 수
	private int currentPage = 1;	// 현재 페이지 번호, (1,2,3,..)
	private int totalCnt = 0;		// 총 데이터 수
	private int startIndex = 0;		// 시작 데이터 번호
		
	public void setTotalCnt(int totalCnt) {
		  this.totalCnt = totalCnt;
		  
		  // 전체 페이지 수
		  this.totalPageCnt = totalCnt/rowCnt;
		  if(totalCnt%rowCnt > 0) {
			  this.totalPageCnt++;
		  }
		  
		  // 페이지별 셋
		  this.startPageIndex = (currentPage-1)/pageCnt*pageCnt+1;
		  this.endPageIndex = startPageIndex+pageCnt-1;
		  if(endPageIndex > this.totalPageCnt) {
			  endPageIndex = this.totalPageCnt;
		  }
	}
	
	public void setCurrentPage(int currentPage) {
		  this.currentPage = currentPage;
		  
		  this.startIndex = (this.currentPage-1)*this.rowCnt;
	}
	
	public static int getPageValues(int viewCount, int totalCount) {
		  return (totalCount / viewCount) + (totalCount % viewCount > 0 ? 1 : 0);
	}

	public int getRowCnt() {
		return rowCnt;
	}

	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartPageIndex() {
		return startPageIndex;
	}

	public void setStartPageIndex(int startPageIndex) {
		this.startPageIndex = startPageIndex;
	}

	public int getEndPageIndex() {
		return endPageIndex;
	}

	public void setEndPageIndex(int endPageIndex) {
		this.endPageIndex = endPageIndex;
	}

	public int getTotalPageCnt() {
		return totalPageCnt;
	}

	public void setTotalPageCnt(int totalPageCnt) {
		this.totalPageCnt = totalPageCnt;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}
	
}
