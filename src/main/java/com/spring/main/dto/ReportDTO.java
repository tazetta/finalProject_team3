package com.spring.main.dto;

import java.sql.Date;

public class ReportDTO {

	private int repIdx;
	private String adminId;
	private int commIdx;
	private int boardIdx;
	private String id;
	private String comId;
	private String license;
	private int repCtgIdx;
	private String cause;
	private Date reg_date;
	private String targetId;
	private String subject;
	private String blind;
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBlind() {
		return blind;
	}

	public void setBlind(String blind) {
		this.blind = blind;
	}

	public String getTargetId() {
		return targetId;
	}

	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}

	public int getRepIdx() {
		return repIdx;
	}

	public void setRepIdx(int repIdx) {
		this.repIdx = repIdx;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public int getCommIdx() {
		return commIdx;
	}

	public void setCommIdx(int commIdx) {
		this.commIdx = commIdx;
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

	public String getComId() {
		return comId;
	}

	public void setComId(String comId) {
		this.comId = comId;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public int getRepCtgIdx() {
		return repCtgIdx;
	}

	public void setRepCtgIdx(int repCtgIdx) {
		this.repCtgIdx = repCtgIdx;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
