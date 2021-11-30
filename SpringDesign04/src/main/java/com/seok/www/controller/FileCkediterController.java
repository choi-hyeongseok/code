package com.seok.www.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/file")
public class FileCkediterController {

	String uploadPath = "C:\\dev\\javaprogramming-workspace\\SpringDesign01\\src\\main\\webapp\\resources\\fileupload\\";

	/**
	 * 
	 * @param request
	 * @param response
	 * @param multiFile
	 * @param upload
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fileupload.do", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

		// ���� ���� ����
		UUID uid = UUID.randomUUID();
		OutputStream out = null;
		PrintWriter printWriter = null; // ���ڵ�
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		try { // ���� �̸� ��������
			String fileName = upload.getOriginalFilename();
			System.out.println("0");
			byte[] bytes = upload.getBytes(); // �̹��� ��� ����
			String path = uploadPath;// fileDir�� ���� ������ �׳� �̹��� ��� �������ָ� �ȴ�.
			String ckUploadPath = path + uid + "_" + fileName;
			System.out.println("1");
			File folder = new File(path); // �ش� ���丮 Ȯ��
			System.out.println("2");
			if (!folder.exists()) {
				try {
					System.out.println("3");
					folder.mkdirs(); // ���� ����
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
			System.out.println("4");
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			System.out.println("5");
			out.flush(); // outputStram�� ����� �����͸� �����ϰ� �ʱ�ȭ
			String callback = request.getParameter("CKEditorFuncNum");
			System.out.println("6");
			printWriter = response.getWriter();
			System.out.println("7");
			String fileUrl = "/file/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();
			System.out.println("8");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return "";
	}

	@RequestMapping(value = "/ckImgSubmit.do")
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = uploadPath;
		String sDirPath = path + uid + "_" + fileName;
		File imgFile = new File(sDirPath);
		if (imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;
			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;
			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();
				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}
				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();
			} catch (IOException e) {
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}
}
