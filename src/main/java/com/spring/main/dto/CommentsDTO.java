package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("comments")
public class CommentsDTO {
	private int commIdx;
	private String comments;
	private Date reg_date;
	private String blind;
	private int boardIdx;
	private String id;
	private int gpIdx;
	
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
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGpIdx() {
		return gpIdx;
	}
	public void setGpIdx(int gpIdx) {
		this.gpIdx = gpIdx;
	}
	

}
