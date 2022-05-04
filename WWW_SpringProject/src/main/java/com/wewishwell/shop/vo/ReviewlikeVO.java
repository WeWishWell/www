package com.wewishwell.shop.vo;

public class ReviewlikeVO {
	private int num;
	private String id;
	private int like;
	
	public ReviewlikeVO() {
	}


	public ReviewlikeVO(int num, String id, int like) {
		super();
		this.num = num;
		this.id = id;
		this.like = like;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public int getLike() {
		return like;
	}


	public void setLike(int like) {
		this.like = like;
	}


	@Override
	public String toString() {
		return "ReviewlikeVO [num=" + num + ", id=" + id + ", like=" + like + "]";
	}


	
}
