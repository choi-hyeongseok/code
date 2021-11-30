<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Title</title>
<html>
<%@ include file="./include/head.jsp"%>

<body>
	<!-- main header -->
	<%@ include file="./include/main_header.jsp"%>
	
	<!-- main contents -->
	<button type="button">기본 버튼</button>
	<button type="button" class="btn">기본 버튼</button>
	<button type="button" class="btn btn-primary">기본 버튼</button>

	<p class="text-primary text-uppercase text-center">Lorem Ipsum is
		simply dummy text of the printing and typesetting industry. Lorem
		Ipsum has been the industry's standard dummy text ever since the
		1500s, when an unknown printer took a galley of type and scrambled it
		to make a type specimen book. It has survived not only five centuries,
		but also the leap into electronic typesetting , remaining essentially
		unchanged. It was popularised in the 1960s with the release of
		Letraset sheets containing Lorem Ipsum passages , and more recently
		with desktop publishing software like Aldus PageMaker including
		versions of Lorem Ipsum.</p>
	<div>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>165</td>
					<td>이제 곧 부트</td>
					<td>길라임</td>
					<td>2016.01.02</td>
					<td>3</td>
				<tr>
					<td>165</td>
					<td>이제 곧 부트</td>
					<td>길라임</td>
					<td>2016.01.02</td>
					<td>3</td>
				<tr>
					<td>165</td>
					<td>이제 곧 부트</td>
					<td>길라임</td>
					<td>2016.01.02</td>
					<td>3</td>

				</tr>
			</tbody>
		</table>

		<hr>
		<a class="btn btn-default pull-right">글쓰기</a>

		<div class="text-center">
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>

			</ul>
		</div>
	</div>


	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
</body>
</html>