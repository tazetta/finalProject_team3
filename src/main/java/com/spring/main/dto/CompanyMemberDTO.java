package com.spring.main.dto;

import java.sql.Date;

public class CompanyMemberDTO {

	private int comId ;
	private String pw ;
	private String phone;
	private String addr;
	private Date reg_date;
	private String comName;
	private int stateIdx;
	private int license;
	public int getComId() {
		return comId;
	}
	public void setComId(int comId) {
		this.comId = comId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public int getStateIdx() {
		return stateIdx;
	}
	public void setStateIdx(int stateIdx) {
		this.stateIdx = stateIdx;
	}
	public int getLicense() {
		return license;
	}
	public void setLicense(int license) {
		this.license = license;
	}
	
	
	
}
