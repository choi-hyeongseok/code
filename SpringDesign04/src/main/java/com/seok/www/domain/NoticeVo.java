package com.seok.www.domain;

import java.util.Date;

public class NoticeVo {
	/*
	 * title content viewYn
	 */
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int noticeHit;
	private String noticeDelFlag;
	private String noticeRegId;
	private Date noticeRegDate;
	private String noticeUdtId;
	private Date noticeUdtDate;
	private String noticeDelId;
	private Date noticeDelDate;
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public int getNoticeHit() {
		return noticeHit;
	}
	public void setNoticeHit(int noticeHit) {
		this.noticeHit = noticeHit;
	}
	public String getNoticeDelFlag() {
		return noticeDelFlag;
	}
	public void setNoticeDelFlag(String noticeDelFlag) {
		this.noticeDelFlag = noticeDelFlag;
	}
	public String getNoticeRegId() {
		return noticeRegId;
	}
	public void setNoticeRegId(String noticeRegId) {
		this.noticeRegId = noticeRegId;
	}
	public Date getNoticeRegDate() {
		return noticeRegDate;
	}
	public void setNoticeRegDate(Date noticeRegDate) {
		this.noticeRegDate = noticeRegDate;
	}
	public String getNoticeUdtId() {
		return noticeUdtId;
	}
	public void setNoticeUdtId(String noticeUdtId) {
		this.noticeUdtId = noticeUdtId;
	}
	public Date getNoticeUdtDate() {
		return noticeUdtDate;
	}
	public void setNoticeUdtDate(Date noticeUdtDate) {
		this.noticeUdtDate = noticeUdtDate;
	}
	public String getNoticeDelId() {
		return noticeDelId;
	}
	public void setNoticeDelId(String noticeDelId) {
		this.noticeDelId = noticeDelId;
	}
	public Date getNoticeDelDate() {
		return noticeDelDate;
	}
	public void setNoticeDelDate(Date noticeDelDate) {
		this.noticeDelDate = noticeDelDate;
	}
	@Override
	public String toString() {
		return "NoticeVo [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeHit=" + noticeHit + ", noticeDelFlag=" + noticeDelFlag + ", noticeRegId=" + noticeRegId
				+ ", noticeRegDate=" + noticeRegDate + ", noticeUdtId=" + noticeUdtId + ", noticeUdtDate="
				+ noticeUdtDate + ", noticeDelId=" + noticeDelId + ", noticeDelDate=" + noticeDelDate + "]";
	}

}
