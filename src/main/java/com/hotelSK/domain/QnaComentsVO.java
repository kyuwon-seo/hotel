package com.hotelSK.domain;

public class QnaComentsVO {
	
	private int co_no;
	private int co_group;
	private String user_id;
	private String user_password;
	private String co_text;
	private int board_no;
	private String co_date;
	
	public int getCo_no() {
		return co_no;
	}
	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}
	public int getCo_group() {
		return co_group;
	}
	public void setCo_group(int co_group) {
		this.co_group = co_group;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getCo_text() {
		return co_text;
	}
	public void setCo_text(String co_text) {
		this.co_text = co_text;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getCo_date() {
		return co_date;
	}
	public void setCo_date(String co_date) {
		this.co_date = co_date;
	}

}
