package com.hotelSK.domain;

public class PageNationVO {
	private int clickPage;
	private int startPage;
	private int endPage;
	
	
	public PageNationVO(int clickPage, int startPage, int endPage) {
		super();
		this.clickPage = clickPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	
	public int getClickPage() {
		return clickPage;
	}
	public void setClickPage(int clickPage) {
		this.clickPage = clickPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	

}
