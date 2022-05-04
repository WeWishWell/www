package com.wewishwell.shop.vo;

public class ReviewVO {
	
	private int num;
	private int prod_id;
	private String prod_name;
	private String user_id;
	private double star;
	private String title;
	private String content;
	private String regdate;
	private int like;
	public ReviewVO() {}


	public ReviewVO(int num, int prod_id, String prod_name, String user_id, double star, String title, String content,
			String regdate, int like) {
		super();
		this.num = num;
		this.prod_id = prod_id;
		this.prod_name = prod_name;
		this.user_id = user_id;
		this.star = star;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.like = like;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getProd_id() {
		return prod_id;
	}

	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getLike() {
		return like;
	}


	public void setLike(int like) {
		this.like = like;
	}


	@Override
	public String toString() {
		return "ReviewVO [num=" + num + ", prod_id=" + prod_id + ", prod_name=" + prod_name + ", user_id=" + user_id
				+ ", star=" + star + ", title=" + title + ", content=" + content + ", regdate=" + regdate + ", like="
				+ like + "]";
	}


}
