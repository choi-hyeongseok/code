package com.seok.www.controller;

import java.io.File;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seok.www.common.FileUpload;
import com.seok.www.domain.FileVo;

@Controller
@RequestMapping("/file")
public class FileController {

	String uploadPath = "C:\\dev\\javaprogramming-workspace\\SpringDesign04\\src\\main\\webapp\\resources\\fileupload\\";

	/**
	 * file upload and download Test Page
	 * 
	 * @return
	 */
	@RequestMapping(value = "uploads", method = RequestMethod.GET)
	public String link() {
		return "board/fileUp";
	}

	/**
	 * download process
	 * 
	 * @param response
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("download")
	@ResponseBody
	public byte[] downlod(HttpServletResponse response, @RequestParam String filename) throws IOException {
		File file = new File(uploadPath, filename);

		byte[] bytes = FileCopyUtils.copyToByteArray(file);

		String fn = new String(file.getName().getBytes(), "utf-8");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
		response.setContentLength(bytes.length);

		return bytes;
	}

	/**
	 * upload process
	 * 
	 * @param file
	 * @param model
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "uploads", method = RequestMethod.POST)
	public String upload(@RequestParam("uploadFile") MultipartFile file, Model model)
			throws IllegalStateException, IOException {
		String fileName = file.getOriginalFilename();

		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(uploadPath, fileName));
			model.addAttribute("msg", "File uploaded successfully.");
			model.addAttribute("fileName", fileName);
		} else {
			model.addAttribute("msg", "Please select a valid mediaFile..");
		}

		return "board/fileUp";
	}

	@ResponseBody
	@RequestMapping(value = "/uploadAjaxAction", method = RequestMethod.POST)
	public ResponseEntity<List<FileVo>> uploadAjaxPost(MultipartFile[] uploadFile)
			throws IllegalStateException, IOException {

		List<FileVo> list = new ArrayList<>();

		for (MultipartFile multipartFile : uploadFile) {
			if (!multipartFile.isEmpty()) {

				FileVo fileVo = new FileVo();

				UUID uid = UUID.randomUUID();
				String fileName = uid + multipartFile.getOriginalFilename();

				try {
					multipartFile.transferTo(new File(uploadPath, fileName));
					fileVo = new FileVo();
					fileVo.setFileId(fileName);
					fileVo.setFileName(fileName);
					fileVo.setFileOrginalName(multipartFile.getOriginalFilename());
					fileVo.setFilePath(uploadPath + fileName);
					fileVo.setFileSize(multipartFile.getSize());

					int index = fileName.lastIndexOf(".");
					String extension = fileName.substring(index + 1); // jpg 등등
					fileVo.setFileType(extension);
					list.add(fileVo);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}

		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {

		File file;

		try {
			file = new File(uploadPath + fileName);

			file.delete();

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}

}
