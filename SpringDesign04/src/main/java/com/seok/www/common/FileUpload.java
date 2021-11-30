package com.seok.www.common;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.seok.www.domain.FileVo;

public class FileUpload {

	static String UPLOAD_FILE_PATH = "C:\\dev\\javaprogramming-workspace\\SpringDesign01\\src\\main\\webapp\\resources\\fileupload\\";

	public FileVo fileUpload(MultipartFile file) {

		UUID uid = UUID.randomUUID();

		FileVo fileVo = null;

		if (!file.isEmpty()) {

			String fileName = uid + file.getOriginalFilename();

			try {
				file.transferTo(new File(UPLOAD_FILE_PATH, fileName));
				fileVo = new FileVo();
				fileVo.setFileId(fileName);
				fileVo.setFileName(fileName);
				fileVo.setFileOrginalName(file.getOriginalFilename());
				fileVo.setFilePath(UPLOAD_FILE_PATH + fileName);
				fileVo.setFileSize(file.getSize());
				
				int index = fileName.lastIndexOf(".");
				String extension = fileName.substring(index + 1); // jpg 등등
				
				fileVo.setFileType(extension);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		return fileVo;
	}

	public FileVo[] fileUpload(List<MultipartFile> files) {

		FileVo[] fileVos = null;

		return fileVos;
	}
}
