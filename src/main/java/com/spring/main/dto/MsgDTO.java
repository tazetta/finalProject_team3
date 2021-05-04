package com.spring.main.dto;

import java.sql.Date;

public class MsgDTO {

	private int msgIdx;
	private String sender;
	private String receiver;
	private String content;
	private Date reg_date;
	private String senddel;
	private String receivedel;
	public int getMsgIdx() {
		return msgIdx;
	}
	public void setMsgIdx(int msgIdx) {
		this.msgIdx = msgIdx;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getSenddel() {
		return senddel;
	}
	public void setSenddel(String senddel) {
		this.senddel = senddel;
	}
	public String getReceivedel() {
		return receivedel;
	}
	public void setReceivedel(String receivedel) {
		this.receivedel = receivedel;
	}
	
	
}
