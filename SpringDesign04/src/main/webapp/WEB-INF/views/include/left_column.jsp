<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside class="main-sidebar">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">

		<!-- Sidebar user panel (optional) -->
		
		<div class="user-panel">
			<div class="pull-left image">
				<img src="dist/img/user2-160x160.jpg" class="img-circle"
					alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Alexander Pierce</p>
				<!-- Status -->
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>

		<!-- search form (Optional) -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..."> <span class="input-group-btn">
					<button type="submit" name="search" id="search-btn"
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->

		<!-- Sidebar Menu -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">메뉴</li>
			<li class="active"><a href="${path}/board/list"><i
					class="fa fa-edit"></i> <span>자유 게시판</span></a></li>
			<li><a href="${path}/board/write"><i class="fa fa-list"></i>
					<span>게시판 작성</span></a></li>
		</ul>
		
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">관리자 메뉴</li>
			<li class="active"><a href="${path}/user/list"><i
					class="fa fa-edit"></i> <span>사용자 리스트</span></a></li>
			<li><a href="${path}/user/register"><i class="fa fa-list"></i>
					<span>사용자 등록</span></a></li>
			<li class="active"><a href="${path}/user/login"><i
					class="fa fa-edit"></i> <span>사용자 로그인</span></a></li>
		</ul>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>