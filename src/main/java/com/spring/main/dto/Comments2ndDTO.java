package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("comments2nd")
public class Comments2ndDTO {
	private int com2ndIdx;
	private int commIdx;
	private String comments;
	private Date reg_date;
	private String blind;
	private String id;
	
	public int getCom2ndIdx() {
		return com2ndIdx;
	}
	public void setCom2ndIdx(int com2ndIdx) {
		this.com2ndIdx = com2ndIdx;
	}
	public int getCommIdx() {
		return commIdx;
	}
	public void setCommIdx(int commIdx) {
		this.commIdx = commIdx;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getBlind() {
		return blind;
	}
	public void setBlind(String blind) {
		this.blind = blind;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
