package com.wewishwell.shop.vo;

import java.util.Date;

public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private String role;
	private Date regdate;
	private String address;
	private String birthday;
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberVO(String id, String pw, String name, String role, Date regdate, String address, String birthday) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.role = role;
		this.regdate = regdate;
		this.address = address;
		this.birthday = birthday;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", role=" + role + ", regdate=" + regdate
				+ ", address=" + address + ", birthday=" + birthday + "]";
	}	

}
