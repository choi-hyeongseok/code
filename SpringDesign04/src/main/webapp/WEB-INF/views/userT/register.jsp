<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	//모든 공백 체크 정규식
	var empJ = /\s/g; //아이디 정규식 
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/; // 비밀번호 정규식 
	var pwJ = /^[A-Za-z0-9]{4,12}$/; // 이름 정규식 
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; // 이메일 검사 정규식 
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 휴대폰 번호 정규식 
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
	var birthJ = false;
	
	var address = $('#mem_detailaddress');

	$(document).ready(function() {
		var address = $('#mem_detailaddress'); //아이디 중복확인 
		
		$("#userId").blur(function() { 
			if($('#userId').val()==''){
				$('#id_check').text('아이디를 입력하세요.');
				$('#id_check').css('color', 'red');
				} else if(idJ.test($('#userId').val())!=true){ 
					$('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.'); 
					$('#id_check').css('color', 'red');
					} else if($('#userId').val()!=''){
						var userId=$('#userId').val();
						$.ajax({ 
							async : true, type : 'POST', data : userId,//userId라는 이름으로 userId라는 데이터를 @WebServlet("/idsearch.do")에 보내겠다 
							url : 'idcheck.do', dateType: 'json', contentType: "application/json; charset=UTF-8",
							success : function(data) { 
								if(data.cnt > 0){ 
									$('#id_check').text('중복된 아이디 입니다.');
									$('#id_check').css('color', 'red');
									$("#usercheck").attr("disabled", true);
									}else{ 
										if(idJ.test(userId)){ 
											$('#id_check').text('사용가능한 아이디 입니다.');
											$('#id_check').css('color', 'blue');
											$("#usercheck").attr("disabled", false);
											} else if(userId==''){ $('#id_check').text('아이디를 입력해주세요.');
											$('#id_check').css('color', 'red');
											$("#usercheck").attr("disabled", true);
											} else{
												$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
												$('#id_check').css('color', 'red');
												$("#usercheck").attr("disabled", true);
												} } } 
							}); //ajax///
						}//else if
						});//blur
	}
	
</script>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="${path}/"> <b>HScoding</b>&nbsp <b>HScoding</b>
			</a>
		</div>

		<div class="register-box-body"
			style="border-radius: 10px 10px 10px 10px;">
			<p class="login-box-msg">회원가입 페이지</p>

			<form action="${path}/user/register" method="post">
				<div class="form-group has-feedback">
					<input type="text" name="userId" id="userId" class="form-control"
						placeholder="아아디"> <span
						class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
						<div class="eheck_font" id="id_check"></div>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="userPw" class="form-control"
						placeholder="비밀번호"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" placeholder="비밀번호 확인">
					<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="userName" class="form-control"
						placeholder="이름"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="tel" name="userBirth" class="form-control"
						placeholder="생년월일"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="email" name="userEmail" class="form-control"
						placeholder="이메일"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group">
					<input class="form-control" style="width: 40%; display: inline;"
						placeholder="우편번호" name="userAddress" id="userAddress"
						type="text" readonly="readonly">
					<button type="button" class="btn btn-default"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>
				<div class="form-group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="mem_address" id="mem_address" type="text"
						readonly="readonly" />
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="상세주소"
						name="mem_detailaddress" id="mem_detailaddress" type="text" />
				</div>



				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck" style="margin-left: 20px;">
							<label> <input type="checkbox"> 약관에 <a href="#">동의</a>
							</label>
						</div>
					</div>
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">가입</button>
					</div>
				</div>
			</form>

			<div class="social-auth-links text-center">
				<p>- 또는 -</p>
				<a href="#" class="btn btn-block btn-social btn-facebook btn-flat">
					<i class="fa fa-facebook"></i> 페이스북으로 가입
				</a> <a href="#" class="btn btn-block btn-social btn-google btn-flat">
					<i class="fa fa-google-plus"></i> 구글 계정으로 가입
				</a>
			</div>

			<a href="${path}/user/login" class="text-center">로그인</a>
		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->

	<%@ include file="../include/plugin_js.jsp"%>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>