package com.wewishwell.shop.vo;

import java.sql.Date;

public class EventBoardVO {

	private int seq;
	private String title;
	private String writer;
	private String content;
	private String category;
	private Date regdate;
	
	public EventBoardVO() {
	}

	public EventBoardVO(int seq, String title, String writer, String content, String category, Date regdate) {
		super();
		this.seq = seq;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.category = category;
		this.regdate = regdate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "EventBoardVO [seq=" + seq + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", category=" + category + ", regdate=" + regdate + "]";
	}
	
	
}
