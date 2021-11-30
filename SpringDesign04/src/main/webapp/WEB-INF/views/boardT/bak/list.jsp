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
	<div class="col-lg-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">게시글 목록</h3>
			</div>
			<div class="box-body">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th style="width: 30px">#</th>
							<th>제목</th>
							<th style="width: 100px">작성자</th>
							<th style="width: 150px">작성시간</th>
							<th style="width: 60px">조회</th>
						</tr>
						<c:forEach items="${articles}" var="article">
							<tr>
								<td>${article.boardNo}</td>
								<td><a
									href="${path}/article/read?articleNo=${article.boardNo}">${article.boardTitle}</a></td>
								<td>${article.boardId}</td>
								<td><fmt:formatDate value="${article.boardRegDate}"/></td>
								<td><span class="badge bg-red">${article.boardHit}</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="box-footer">
				<div class="pull-right">
					<button type="button" class="btn btn-success btn-flat"
						id="writeBtn">
						<i class="fa fa-pencil"></i> 글쓰기
					</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>