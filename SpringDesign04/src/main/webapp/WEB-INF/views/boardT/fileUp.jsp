<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>파일 다운로드</title>
</head>
 <body>
	<h3>파일 업로드</h3>
	<form action="/file/uploads" method="post" enctype="multipart/form-data">
	 	Select File : <input type="file" name="uploadFile" />
		 <button type="submit">Upload</button>
		 ${msg }
	</form>
	
	<h3>파일 다운로드</h3>
	<form action="/file/download" method="post">
	download file name : <c:out value="${fileName}"></c:out>
		<input type="hidden" name="filename" value="${fileName}">
		<input type="submit" value="다운로드">
	</form>
	
 </body>
</html>
