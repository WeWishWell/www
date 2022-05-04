package com.wewishwell.shop.vo;

public class BasketVO {
	
	private int prod_id;
	private String user_id;
	private int cnt;
	
	public BasketVO() {
	}

	public BasketVO(int prod_id, String user_id, int cnt) {
		super();
		this.prod_id = prod_id;
		this.user_id = user_id;
		this.cnt = cnt;
	}

	public int getProd_id() {
		return prod_id;
	}

	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "BasketVO [prod_id=" + prod_id + ", user_id=" + user_id + ", cnt=" + cnt + "]";
	}
	
	
}