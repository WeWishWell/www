package com.wewishwell.shop.vo;

public class ProdLikeVO {
	
	private int prod_id;
	private String user_id;
	
	public ProdLikeVO() {}

	public ProdLikeVO(int prod_id, String user_id) {
		super();
		this.prod_id = prod_id;
		this.user_id = user_id;
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

	@Override
	public String toString() {
		return "ProdLikeVO [prod_id=" + prod_id + ", user_id=" + user_id + "]";
	}
	
}
