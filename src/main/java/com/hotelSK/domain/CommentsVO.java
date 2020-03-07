package com.hotelSK.domain;

public class CommentsVO {
	private int co_no;
	private String user_id;
	private int room_id;
	private String co_txt;
	public int getCo_no() {
		return co_no;
	}
	public void setCo_no(int co_no) {
		this.co_no = co_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getCo_txt() {
		return co_txt;
	}
	public void setCo_txt(String co_txt) {
		this.co_txt = co_txt;
	}

}
