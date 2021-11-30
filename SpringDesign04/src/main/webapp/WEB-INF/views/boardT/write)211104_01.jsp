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
<!-- 네이버 스마트에디터  -->
<!-- <head> 안에 추가 -->
<script type="text/javascript"
	src="/resources/smarteditor/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- 2.10.0 버전엔 js 파일 일부분이 없어 오류 발생 ! -->
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
					<form role="form" id="writeForm" method="post"
						action="${path}/article/write">
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">게시글 작성</h3>
							</div>
							<div class="box-body">
								<div class="form-group">
									<label for="title">제목</label> <input class="form-control"
										id="title" name="boardTitle" placeholder="제목을 입력해주세요">
								</div>
								<div class="form-group">
									<label for="content">내용</label>


									<textarea id="txtContent" name="boardContent" rows="10"
										cols="100" style="width: 100%;"></textarea>
									<!-- textarea 밑에 script 작성하기 -->
									<script id="smartEditor" type="text/javascript">
										var oEditors = [];
										nhn.husky.EZCreator
												.createInIFrame({
													oAppRef : oEditors,
													elPlaceHolder : "txtContent", //textarea ID 입력
													sSkinURI : "/resources/smarteditor/SmartEditor2Skin.html", //martEditor2Skin.html 경로 입력
													fCreator : "createSEditor2",
													htParams : {
														// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
														bUseToolbar : true,
														// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
														bUseVerticalResizer : false,
														// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
														bUseModeChanger : false
													}
												});
									</script>


								</div>
								<div class="form-group">
									<label for="writer">작성자</label> <input class="form-control"
										id="writer" name="boardId">
								</div>
							</div>
							<div class="box-footer">
								<button type="button" class="btn btn-primary">
									<i class="fa fa-list"></i> 목록
								</button>
								<div class="pull-right">
									<button type="reset" class="btn btn-warning">
										<i class="fa fa-reply"></i> 초기화
									</button>
									<button type="submit" class="btn btn-success">
										<i class="fa fa-save"></i> 저장
									</button>
								</div>
							</div>
						</div>
					</form>
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
		

		function save(){
			oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
		    		//스마트 에디터 값을 텍스트컨텐츠로 전달
			var content = document.getElementById("smartEditor").value;
			alert(document.getElementById("txtContent").value); 
		    		// 값을 불러올 땐 document.get으로 받아오기
			return; 
		}
	</script>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
</html>