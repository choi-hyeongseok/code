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
				자유 게시판 <small>글쓰기</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#">Board</a></li>
				<li class="active"><a href="#">List</a></li>
				<li class="active"><a href="#">Write</a></li>
			</ol>
		</section>

		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form id="writeForm" role="form" enctype="multipart/form-data">
						<div class="box box-primary">							
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
									<script type="text/javascript">
										$(function() {
											CKEDITOR.replace('txtContent',{
												filebrowserUploadUrl : '${pageCotext.request.contextPath}/file/fileupload.do'
											});
										})
									</script>
									
								</div>
								<div class="form-group">
									<div class = "row">
										<div class = "col-lg-12">
											<div class = "panel panel-default">
												<div class = "panel-heading">File upload</div>
												<!-- /.panel-heading -->
												<div class = "panel-body">
													<div class = "panel-body">
														<div class = "form-group uploadDiv">
															<input type = "file" name = 'uploadFile' multiple>
														</div>
														
														<div class = 'uploadResult'>
															<ul>
															
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>																		 									 
								</div>
								<div class="form-group">
									<label for="writer">작성자</label> <input class="form-control"
										id="writer" name="boardId" value="${login.userId}" readonly>
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
			
			</div>
		</div>

	</div>

	<!-- footer -->
	<%@ include file="../include/main_footer.jsp"%>

	<!-- plugin_js -->
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
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				var str = "";
						
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					console.dir(jobj);
					
					str += "<input type = 'hidden' name = 'fileList["+i+"].fileName' value = '" + jobj.data("fileName")+"'>";
					str += "<input type = 'hidden' name = 'fileList["+i+"].fileOrginalName' value = '" + jobj.data("fileOrginalName") + "'>";
					str += "<input type = 'hidden' name = 'fileList["+i+"].filePath' value = '" + jobj.data("filePath") + "'>";
					str += "<input type = 'hidden' name = 'fileList["+i+"].fileSize' value = '" + jobj.data("fileSize") + "'>";
					str += "<input type = 'hidden' name = 'fileList["+i+"].fileType' value = '" + jobj.data("fileType") + "'>";
			
				});
			
				formObj.append(str).submit();
				formObj.submit();
			});
			
			
			// 다중 파일 업로드 관련
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; // 5MB
			
			function checkExtension(fileName, fileSize){
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
			
			$("input[type = 'file']").change(function(e){
				var formData = new FormData();
				console.log("change file type input");
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				
				for(var i=0; i<files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url : '/file/uploadAjaxAction',
					processData : false,
					contentType : false, 
					data : formData,
					type : 'POST',
					dataType : 'json',
						success:function(result){
							console.log(result);
							showUploadResult(result);
						}
				});
			});
			
			function showUploadResult(uploadResultArr){
				  if(!uploadResultArr || uploadResultArr.length == 0){return ;}
				  var uploadUL = $(".uploadResult ul");
				  var str = "";
				  				
				  $(uploadResultArr).each(function(i, obj){
					  
					   //image type
				        if(obj.image){
				          var fileCallPath =  encodeURIComponent(obj.uploadPath);
				          str += "<li><div>";
				          str += "<span> "+ obj.fileOrginalName+"</span>";
				          str += "<button type='button' data-file=\'"+obj.fileName+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				          //str += "<img src='/display?fileName="+fileCallPath+"'>";
				          str += "</div>";
				          str +"</li>";
				        }else{
				          var fileCallPath =  encodeURIComponent(obj.uploadPath);            
				            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				              
				          str += "<li><div>";
				          str += "<span> "+ obj.fileOrginalName+"</span>";
				          str += "<button type='button' data-file=\'"+obj.fileName+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				          //str += "<img src='/resources/img/attach.png'></a>";
				          str += "</div>";
				          str +"</li>";
				        } 
				  });				
				  $(".uploadResult").append(str);				
			  };
			  
			  $(".uploadResult").on("click", "button", function(e){
				  console.log("delete file");
				  
				  var targetFile = $(this).data("file");
				  var type = $(this).data("type");
				  
				  var targetLi = $(this).closest("li");
				  
				  $.ajax({
				  	url : '/file/deleteFile',
				  	data : {fileName : targetFile, type : type},
				  	dataType : 'text',
				  	type : 'POST',
				  		success : function(result) {
				  			alert(result);
				  			targetLi.remove();
				  		}
				  });
				  
			  });
			
		});	// ready end				
		
		
	</script>
</body>
</html>