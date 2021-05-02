package com.spring.main.dto;

import java.sql.Date;

public class MemberDTO {
	String id;
	String pw;
	String name;
	String email;
	String phone;
	String gender;
	Date reg_date;
	int gradeIdx;
	String grade;
	int stateIdx;
	int cntBoard;
	int cntComm;

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getGradeIdx() {
		return gradeIdx;
	}

	public void setGradeIdx(int gradeIdx) {
		this.gradeIdx = gradeIdx;
	}

	public int getStateIdx() {
		return stateIdx;
	}

	public void setStateIdx(int stateIdx) {
		this.stateIdx = stateIdx;
	}

	public int getCntBoard() {
		return cntBoard;
	}

	public void setCntBoard(int cntBoard) {
		this.cntBoard = cntBoard;
	}

	public int getCntComm() {
		return cntComm;
	}

	public void setCntComm(int cntComm) {
		this.cntComm = cntComm;
	}

}
