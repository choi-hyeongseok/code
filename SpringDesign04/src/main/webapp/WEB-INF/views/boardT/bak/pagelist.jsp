<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시판 목록</h1>
	<table border="1">
		<tr>
			<td>번호
			<td>제목
			<td>작성자
			<td>작성일
		</tr>
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.boardNo}
				<td><a href="/board/${item.boardNo}">${item.boardTitle}</a>
				<td>${item.boardId}
				<td>${item.boardRegDate}
			</tr>
		</c:forEach>
	</table>
	<a href="/board/write">글쓰기</a>


	<c:catch>
		<c:choose>
			<c:when test="${empty login }">
				<li><a href="/user/login">로그인</a></li>
				<li><a href="/user/register">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${login.userLevel eq '123' }">
						
							<p>관리자 ${login.userName }님, 환영합니다.</p>
						
						<a href="/logout">로그아웃</a>
					</c:when>
					<c:otherwise>
						
							<p>${login.userName }님,반갑습니다!</p>
					
						<a href="/user/logout"> 로그아웃</a>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</c:catch>

</body>
</html>