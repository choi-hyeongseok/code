package com.seok.www.domain;

import java.util.Date;

public class ReplyVo {

	private int replyNo;
	private int boardNo;
	private int replyLogin;
	private String replyId;
	private String replyPw;
	private String replyContent;
	private int replyGrp;
	private int replyClass;
	private String replyDelFlag;
	private Date replyRegDate;
	private Date replyUdtDate;
	private Date replyDelDate;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getReplyLogin() {
		return replyLogin;
	}
	public void setReplyLogin(int replyLogin) {
		this.replyLogin = replyLogin;
	}
	public String getReplyId() {
		return replyId;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	public String getReplyPw() {
		return replyPw;
	}
	public void setReplyPw(String replyPw) {
		this.replyPw = replyPw;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getReplyGrp() {
		return replyGrp;
	}
	public void setReplyGrp(int replyGrp) {
		this.replyGrp = replyGrp;
	}
	public int getReplyClass() {
		return replyClass;
	}
	public void setReplyClass(int replyClass) {
		this.replyClass = replyClass;
	}
	public String getReplyDelFlag() {
		return replyDelFlag;
	}
	public void setReplyDelFlag(String replyDelFlag) {
		this.replyDelFlag = replyDelFlag;
	}
	public Date getReplyRegDate() {
		return replyRegDate;
	}
	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}
	public Date getReplyUdtDate() {
		return replyUdtDate;
	}
	public void setReplyUdtDate(Date replyUdtDate) {
		this.replyUdtDate = replyUdtDate;
	}
	public Date getReplyDelDate() {
		return replyDelDate;
	}
	public void setReplyDelDate(Date replyDelDate) {
		this.replyDelDate = replyDelDate;
	}
	@Override
	public String toString() {
		return "ReplyVo [replyNo=" + replyNo + ", boardNo=" + boardNo + ", replyLogin=" + replyLogin + ", replyId="
				+ replyId + ", replyPw=" + replyPw + ", replyContent=" + replyContent + ", replyGrp=" + replyGrp
				+ ", replyClass=" + replyClass + ", replyDelFlag=" + replyDelFlag + ", replyRegDate=" + replyRegDate
				+ ", replyUdtDate=" + replyUdtDate + ", replyDelDate=" + replyDelDate + "]";
	}
	
	
	
}
