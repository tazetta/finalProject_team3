package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
@Alias("board")
public class BoardDTO {
	private int boardIdx;
	private String subject;
	private String content;
	private String id;
	private Date reg_date;
	private int roomsize;
	private int budget;
	private String keyitems;
	private int bhit;
	private String category;
	private String formcategory;
	public String getFormcategory() {
		return formcategory;
	}
	public void setFormcategory(String formcategory) {
		this.formcategory = formcategory;
	}
	private String blind;
	private int brdctgidx;
	private int formidx;
	private String email;
	
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getRoomsize() {
		return roomsize;
	}
	public void setRoomsize(int roomsize) {
		this.roomsize = roomsize;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public String getKeyitems() {
		return keyitems;
	}
	public void setKeyitems(String keyitems) {
		this.keyitems = keyitems;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public String getBlind() {
		return blind;
	}
	public void setBlind(String blind) {
		this.blind = blind;
	}
	public int getBrdctgidx() {
		return brdctgidx;
	}
	public void setBrdctgidx(int brdctgidx) {
		this.brdctgidx = brdctgidx;
	}
	public int getFormidx() {
		return formidx;
	}
	public void setFormidx(int formidx) {
		this.formidx = formidx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}