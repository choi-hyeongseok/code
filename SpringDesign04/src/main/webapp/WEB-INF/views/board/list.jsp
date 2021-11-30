<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>HScoding</title>
<html>
<!-- head -->
<%@ include file="../include/head.jsp"%>

<body>
	<!-- main header -->
	<%@ include file="../include/main_header.jsp"%>

	<!-- main content -->
	

	<div class="padding">
		<!-- content menu -->
			<section class="content-header">
				<h1>
					자유 게시판 <small>Free Board</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#">Board</a></li>
					<li class="active"><a href="#">List</a></li>
				</ol>
			</section>
			
		<div class="container">
			<div class="search row">
				<div class="form-group col-sm-2">
					<select class="form-control" name="searchType" id="searchType">
						
						<option value="t"
							<c:out value="${searchCriteria.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						<option value="c"
							<c:out value="${searchCriteria.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						<option value="w"
							<c:out value="${searchCriteria.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						<option value="tc"
							<c:out value="${searchCriteria.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						<option value="cw"
							<c:out value="${searchCriteria.searchType eq 'cw' ? 'selected' : ''}"/>>내용+작성자</option>
						<option value="tcw"
							<c:out value="${searchCriteria.searchType eq 'tcw' ? 'selected' : ''}"/>>제목+내용+작성자</option>
					</select>
				</div>
				<div class="col-xs-10 col-sm-10">
					<div class="input-group">
						<input type="text" class="form-control" name="keyword" id="keywordInput" value="${searchCriteria.keyword}" placeholder="검색어"> 
							<span class="input-group-btn">
							<button type="button" class="btn btn-primary form-control"
								id="searchBtn">
								<i class="fa fa-search"></i> Search </button>
						</span>
					</div>
				</div>
			</div>
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
					<c:forEach items="${list}" var="board">
						<tr>
							<td>${board.boardNo}</td>
							<td><a
								href="${path}/board/view${pageMaker.makeSearch(pageMaker.criteria.page)}&boardNo=${board.boardNo}">${board.boardTitle}</a></td>
							<td>${board.boardId}</td>
							<td><fmt:formatDate value="${board.boardRegDate}"
									pattern="yyyy-MM-dd a HH:mm" /></td>
							<td><span class="">${board.boardHit}</span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="">
							<div class="text-center">
								<ul class="pagination">
									<li><a
											href="${path}/board/list${pageMaker.makeSearch(1)}">|< </a></li>
									<c:if test="${pageMaker.prev}">
										<li><a href="${path}/board/list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
										<li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
											<a href="${path}/board/list${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="${path}/board/list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>											
									</c:if>
									<li><a
											href="${path}/board/list${pageMaker.makeSearch(pageMaker.overPage)}">>|</a></li>									
								</ul>
							</div>
						</div>
						<div class="">
						<c:if test="${!empty login.userId || 0==0 }">
							<div class="pull-right">
								<button type="button" class="btn btn-success btn-flat" id="writeBtn">
									<i class="fa fa-pencil"></i> 글쓰기
								</button>
							</div>
							</c:if>
						</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../include/main_footer.jsp"%>

	<!-- plugin_js -->
	<%@ include file="../include/plugin_js.jsp"%>
	
	<script type="text/javascript">
	$(document).ready(function () {
		
		var formObj = $("form[role='form']");
		console.log(formObj);

		//${path}/board/write
		
		$("#writeBtn").on("click", function() {
			self.location = "/board/write"
		});

	    $("#searchBtn").on("click", function (event) {
	        self.location =
	            "/board/list${pageMaker.makeQuery(1)}"
	            + "&searchType=" + $("select option:selected").val()
	            + "&keyword=" + encodeURIComponent($("#keywordInput").val());
	    });
	});
	</script>

</body>
</html>