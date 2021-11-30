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
				자유 게시판 <small>조회</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#">Board</a></li>
				<li class="active"><a href="#">List</a></li>
				<li class="active"><a href="#">View</a></li>
			</ol>
		</section>

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="">
					<p>${board.boardNo}</p>						
					</div>
					<div class="box-header">
						<h3 class="">${board.boardTitle}</h3>
						<hr>
					</div>
						<div class="board-header">
							<div class="user-block">
								<img class="img-circle img-bordered-sm" style="display: none;" src="" alt="user image">
								 <span class="boardId"> 작성자 [ <a href="#">${board.boardId} ]</a> | </span>
								 <span class="description"><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value="${board.boardRegDate}"/></span>
								 <span class="boardHit"> 조회수 ${board.boardHit}</span>								
							</div>
						</div>
						<div class="board-body" style="height: 700px">
							${board.boardContent}</div>
						<hr>
						<div class="board-footer">						
							<c:if test="${!empty board.boardFileId}">
							<span>다운로드</span>
								<c:forEach items="${boardFiles}" var="files">							
									<form action="/file/download" method="post">									
										 <c:out value="${files.fileName }"></c:out> 
											<input type="hidden" name="filename" value="${files.fileName }">
											<input type="submit" value="다운로드">
										</form>		
								</c:forEach>									
							</c:if>											
						</div>
						<hr>
						<div class="board-page">					
							<form role="form" method="post">
								<input type="hidden" name="boardNo" value="${board.boardNo}">
								<input type="hidden" name="page" value="${searchCriteria.page}">
								<input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}">
								<input type="hidden" name="searchType" value="${searchCriteria.searchType}">
								<input type="hidden" name="keyword" value="${searchCriteria.keyword}">
							</form>
							<button type="submit" class="btn btn-primary listBtn">
								<i class="fa fa-list"></i> 목록
							</button>
							<c:if test="${login.userId == board.boardId || login.userLevel == 1 }">
								<div class="pull-right">
								<button type="submit" class="btn btn-warning modBtn">
									<i class="fa fa-edit"></i> 수정
								</button>
								<button type="submit" class="btn btn-danger delBtn">
									<i class="fa fa-trash"></i> 삭제
								</button>
							</div>
							</c:if>
							
						</div>
						<section class="content container-fluid">
							<div class="col-lg-12">											
								<div class="box box-primary">
									<div class="box-header with-border">
										<h3 class="box-title">댓글 작성</h3>
									</div>
									<div class="box-body">
										<div class="form-group">
											<textarea id="newReplyContent" name="replyContent" rows="10" cols="100" style="width: 100%;" placeholder="댓글 내용을 입력해주세요"></textarea>											
										</div>
										<div class="form-group">
											<c:choose>
											<c:when test="${!empty login.userId}">
												<input type="hidden" class="form-control" id="newReplyId" name="replyId" value="${login.userId}">												
												<input type="hidden" class="form-control" id="newReplyPw" name="replyPw" value="">
												<input type="hidden" class="form-control" id="newReplyLogin" name="replyLogin" value="1">
											</c:when>
											<c:otherwise>
												<input class="form-control" id="newReplyId" name="replyId" placeholder="닉네임 입력">											
												<input class="form-control" id="newReplyPw" name="replyPw" placeholder="패스워드 입력" type="password" style='margin-top: 5px;' >
												<input type="hidden" id="newReplyLogin" name="replyLogin" value="0">										
											</c:otherwise>									
											</c:choose>
											
											<input type="hidden" style='margin-top: 5px;' class="form-control" id="newReplyClass" name="replyClass" value="0">
											<input type="hidden" style='margin-top: 5px;' class="form-control" id="newReplyGrp" name="replyGrp" value="0">										
										</div>
										<div class="form-group">
											<button type="button" class="btn btn-success" id="replyAddBtn">등록</button>
										</div>
									</div>
									<div class="box-footer">
										<ul id="replies">
										</ul>
									</div>
									<div class="box-footer">
										<div class="text-center">
											<ul class="pagination pagination-sm no-margin">
											</ul>
										</div>
									</div>
								</div>
							</div>								
							<%-- 로그인 사용자 댓글 수정 --%>
							<div class="modal fade" id="modifyModal" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">패스워드 입력창</h4>
										</div>																		
										<div class="modal-body">.
											<div class="form-group">
												<input type="hidden" class="form-control" id="replyNo" name="replyNo" readonly>
											</div>
											<div class="form-group">												
												<textarea id="replyContent" name="replyContent" rows="10" cols="100" style="width: 100%;" placeholder="댓글 내용을 입력해주세요"></textarea>
											</div>
											<div class="form-group" style="display: none;">
												<label for="replyId">댓글 작성자</label> 
												<input class="form-control" id="replyId" name="replyId"	readonly>
												<input type="hidden" id="replyLogin" name="replyLogin" value="1">																								
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-success modalModBtn">수정</button>
											<button type="button" class="btn btn-danger modalDelBtn">삭제</button>								
										</div>
									</div>
								</div>
							</div>
							
							<%-- 비회원 댓글 수정/ 삭제 dialog --%>
							<div class="modal fade" id="modifyModalNon" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">비 회원 댓글 수정창</h4>
										</div>																		
										<div class="modal-body">
											<div class="form-group">
												<label for="replyNo">댓글 번호</label> <input
													class="form-control" id="replyNoNon" name="replyNo" readonly>
											</div>
											<div class="form-group">
												<label for="replyContent">댓글 내용</label> 
												<textarea id="replyContentNon" name="replyContent" rows="10" cols="100" style="width: 100%;" placeholder="댓글 내용을 입력해주세요"></textarea>
											</div>
											<div class="form-group">
												<label for="replyId">댓글 작성자</label> 
												<input class="form-control" id="replyIdNon" name="replyId"	readonly>
												<input class="form-control" id="replyPwNon" name="replyPw" placeholder="패스워드 입력" type="password" style='margin-top: 5px;' >
												<input type="hidden" id="replyLoginNon" name="replyLoginNon" value="0">	
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-success NonModalModBtn">수정</button>
											<button type="button" class="btn btn-danger NonModalDelBtn">삭제</button>
										</div>
									</div>
								</div>
							</div>
							
							<%-- 대댓글 작성 dialog --%>
							<div class="modal fade" id="createModal" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">대댓글 달기</h4>
										</div>
										<div class="modal-body">
											<div class="form-group" style="display: none;">
												<label for="replyNo">댓글 번호</label>
													<input class="form-control" id="replyNo" name="replyNo" readonly>
											</div>
											<div class="form-group">
												<label for="replyContent">댓글 내용</label> 
												<textarea id="newToReplyContent" name="replyContent" rows="10" cols="100" style="width: 100%;" placeholder="댓글 내용을 입력해주세요"></textarea>
											</div>
											<div class="form-group">
												<label for="replyId">댓글 작성자</label>											
												<c:choose>
												<c:when test="${!empty login.userId }">
													<input type="text" class="form-control" id="newToReplyId" name="replyId" placeholder="닉네임 입력" value="${login.userId }" readonly="readonly">
													<input type="hidden" class="form-control" id="newToReplyPw" name="replyPw" placeholder="패스워드 입력" type="password" style='margin-top: 5px;' value="${login.userId }" >																				
													<input type="hidden" style='margin-top: 5px;' class="form-control" id="newToReplyLogin" name="replyLogin" value="1">
												</c:when>
												<c:otherwise>
													<input class="form-control" id="newToReplyId" name="replyId" placeholder="닉네임 입력" >
													<input class="form-control" id="newToReplyPw" name="replyPw" placeholder="패스워드 입력" type="password" style='margin-top: 5px;'>																																																										
													<input type="hidden" style='margin-top: 5px;' class="form-control" id="newToReplyLogin" name="replyLogin" value="0">
												</c:otherwise>
												</c:choose>
												
												<input type="hidden" style='margin-top: 5px;' class="form-control" id="newToReplyClass" name="replyClass" value="1">
												<input type="hidden" style='margin-top: 5px;' class="form-control" id="newToReplyGrp" name="replyGrp">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-success" id="replyToAddBtn">답글 달기</button>										
										</div>
									</div>
								</div>
							</div>
													
						</section>
						
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
			formObj.attr("action", "/board/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$(".delBtn").on("click", function() {
			formObj.attr("action", "/board/delete");
			formObj.submit();
		});

		$(".listBtn").on("click", function() {
			self.location = "/board/list"
		});
		/*리스트 가져오기============================================================*/
		var boardNo = ${board.boardNo};
		// 목록페이지 번호 변수 선언, 1로 초기화(첫번째 페이지)
		var replyPageNum = 1;

		// 댓글 리스트 패이징 처리 
		getRepliesPaging(replyPageNum);

		// 목록페이지 번호 클릭 이벤트
		$(".pagination").on("click", "li a", function (event) {

		    event.preventDefault();
		    replyPageNum = $(this).attr("href"); // 목록 페이지 번호 추출
		    getRepliesPaging(replyPageNum); // 목록 페이지 호출

		});
		
		/* 댓글 =================================================================*/
		// 댓글 저장 버튼 클릭 이벤트 발생시
		$("#replyAddBtn").on("click", function () {

		    // 화면으로부터 입력 받은 변수값의 처리
		    var replyContent = $("#newReplyContent");
		    var replyId = $("#newReplyId");
		    var replyPw = $("#newReplyPw");
		    var replyLogin = $("#newReplyLogin");
		    var replyClass = $("#newReplyClass");
		    var replyGrp = $("#newReplyGrp");

		    var replyContentVal = replyContent.val();
		    var replyIdVal = replyId.val();
		    var replyPwVal = replyPw.val();
		    var replyLoginVal = replyLogin.val();
		    var replyClassVal = replyClass.val();
		    var replyGrpVal = replyGrp.val();

		    // AJAX 통신 : POST
		    $.ajax({
		        type : "post",
		        url : "/replies",
		        headers : {
		            "Content-type" : "application/json",
		            "X-HTTP-Method-Override" : "POST"
		        },
		        dataType : "text",
		        data : JSON.stringify({
		            boardNo : boardNo,
		            replyContent : replyContentVal,
		            replyId : replyIdVal,
		            replyPw : replyPwVal,
		            replyLogin : replyLoginVal,
		            replyClass : replyClassVal,
		            replyGrp : replyGrpVal
		        }),
		        success : function (result) {
		            // 성공적인 댓글 등록 처리 알림
		            if (result == "regSuccess") {
		                alert("댓글 등록 완료!");
		            }
		            
		            getRepliesPaging(replyPageNum);
		            replyContent.val(""); // 댓글 내용 초기화
		            replyGrp.val(""); // 댓글 그룹 초기화
		            window.location.reload();
		        }
		    });
		});
		
		// 대댓글 저장 버튼 클릭 이벤트 발생시
		$("#replyToAddBtn").on("click", function () {

		    // 화면으로부터 입력 받은 변수값의 처리
		    var replyContent = $("#newToReplyContent");
		    var replyId = $("#newToReplyId");
		    var replyPw = $("#newToReplyPw");
		    var replyLogin = $("#newToReplyLogin");
		    var replyClass = $("#newToReplyClass");
		    var replyGrp = $("#newToReplyGrp");

		    var replyContentVal = replyContent.val();
		    var replyIdVal = replyId.val();
		    var replyPwVal = replyPw.val();
		    var replyLoginVal = replyLogin.val();
		    var replyClassVal = replyClass.val();
		    var replyGrpVal = replyGrp.val();

		    // AJAX 통신 : POST
		    $.ajax({
		        type : "post",
		        url : "/replies",
		        headers : {
		            "Content-type" : "application/json",
		            "X-HTTP-Method-Override" : "POST"
		        },
		        dataType : "text",
		        data : JSON.stringify({
		            boardNo : boardNo,
		            replyContent : replyContentVal,
		            replyId : replyIdVal,
		            replyPw : replyPwVal,
		            replyLogin : replyLoginVal,
		            replyClass : replyClassVal,
		            replyGrp : replyGrpVal
		        }),
		        success : function (result) {
		            // 성공적인 댓글 등록 처리 알림
		           
		            if (result == "regSuccess") {
		                alert("댓글 등록 완료!");
		                getRepliesPaging(replyPageNum);
			            replyContent.val(""); // 댓글 내용 초기화
			            replyGrp.val(""); // 댓글 그룹 초기화
			            window.location.reload();
		            } else if(result == "regFailure"){
		            	alert("패스워드 불일치");
		            	
		            }else {
		            	getRepliesPaging(replyPageNum);
			            replyContent.val(""); // 댓글 내용 초기화
			            replyGrp.val(""); // 댓글 그룹 초기화
			            window.location.reload();
		            }
		           
		        }
		    });
		});
		
		// 댓글 수정 클릭시 댓글 수정 폼으로 데이터 전환
		$("#replies").on("click", ".replyLi button", function () {
		    var reply = $(this).parent();

		    var replyNo = reply.attr("data-replyNo");
		    var replyId = reply.find(".replyId").text();
		    var replyContent = reply.find(".replyContent").text();			    			   
		    var replyGrp = reply.find(".replyGrp").text();
		    var replyLogin = reply.find(".replyLogin").text();
		    
		    			   
		    // 회원 댓글 수정/삭제 modal		
    		$("#replyNo").val(replyNo);			    
		    $("#replyId").val(replyId);
		    $("#replyContent").val(replyContent);
		    $("#replyLogin").val(replyLogin);
		    
		    // 비회원 댓글의 수정/삭제 modal 전달
		    // Non
		    $("#replyNoNon").val(replyNo);			    
		    $("#replyIdNon").val(replyId);
		    $("#replyContentNon").val(replyContent);
		    $("#replyLoginNon").val(replyLogin);
		    
		    // 답글 달기 modal
		    // new
		    $("#newToReplyNo").val(replyNo);			    
		    //$("#newToReplyId").val(replyId);
		    //$("#newToReplyContent").val(replyContent);
		    $("#newToReplyGrp").val(replyGrp);
		    
		});
					
		// 댓글 목록 페이징 함수
		function getRepliesPaging(page) {
			
		    $.getJSON("/replies/" + boardNo + "/" + page, function (data) {			

		        var str = "";
		        
		        var userID = "${login.userId}";		        
		        
		      	var a = 0;
		       
		        
		        $(data.replies).each(function () {
		        	
		        	const date = new Date(this.replyRegDate + 3240 * 10000).toISOString().split("T")[0]
	        		const time = new Date(this.replyRegDate).toTimeString().split(" ")[0];
		        	
		        	console.log((a++)+": "+this.replyNo);
		        	
		        	if(this.replyClass==0){
		        		if(this.replyDelFlag == 'Y') {
		        			str += "<li style='list-style:none' data-replyNo='" + this.replyNo + "' class='replyLi'>"		        		 	
		        		 	+  "<p class='replyId' style='margin-bottom : 0px;'>" + this.replyId + "</p>"
			                +  "<p class='replyRegDate' style='margin-bottom : 25px;'>" + date+' '+ time + "</p>"	  
		        		 	+  "<p class='replyContent'>" + this.replyContent + "</p>"
			                +  "<p style='display:none' class='replyLogin'>" + this.replyLogin + "</p>"				               
			                +  "<p style='display:none' class='replyClass'> 클래스 : " +this.replyClass  + "</p>"
			                +  "<p style='display:none' class='replyGrp'>" +this.replyGrp  + "</p>";
			                
			                if(this.replyLogin == 1){
			                	if(this.replyId == userID){
			                		str +="<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정/삭제(회원)</button>";
			                	}
			                					                					                
			                }else {
			                	str +="<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModalNon'>댓글 수정/삭제(비회원)</button>";
			                }	
			                
			                str +="<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#createModal'>댓글 달기</button>"
			                +  "</li>"
			                +  "<hr/>";
		        		} else {
		        			str += "<li style='list-style:none' data-replyNo='" + this.replyNo + "' class='replyLi'>"
		        				+  "<p class='replyId' style='margin-bottom : 0px;'> 삭제된 댓글입니다. </p>"
		        				+  "</li>"
					            +  "<hr/>";
		        		}
		        		
		        		 
		        	}else {
		        		if(this.replyDelFlag == 'Y'){
		        			str += "<li style='margin-left: 70px; list-style:none;background-color:#f3f3f3;' data-replyNo='" + this.replyNo +  "' class='replyLi'>"
			        		+  "<p style='display:none'  class='replyLogin'>" + this.replyLogin + "</p>"			        		
			                +  "<p class='replyId' style='margin-bottom : 0px;'>" + this.replyId + "</p>"
			                +  "<p class='replyRegDate' style='margin-bottom : 25px;'>" + date+' '+ time + "</p>"
			        		+  "<p class='replyContent'>" + this.replyContent + "</p><hr>"				                	
			                +  "<p style='display:none' class='replyClass'> 클래스 : " +this.replyClass  + "</p>"
			                +  "<p style='display:none' class='replyGrp'>" +this.replyGrp  + "</p>";
			        		 if(this.replyLogin == 1){
			        			 if(this.replyId == userID){
			        				 str +="<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정/삭제(회원)</button>"; 
			        			 }				                					                					                
				                }else {
				                	str +="<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModalNon'>댓글 수정/삭제(비회원)</button>";
				                }	
			        		 			                
			                str+="</li>"
			                +  "<hr/>";	
		        		}else {
		        			str += "<li style='margin-left: 70px; list-style:none;background-color:#f3f3f3;' data-replyNo='" + this.replyNo +  "' class='replyLi'>"
	        				+  "<p class='replyId' style='margin-bottom : 0px;'> 삭제된 댓글입니다. </p>"
	        				+  "</li>"
				            +  "<hr/>";
		        		}
			        				                				                				                          					
		        	}			        			           
		        });

		        $("#replies").html(str);

		        // 페이지 번호 출력 호출
		        printPageNumbers(data.pageMaker);

		    });
		   
		};						
		
		
		// 댓글 목록 페이지 번호 출력 함수
		function printPageNumbers(pageMaker) {

		    var str = "";
		    // 이전 버튼 활성화
		    if (pageMaker.prev) {
		        str += "<li><a href='"+(pageMaker.startPage-1)+"'>이전</a></li>";
		    }
		    // 페이지 번호
		    for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
		        var strCalss = pageMaker.criteria.page == i ? 'class=active' : '';
		        str += "<li "+strCalss+"><a href='"+i+"'>"+i+"</a></li>";
		    }
		    // 다음 버튼 활성화
		    if (pageMaker.next) {
		        str += "<li><a href='"+(pageMaker.endPage + 1)+"'>다음</a></li>";
		    }
		    $(".pagination-sm").html(str);
		}
		
	});
	
	// 댓글 삭제
	$(".modalDelBtn").on("click", function () {

	    // 댓글 번호
	    // 댓글 선택자
	    var reply = $(this).parent().parent();
	    // 댓글번호
	    var replyNo = reply.find("#replyNo").val();
	    // 댓글 로그인 정보
	    var replyLogin = reply.find("#replyLogin").val();

	  
	    console.log("123 "+replyLogin);
	    
	    //window.location = histoy;
	    // AJAX통신 : DELETE
	    $.ajax({
	        type : "delete",
	        url : "/replies/" + replyNo,
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "DELETE"
	        },
	        data : JSON.stringify(
		            {replyLogin : replyLogin}
		        )
	        ,dataType : "text",
	        success : function (result) {
	            console.log("result : " + result);
	            if (result == "delSuccess") {
	                alert("댓글 삭제 완료!");
	                $("#modifyModal").modal("hide"); // Modal 닫기
	                $("#modifyModalNon").modal("hide"); // Modal 닫기
	                getRepliesPaging(replyPageNum); // 대글 목록 갱신              
	            }
	        }
	    });
	   
	    window.location.reload();
	});

	// 댓글 수정
	$(".modalModBtn").on("click", function () {

	    // 댓글 선택자
	    var reply = $(this).parent().parent();
	    // 댓글번호
	    var replyNo = reply.find("#replyNo").val();
	    // 수정한 댓글내용
	    var replyContent = reply.find("#replyContent").val();
	    
	    var replyLogin = reply.find("#replyLogin").val();

	    // AJAX통신 : PUT
	    $.ajax({
	        type : "put",
	        url : "/replies/" + replyNo,
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "PUT"
	        },
	        data : JSON.stringify(
	            {replyContent : replyContent,
	            	replyLogin : replyLogin}
	        ),
	        dataType : "text",
	        success : function (result) {
	            console.log("result : " + result);
	            if (result == "modSuccess") {
	                alert("댓글 수정 완료!");
	                $("#modifyModal").modal("hide"); // Modal 닫기
	                $("#modifyModalNon").modal("hide"); // Modal 닫기
	                getRepliesPaging(replyPageNum); // 댓글 목록 갱신		         	                
	            } else {
	            	alert("패스워드 불일치!");
	            }
	        }
	    });
	    window.location.reload();
	});
	
	// 비회원 댓글 삭제
	$(".NonModalDelBtn").on("click", function () {
	    		    		    
	    var reply = $(this).parent().parent();
	    // 댓글번호
	    var replyNo = reply.find("#replyNoNon").val();
	    // 댓글 닉네임
	    var replyId = reply.find("#replyIdNon").val();
	    // 댓글 패스워드
	    var replyPw = reply.find("#replyPwNon").val();
	    
	    var replyLogin = reply.find("#replyLoginNon").val();
	    
	    console.log(replyPw+"12312321");
	    
	    
	    //window.location = histoy;
	    // AJAX통신 : DELETE
	    $.ajax({
	        type : "delete",
	        url : "/replies/" + replyNo,
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "DELETE"
	        },
	        data : JSON.stringify(
		            {replyId : replyId,
		            replyPw : replyPw,
		            replyLogin : replyLogin}
		        ),			        
	        dataType : "text",
	        success : function (result) {
	            console.log("result : " + result);
	            if (result == "delSuccess") {
	                alert("댓글 삭제 완료!");
	                $("#modifyModal").modal("hide"); // Modal 닫기
	                $("#modifyModalNon").modal("hide"); // Modal 닫기
	                getRepliesPaging(replyPageNum); // 대글 목록 갱신		  	                
	            }
	        },
	        error:function(request,status,error){
	            alert("패스워드 불일치");
	           },
	         complete : function(data) {
	                     
	            }	
	    });
	    window.location.reload();
	});
	
	// 비회원 댓글 수정
	$(".NonModalModBtn").on("click", function () {

	    // 댓글 선택자
	    var reply = $(this).parent().parent();
	    // 댓글번호
	    var replyNo = reply.find("#replyNoNon").val();
	    // 수정한 댓글내용
	    var replyContent = reply.find("#replyContentNon").val();

	 	// 댓글 닉네임
	    var replyId = reply.find("#replyIdNon").val();
	    // 댓글 패스워드
	    var replyPw = reply.find("#replyPwNon").val();
	    
	    var replyLogin = reply.find("#replyLoginNon").val();
	    
	    // AJAX통신 : PUT
	    $.ajax({
	        type : "put",
	        url : "/replies/" + replyNo,
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "PUT"
	        },
	        data : JSON.stringify(
	            {replyContent : replyContent,
	            replyId : replyId,
	            replyPw : replyPw,
	            replyLogin : replyLogin
	            }
	        ),
	        dataType : "text",
	        success : function (result) {
	            console.log("result : " + result);
	            if (result == "modSuccess") {
	                alert("댓글 수정 완료!");
	                $("#modifyModal").modal("hide"); // Modal 닫기
	                $("#modifyModalNon").modal("hide"); // Modal 닫기
	                getRepliesPaging(replyPageNum); // 댓글 목록 갱신		         	                
	            } else {
	            	alert("패스워드 불일치!");
	            }
	        },
	        error:function(request,status,error){
	            alert("패스워드 불일치");
	           },
	         complete : function(data) {
	                     
	            }		    
	        
	    });
	    window.location.reload();
	});
	
	
	</script>
</body>
</html>