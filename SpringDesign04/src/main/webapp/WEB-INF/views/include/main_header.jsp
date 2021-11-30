<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse-main">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><img alt="HScoding"
				src="/resources/img/logo.png"> </a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse-main">
			<ul class="nav navbar-nav navbar-right">
				<li><a class="active" href="${path }/home">Home</a></li>
				<li><a href="${path }/home" style="display: none;">About</a></li>
				<li><a href="${path }/board/list">자유게시판</a></li>
				<li><a href="${path }/board/list">공지사항</a></li>
				<c:if test="${!empty login && login.userLevel == 1 }">
				<li><a href="${path}/user/list">관리자</a></li>
				</c:if>				
				<c:choose>
					<c:when test="${empty login}">
						<li><a href="${path}/user/login">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${path}/user/mypage">마이페이지</a></li>
						<li><a href="${path}/user/logout">로그아웃</a></li>

					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>