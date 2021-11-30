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
				개인 정보 페이지 <small>수정</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#">user</a></li>
				<li class="active"><a href="#">View</a></li>
				<li class="active"><a href="#">Modify</a></li>
			</ol>
		</section>

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form class="validation-form" action="${path}/user/update"
						method="post" novalidate>
						<div class="mb-3">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="userId" name="userId"
								placeholder="아이디를 입력" value="${login.userId }"
								readonly="readonly" required>
						</div>
						<div class="mb-3">
							<label for="password">패스워드</label> <input type="password"
								class="form-control" id="userPw" name="userPw"
								placeholder="패스워드 입력" required>				
						</div>
						<div class="mb-3">
							<label for="passwordConfirm">패스워드 확인</label> <input
								type="password" class="form-control" id="userPwConfirm"
								placeholder="패스워드 확인" required>
						</div>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="name">이름</label> <input type="text"
									class="form-control" id="userName" name="userName"
									placeholder="이름을 입력" value="${login.userName }" required>
							</div>

						</div>
						<div class="mb-3">
							<label for="email">이메일</label> <input type="email"
								class="form-control" id="userEmail" name="userEmail"
								placeholder="you@example.com" value="${login.userEmail }"
								readonly="readonly" required>
						</div>
						<div class="mb-3">
							<label for="email">성별</label><br> <input type="radio"
								name="userGender" value="여성"
								<c:if test="${login.userGender == '여성' }">checked="checked"</c:if>>여성
							<input type="radio" name="userGender" value="남성"
								<c:if test="${login.userGender == '남성' }">checked="checked"</c:if>>남성
						</div>
						<hr class="mb-4">

						<button class="btn btn-primary btn-lg btn-block" id="reg_submit"
							type="submit">수정 하기</button>
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
		$(document).ready(function() {

			/*게시글 =================================================================*/
			// 게시글 관련 기능별 페이지 버튼 옵션
			var formObj = $("form[role='form']");
			console.log(formObj);

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