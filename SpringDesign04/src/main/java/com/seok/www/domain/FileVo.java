package com.seok.www.domain;

import java.util.Date;

public class FileVo {
	private String fileId;
	private int fileNo;
	private String fileName;
	private String fileOrginalName;
	private String filePath;
	private String fileType;
	private long fileSize;
	private String fileDelFlag;
	private Date fileRegDate;
	private Date fileDelDate;

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileOrginalName() {
		return fileOrginalName;
	}

	public void setFileOrginalName(String fileOrginalName) {
		this.fileOrginalName = fileOrginalName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileDelFlag() {
		return fileDelFlag;
	}

	public void setFileDelFlag(String fileDelFlag) {
		this.fileDelFlag = fileDelFlag;
	}

	public Date getFileRegDate() {
		return fileRegDate;
	}

	public void setFileRegDate(Date fileRegDate) {
		this.fileRegDate = fileRegDate;
	}

	public Date getFileDelDate() {
		return fileDelDate;
	}

	public void setFileDelDate(Date fileDelDate) {
		this.fileDelDate = fileDelDate;
	}

	@Override
	public String toString() {
		return "FileVo [fileId=" + fileId + ", fileNo=" + fileNo + ", fileName=" + fileName + ", fileOrginalName="
				+ fileOrginalName + ", filePath=" + filePath + ", fileType=" + fileType + ", fileSize=" + fileSize
				+ ", fileDelFlag=" + fileDelFlag + ", fileRegDate=" + fileRegDate + ", fileDelDate=" + fileDelDate
				+ "]";
	}

}
