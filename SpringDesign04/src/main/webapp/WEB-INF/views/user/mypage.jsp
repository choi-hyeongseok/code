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
				개인 정보 페이지 <small>조회</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#">user</a></li>
				<li class="active"><a href="#">View</a></li>
			</ol>
		</section>

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th colspan="2">개인정보</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>이름</td>
								<td>${login.userName }</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td>${login.userId }</td>
							</tr>
							<tr>
								<td>유저 등급</td>
								<td>${login.userLevel }</td>
							</tr>
							<tr>
								<td>성별</td>
								<td>${login.userGender }</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>${login.userEmail }</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>${login.userBirth }</td>
							</tr>
							<tr>
								<td>가입일</td>
								<td><fmt:formatDate value="${login.userRegDate }" pattern="yyyy-MM-dd a HH:mm" /></td>								
							</tr>
							<tr>
								<td>최근 수정일</td>
								<td><fmt:formatDate value="${login.userUdtDate }" pattern="yyyy-MM-dd a HH:mm" /></td>
							</tr>
							<tr>
								<td>이전 최근 접속일</td>
								<td><fmt:formatDate value="${login.userLoginDate }" pattern="yyyy-MM-dd a HH:mm" /></td>								
							</tr>
						</tbody>
					</table>					
					<div class="board-page">
						<c:if test="${!empty login.userId}">
							<div class="pull-right">
								<button type="submit" class="btn btn-warning modBtn">
									<i class="fa fa-edit"></i> 수정
								</button>
								<button type="submit" class="btn btn-danger delBtn" style="display: none;">
									<i class="fa fa-trash"></i> 탈퇴
								</button>
							</div>
						</c:if>
					</div>
				</div>
			</div>

		</div>
	</div>


	<!-- footer -->
	<%@ include file="../include/main_footer.jsp"%>

	<!-- plugin_js -->
	<%@ include file="../include/plugin_js.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {

			/*게시글 =================================================================*/
			// 게시글 관련 기능별 페이지 버튼 옵션
			var formObj = $("form[role='form']");
			console.log(formObj);
			$(".modBtn").on("click", function() {
				self.location = "/user/modify"
			});

			$(".modBtn").on("click", function() {
				formObj.attr("action", "/user/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".delBtn").on("click", function() {
				formObj.attr("action", "/user/delete");
				formObj.submit();
			});			
		});
	</script>
</body>
</html>