<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 화면 샘플 - Bootstrap</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>
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
						} else if(userId==''){ 
							$('#id_check').text('아이디를 입력해주세요.');
							$('#id_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
							} else{
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							$('#id_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
							} 
						} 
				} 
			}); //ajax///
		}//else if
		});//blur
		
		$('form').on('submit',function(){ 
			var inval_Arr = new Array(8).fill(false);
			if (idJ.test($('#mem_id').val())) {
				inval_Arr[0] = true; 
			} else {
			inval_Arr[0] = false;
			alert('아이디를 확인하세요.');
			return false;
			} // 비밀번호가 같은 경우 && 비밀번호 정규식 
			if (($('#mem_pw').val() == ($('#mem_pw2').val())) && pwJ.test($('#mem_pw').val())) { 
				inval_Arr[1] = true;
				} else {
				inval_Arr[1] = false;
				alert('비밀번호를 확인하세요.');
				return false;
				} // 이름 정규식 
				if (nameJ.test($('#mem_name').val())) {
					inval_Arr[2] = true;
					} else { 
						inval_Arr[2] = false;
						alert('이름을 확인하세요.');
						return false; 
						} // 생년월일 정규식 
						if (birthJ) {
							console.log(birthJ);
							inval_Arr[3] = true;
							} else {
								inval_Arr[3] = false;
								alert('생년월일을 확인하세요.');
								return false; 
								} // 이메일 정규식 
								if (mailJ.test($('#mem_email').val())){
									console.log(phoneJ.test($('#mem_email').val()));
									inval_Arr[4] = true;
									} else { 
										inval_Arr[4] = false;
										alert('이메일을 확인하세요.');
										return false; 
										} // 휴대폰번호 정규식 
										if (phoneJ.test($('#mem_phone').val())) {
											console.log(phoneJ.test($('#mem_phone').val()));
											inval_Arr[5] = true;
											} else { 
												inval_Arr[5] = false;
												alert('휴대폰 번호를 확인하세요.');
												return false;
												} //성별 확인 
												if(member.mem_gender[0].checked==false&&member.mem_gender[1].checked==false){
													inval_Arr[6] = false;
													alert('성별을 확인하세요.'); 
													return false;
													} else{ 
														inval_Arr[6] = true;
														}
		}

}

</script>


<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form" action="${path}/user/regist"
					method="post" novalidate>
					<div class="mb-3">
						<label for="id">아이디</label> <input type="text"
							class="form-control" id="userId" name="userId"
							placeholder="아이디를 입력" required>
						<div class="invalid-feedback">아이디를 입력해주세요.</div>
						<div class="check_font" id="id_check"></div>
					</div>
					<div class="mb-3">
						<label for="password">패스워드</label> <input type="password"
							class="form-control" id="userPw" name="userPw"
							placeholder="패스워드 입력" required>
						<div class="invalid-feedback">패스워드를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="passwordConfirm">패스워드 확인</label> <input
							type="password" class="form-control" id="userPwConfirm"
							placeholder="패스워드 확인" required>
						<div class="invalid-feedback">패스워드 확인을 입력해주세요.</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="userName" name="userName"
								placeholder="이름을 입력" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>

					</div>
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="userEmail" name="userEmail"
							placeholder="you@example.com" required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="email">성별</label><br> <input type="radio"
							name="userGender" value="여성" checked="checked">여성 <input
							type="radio" name="userGender" value="남성">남성
					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" id="reg_submit"
						type="submit">가입 완료</button>
				</form>
				<hr class="mb-4">
				<a href="${path}/user/findpw">비밀번호 찾기</a><br> <a
					href="${path}/user/login" class="text-center">로그인</a><br> <a
					href="${path}/" class="text-center">홈페이지로 이동</a>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2021 YD</p>
		</footer>
	</div>
	<script>
	// 데이터 입력 확인
	window.addEventListener('load', () => { 
		const forms = document.getElementsByClassName('validation-form');
		Array.prototype.filter.call(forms, (form) => { 
			form.addEventListener('submit', function (event) { 
				if (form.checkValidity() === false) {
					event.preventDefault();
					event.stopPropagation();
					} 
				form.classList.add('was-validated');
				}, false);
			});
		}, false); 
	
	
	// 아이디 유효성 검증
	$("#userId").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#userId').val();
		$.ajax({
			url : '/user/idCheck?userId='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						/*
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
							else {
								
								$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
								$('#id_check').css('color', 'red');
								$("#reg_submit").attr("disabled", true);
							}
						}*/	
						
						if(user_id == ""){
							$('#id_check').text('아이디를 입력해주세요.');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);											
						} else {
							$('#id_check').text('사용가능한 아아디입니다.');
							$('#id_check').css('color', 'blue');							
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	
	</script>
</body>
</html>

