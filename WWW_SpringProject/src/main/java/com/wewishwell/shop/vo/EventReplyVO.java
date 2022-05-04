package com.wewishwell.shop.vo;

public class EventReplyVO {

	private int reply_num;
	private String user_id;
	private int event_seq;
	private String content;
	private String reply_date;
	
	public EventReplyVO(int reply_num, String user_id, int event_seq, String content, String reply_date) {
		super();
		this.reply_num = reply_num;
		this.user_id = user_id;
		this.event_seq = event_seq;
		this.content = content;
		this.reply_date = reply_date;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getEvent_seq() {
		return event_seq;
	}

	public void setEvent_seq(int event_seq) {
		this.event_seq = event_seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	@Override
	public String toString() {
		return "EventReplyVO [reply_num=" + reply_num + ", user_id=" + user_id + ", event_seq=" + event_seq
				+ ", content=" + content + ", reply_date=" + reply_date + "]";
	}
	
	
}
