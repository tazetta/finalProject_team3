package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("photo")
public class PhotoDTO {
	
	private int photoIdx;
	private String newFileName;
	private String oriFileName;
	private Date reg_date;
	private int boardIdx;
	private int comBrdIdx;
	private String id;
	private int gpIdx;
	
	
	public int getGpIdx() {
		return gpIdx;
	}
	public void setGpIdx(int gpIdx) {
		this.gpIdx = gpIdx;
	}
	public int getPhotoIdx() {
		return photoIdx;
	}
	public void setPhotoIdx(int photoIdx) {
		this.photoIdx = photoIdx;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public int getComBrdIdx() {
		return comBrdIdx;
	}
	public void setComBrdIdx(int comBrdIdx) {
		this.comBrdIdx = comBrdIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
}
