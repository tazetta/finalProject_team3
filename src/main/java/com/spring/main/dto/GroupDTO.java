package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias ("group")
public class GroupDTO {
	
	private int gpIdx;
	private String subject;
	private String content;
	private String chatURL;
	private int progIdx; // 진행상황 1.진행중 2.인원미달마감 3.마감
	private String id;
	private int maxUser;
	private int currUser;
	private Date deadline;
	private int gpCtgIdx; // 카테고리 1.공동구매 2.무료나눔
	private Date  reg_date;
	private int gHit;
	
	
	/*gpCtg 테이블*/
	private String category;
	/*gpProgress 테이블*/
	private String progress;
	
	
	public int getgHit() {
		return gHit;
	}
	public void setgHit(int gHit) {
		this.gHit = gHit;
	}
	
	
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getGpIdx() {
		return gpIdx;
	}
	public void setGpIdx(int gpIdx) {
		this.gpIdx = gpIdx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getChatURL() {
		return chatURL;
	}
	public void setChatURL(String chatURL) {
		this.chatURL = chatURL;
	}
	public int getProgIdx() {
		return progIdx;
	}
	public void setProgIdx(int progIdx) {
		this.progIdx = progIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMaxUser() {
		return maxUser;
	}
	public void setMaxUser(int maxUser) {
		this.maxUser = maxUser;
	}
	public int getCurrUser() {
		return currUser;
	}
	public void setCurrUser(int currUser) {
		this.currUser = currUser;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public int getGpCtgIdx() {
		return gpCtgIdx;
	}
	public void setGpCtgIdx(int gpCtgIdx) {
		this.gpCtgIdx = gpCtgIdx;
	}

}
