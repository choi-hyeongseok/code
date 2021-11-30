<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- head -->
<%@ include file="../include/head.jsp"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"
	charset="utf-8"></script>

<body>
	<!-- main header -->
	<%@ include file="../include/main_header.jsp"%>

	<!-- main content -->


	<div class="padding">
		<!-- content menu -->
		<section class="content-header">
			<h1>
				자유 게시판 <small>글 수정</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#">Board</a></li>
				<li class="active"><a href="#">List</a></li>
				<li class="active"><a href="#">Modify</a></li>
			</ol>
		</section>

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form role="form" id="writeForm" method="post" action="${path}/board/modify" enctype="multipart/form-data">
						<div class="box box-primary">							
							<div class="box-body">
								<div class="form-group">
									<label for="title">제목</label> <input class="form-control"
										id="title" name="boardTitle" placeholder="제목을 입력해주세요" value="${board.boardTitle}">
								</div>
								<div class="form-group">
									<label for="content">내용</label>


									<textarea id="txtContent" name="boardContent" rows="10"
										cols="100" style="width: 100%;">${board.boardContent}</textarea>
									<!-- textarea 밑에 script 작성하기 -->
									<script type="text/javascript">
										$(function() {
											CKEDITOR.replace('txtContent',{
												filebrowserUploadUrl : '${pageCotext.request.contextPath}/file/fileupload.do'
											});
										})
									</script>
									
								</div>
								<div class="form-group">									
								     <div class="board-footer">						
										<c:if test="${!empty board.boardFileId}">
										<span>다운로드</span>
											<c:forEach items="${boardFiles}" var="files">
											<input type="file" name="boardUploadFile" id="boardUploadFile" value=""/> <input type="button" id="uploadFileBtnSet" value="취소"/>													
											</c:forEach>									
										</c:if>											
									</div>									 									 	
								</div>
								<div class="form-group">
									<label for="writer">작성자</label> <input class="form-control"
										id="writer" name="boardId" value="${board.boardId}" readonly>
								</div>
							</div>
							<div class="box-footer">
								<input type="hidden" name="boardNo" value="${board.boardNo}"> 
								<input type="hidden" name="page" value="${searchCriteria.page}"> 
								<input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
								<input type="hidden" name="searchType" value="${searchCriteria.searchType}">
								<input type="hidden" name="keyword"	value="${searchCriteria.keyword}">
								<button type="button" class="btn btn-primary">
									<i class="fa fa-list"></i> 목록
								</button>
								<div class="pull-right">
									<button type="button" class="btn btn-warning cancelBtn">
										<i class="fa fa-trash"></i> 취소
									</button>
									<button type="submit" class="btn btn-success modBtn">
										<i class="fa fa-save"></i> 수정 저장
									</button>
								</div>
							</div>							
						</div>
					</form>
				</div>
			
			</div>
		</div>

	</div>

	<!-- footer -->
	<%@ include file="../include/main_footer.jsp"%>

	<!-- plugin_js -->
	<%@ include file="../include/plugin_js.jsp"%>

	<script type="text/javascript">
		<%-- $(document).ready(function() {

			var formObj = $("form[role='form']");
			console.log(formObj);

			$(".btn-primary").on("click", function() {
				self.location = "/board/list"
			});

			$(".btn-warning").on("click", function() {
				formObj.attr("action", "/board/write");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".btn-success").on("click", function() {
				save();
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});

		});
		--%>
		$(document)
		.ready(
				function() {

					var formObj = $("form[role='form']");
					console.log(formObj);

					$(".modBtn").on("click", function() {
						formObj.submit();
					});

					$(".cancelBtn").on("click", function() {
						history.go(-1);
					});

					$(".listBtn")
							.on(
									"click",
									function() {
										self.location = "/board/list?page=${searchCriteria.page}"
								            + "&perPageNum=${searchCriteria.perPageNum}"
								            + "&searchType=${searchCriteria.searchType}"
								            + "&keyword=${searchCriteria.keyword}";
									});
					
					$("#uploadFileBtnSet").on("click", function() {				
						console.log("test");
						$("#boardUploadFile").val("");
					});

				});

		function save() {
			oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
			//스마트 에디터 값을 텍스트컨텐츠로 전달
			var content = document.getElementById("smartEditor").value;
			alert(document.getElementById("txtContent").value);
			// 값을 불러올 땐 document.get으로 받아오기
			return;
		}
	</script>
</body>
</html>