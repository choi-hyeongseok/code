<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<%@ include file="../include/head.jsp"%>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../include/main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../include/left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Page Header <small>Optional description</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<div class="col-lg-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">글제목 : ${board.boardTitle}</h3>
						</div>
						<div class="box-body" style="height: 700px">
							${board.boardContent}</div>

						
						<div class="box-footer">
							<div class="user-block">
								<img class="img-circle img-bordered-sm"
									src="/dist/img/user1-128x128.jpg" alt="user image"> <span
									class="username"> <a href="#">${board.boardId}</a>
								</span> <span class="description"><fmt:formatDate
										pattern="yyyy-MM-dd a HH:mm" value="${board.boardRegDate}" /></span>
							</div>
						</div>


						<div class="box-footer">
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
							<c:if test="${login.userId == board.boardId }">
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
											<label for="newReplyContent">댓글 내용</label> <input
												class="form-control" id="newReplyContent" name="replyContent"
												placeholder="댓글 내용을 입력해주세요">
										</div>
										<div class="form-group">
											<label for="newReplyId">댓글 작성자</label> <input
												class="form-control" id="newReplyId" name="replyId"
												placeholder="댓글 작성자를 입력해주세요">
										</div>
										<div class="form-group">
											<button type="button" class="btn btn-success" id="replyAddBtn">등록</button>
										</div>
									</div>
									<!-- 댓글 리스트 출력 -->
									<div class="box-footer relpy-list reply-listy">
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

							<div class="modal fade" id="modifyModal" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">댓글 수정창</h4>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label for="replyNo">댓글 번호</label> <input
													class="form-control" id="replyNo" name="replyNo" readonly>
											</div>
											<div class="form-group">
												<label for="replyContent">댓글 내용</label> <input
													class="form-control" id="replyContent" name="replyContent"
													placeholder="댓글 내용을 입력해주세요">
											</div>
											<div class="form-group">
												<label for="replyId">댓글 작성자</label> <input
													class="form-control" id="replyId" name="replyId"
													readonly>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default pull-left"
												data-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-success modalModBtn">수정</button>
											<button type="button" class="btn btn-danger modalDelBtn">삭제</button>
										</div>
									</div>
								</div>
							</div>

						</section>
						
					</div>				
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="../include/main_footer.jsp"%>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active"><a href="#control-sidebar-home-tab"
					data-toggle="tab"><i class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<%@ include file="../include/plugin_js.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
			
			
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
			
			
			// 1000번째 게시글
			var boardNo = ${board.boardNo};
			// 목록페이지 번호 변수 선언, 1로 초기화(첫번째 페이지)
			var replyPageNum = 1;

			getRepliesPaging(replyPageNum);


			
			// 목록페이지 번호 클릭 이벤트
			$(".pagination").on("click", "li a", function (event) {

			    event.preventDefault();
			    replyPageNum = $(this).attr("href"); // 목록 페이지 번호 추출
			    getRepliesPaging(replyPageNum); // 목록 페이지 호출

			});
			
			
			// 댓글 저장 버튼 클릭 이벤트 발생시
			$("#replyAddBtn").on("click", function () {

			    // 화면으로부터 입력 받은 변수값의 처리
			    var replyContent = $("#newReplyContent");
			    var replyId = $("#newReplyId");

			    var replyContentVal = replyContent.val();
			    var replyIdVal = replyId.val();

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
			            replyId : replyIdVal
			        }),
			        success : function (result) {
			            // 성공적인 댓글 등록 처리 알림
			            if (result == "regSuccess") {
			                alert("댓글 등록 완료!");
			            }
			            getRepliesPaging(replyPageNum);
			            replyContent.val(""); // 댓글 내용 초기화
			            replyId.val(""); // 댓글 작성자 초기화
			            window.location.reload();
			        }
			    });
			});
			
			$("#replies").on("click", ".replyLi button", function () {
			    var reply = $(this).parent();

			    var replyNo = reply.attr("data-replyNo");
			    var replyContent = reply.find(".replyContent").text();
			    var replyId = reply.find(".replyId").text();

			    $("#replyNo").val(replyNo);
			    $("#replyContent").val(replyContent);
			    $("#replyId").val(replyId);

			});
			
		
			
			
			// 댓글 목록 페이징 함수
			function getRepliesPaging(page) {
				

			    $.getJSON("/replies/" + boardNo + "/" + page, function (data) {
			        console.log(data);

			        var str = "";
			        

			        $(data.replies).each(function () {	
			        
			        		str += "<li data-replyNo='" + this.replyNo + "' class='replyLi'>"
			                +  "<p class='replyContent'>" + this.replyContent + "</p>"
			                +  "<p class='replyId'>작성자: " + this.replyId + "</p>"
			                +  "<p class='replyRegDate'>작성일: " +new Date(this.replyRegDate)  + "</p>"
			                +  "<p class='replyClass'> 클래스 : " +this.replyClass  + "</p>"
			                +  "<p class='replyGroup'> 그룹 : " +this.replyGrp  + "</p>"			               
			                +  "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
			                +  "<button type='button' class='btn btn-xs btn-success replyDepthBtn'>답글 보기</button>"
			                +  "</li>"
			                +  "<hr/>";
		 		         
	
			        });

			        $("#replies").html(str);

			        // 페이지 번호 출력 호출
			        printPageNumbers(data.pageMaker);

			    	// 댓글 저장 버튼 클릭 이벤트 발생시
					$(".replyDepthBtn").on("click", function () 				
						alert("댓글보기 버튼 ");
						
					});
			    });
			}
			
	


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
		    var replyNo = $(this).parent().parent().find("#replyNo").val();
		    //window.location = histoy;
		    // AJAX통신 : DELETE
		    $.ajax({
		        type : "delete",
		        url : "/replies/" + replyNo,
		        headers : {
		            "Content-type" : "application/json",
		            "X-HTTP-Method-Override" : "DELETE"
		        },
		        dataType : "text",
		        success : function (result) {
		            console.log("result : " + result);
		            if (result == "delSuccess") {
		                alert("댓글 삭제 완료!");
		                $("#modifyModal").modal("hide"); // Modal 닫기
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

		    // AJAX통신 : PUT
		    $.ajax({
		        type : "put",
		        url : "/replies/" + replyNo,
		        headers : {
		            "Content-type" : "application/json",
		            "X-HTTP-Method-Override" : "PUT"
		        },
		        data : JSON.stringify(
		            {replyContent : replyContent}
		        ),
		        dataType : "text",
		        success : function (result) {
		            console.log("result : " + result);
		            if (result == "modSuccess") {
		                alert("댓글 수정 완료!");
		                $("#modifyModal").modal("hide"); // Modal 닫기
		                getRepliesPaging(replyPageNum); // 댓글 목록 갱신		         	                
		            }
		        }
		    });
		    window.location.reload();
		});

		
	</script>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
</html>
