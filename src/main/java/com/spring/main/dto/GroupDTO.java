package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias ("group")
public class GroupDTO {
	
	private int gpIdx;
	private String subject;
	private String content;
	private String chatURL;
	private int progIdx;
	private String id;
	private int maxUser;
	private int currUser;
	private Date deadline;
	private int gpCtgIdx;
	
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
