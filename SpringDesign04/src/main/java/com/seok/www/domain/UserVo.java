package com.seok.www.domain;

import java.util.Date;

public class UserVo {

	private int userNo;
	private int userLevel;
	private String userId;
	private String userPw;
	private String userName;
	private String userGender;
	private String userEmail;
	private Date userBirth;
	private Date userRegDate;
	private Date userUdtDate;
	private Date userDelDate;
	private Date userLoginDate;
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public Date getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(Date userRegDate) {
		this.userRegDate = userRegDate;
	}
	public Date getUserUdtDate() {
		return userUdtDate;
	}
	public void setUserUdtDate(Date userUdtDate) {
		this.userUdtDate = userUdtDate;
	}
	public Date getUserDelDate() {
		return userDelDate;
	}
	public void setUserDelDate(Date userDelDate) {
		this.userDelDate = userDelDate;
	}
	public Date getUserLoginDate() {
		return userLoginDate;
	}
	public void setUserLoginDate(Date userLoginDate) {
		this.userLoginDate = userLoginDate;
	}
	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", userLevel=" + userLevel + ", userId=" + userId + ", userPw=" + userPw
				+ ", userName=" + userName + ", userGender=" + userGender + ", userEmail=" + userEmail + ", userBirth="
				+ userBirth + ", userRegDate=" + userRegDate + ", userUdtDate=" + userUdtDate + ", userDelDate="
				+ userDelDate + ", userLoginDate=" + userLoginDate + "]";
	}

	
}
