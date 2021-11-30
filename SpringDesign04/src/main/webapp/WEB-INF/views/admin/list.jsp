<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user List</title>
</head>
<body>
	<h1>게시판 목록</h1>
	<table>
		<tr>
			<td>번호
			<td>
			<td>level
			<td>
			<td>ID
			<td>
			<td>Name
			<td>
			<td>Gender
			<td>
			<td>email
			<td>
			<td>birth
			<td>
			<td>reg_dt
			<td>
			<td>udt_dt
			<td>
			<td>login_dt
			<td>
		</tr>
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.userNo}
				<td>
				<td>${item.userLevel}
				<td>
				<td><a href="/user/view?no=${item.userNo}">${item.userId}</a>
				<td>
				<td>${item.userName}
				<td>
				<td>${item.userGender}
				<td>
				<td>${item.userEmail}
				<td>
				<td>${item.userBirth}
				<td>
				<td>${item.userRegDate}
				<td>
				<td>${item.userUdtDate}
				<td>
				<td>${item.userLoginDate}
				<td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>