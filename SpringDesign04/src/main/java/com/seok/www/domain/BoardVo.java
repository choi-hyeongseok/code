package com.seok.www.domain;

import java.util.Arrays;
import java.util.Date;

public class BoardVo {

	private int boardNo;
	private String boardId;
	private String boardPw;
	private String boardTitle;
	private String boardContent;
	private int boardHit;
	private String boardDelFlag;
	private Date boardRegDate;
	private Date boardUdtDate;
	private Date boardDelDate;
	private String boardFileId;

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public String getBoardPw() {
		return boardPw;
	}

	public void setBoardPw(String boardPw) {
		this.boardPw = boardPw;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}

	public Date getBoardRegDate() {
		return boardRegDate;
	}

	public void setBoardRegDate(Date boardRegDate) {
		this.boardRegDate = boardRegDate;
	}

	public Date getBoardUdtDate() {
		return boardUdtDate;
	}

	public void setBoardUdtDate(Date boardUdtDate) {
		this.boardUdtDate = boardUdtDate;
	}

	public Date getBoardDelDate() {
		return boardDelDate;
	}

	public void setBoardDelDate(Date boardDelDate) {
		this.boardDelDate = boardDelDate;
	}

	public String getBoardDelFlag() {
		return boardDelFlag;
	}

	public void setBoardDelFlag(String boardDelFlag) {
		this.boardDelFlag = boardDelFlag;
	}

	public String getBoardFileId() {
		return boardFileId;
	}

	public void setBoardFileId(String boardFileId) {
		this.boardFileId = boardFileId;
	}

	@Override
	public String toString() {
		return "BoardVo [boardNo=" + boardNo + ", boardId=" + boardId + ", boardPw=" + boardPw + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardHit=" + boardHit + ", boardDelFlag="
				+ boardDelFlag + ", boardRegDate=" + boardRegDate + ", boardUdtDate=" + boardUdtDate + ", boardDelDate="
				+ boardDelDate + ", boardFileId=" + boardFileId + "]";
	}




}
