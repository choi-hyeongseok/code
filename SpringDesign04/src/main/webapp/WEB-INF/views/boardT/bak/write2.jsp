<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글쓰기</h1>
<form action="/board/write" method="post">
	<label for="title">제목</label>
	<input id="title" name="boardTitle" type="text"/><br>
	<label for="userId">아이디</label>
	<input id="userId" name="boardId" type="text"/><br>
	<label for="userId">패스워드</label>
	<input id="userId" name="boardPw" type="password"/><br>
	
	<label for="content">내용</label>
	<textarea id="boardContent" style="width: 500px;height:500px;" name="boardContent"></textarea><br>
	
	<input type="submit" value="글쓰기">
	<p class="mb-0">
		<a href="${path}" class="text-center">Main 페이지 돌아가기</a> 
	</p>
</form>
</body>
</html>