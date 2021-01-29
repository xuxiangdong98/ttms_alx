<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 页面框架jsp,包含所有页面的共同部分 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>旅游管理系统</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css" />
<!-- 引入js文件 -->
<!-- jQuery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-2.1.0.js"></script>
<!-- Bootstrap Core JavaScript -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.js"></script>
<!-- 引入表格的全选和隔行换色JS -->
<script src="${pageContext.request.contextPath }/js/table.js"
	type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<!-- 上中部样式 -->
	<div class="container-fluid">
		<header>
			<!-- 导航栏 -->
			<nav class="navbar navbar-default" style="background: #000000;">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span>
						</button>
						<a class="navbar-brand"
							href="${pageContext.request.contextPath }/ttms/toWelcome.action">
							<div
								style="position: relative; margin-top: -15px; height: 50px; line-height: 48px;">
								<img src="${pageContext.request.contextPath }/img/tb.png"
									width="50px" height="50px">
							</div>
						</a>
					</div>

					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false" style="color: #FFFFFF;">景点管理<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="${pageContext.request.contextPath }/ttms/showScenicList.action">景点列表</a></li>
									<li><a href="${pageContext.request.contextPath }/ttms/showAllAlxUserReserveScenicList.action">景点预订列表</a></li>
									<li><a href="${pageContext.request.contextPath }/ttms/toStatistics_reserve.action">景点预订统计</a></li>
									<li><a href="${pageContext.request.contextPath }/ttms/toStatistics_collect.action">景点收藏统计</a></li>
								</ul>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false" style="color: #FFFFFF;">爱旅行管理<span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="${pageContext.request.contextPath }/ttms/alxUserList.action">爱旅行用户列表</a></li>
									<li><a href="${pageContext.request.contextPath }/ttms/toStatistics_alxuser.action">爱旅行用户统计</a></li>
									<li><a href="${pageContext.request.contextPath }/ttms/toStatistics_alxuservisit.action">用户访问量统计</a></li>
								</ul>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false" style="color: #FFFFFF;">产品管理 <span
									class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a
												href="${pageContext.request.contextPath }/ttms/project_list.action">项目管理</a></li>
											<li><a
												href="${pageContext.request.contextPath }/ttms/team_list.action">团目管理</a></li>
											<li role="separator" class="divider"></li>
											<li><a
												href="${pageContext.request.contextPath }/ttms/product/type_list.html">产品分类</a></li>
											<li role="separator" class="divider"></li>
											<li><a
												href="${pageContext.request.contextPath }/ttms/product/attachment.html">附件管理</a></li>
										</ul>
							</li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false" style="color: #FFFFFF;">系统管理 <span
											class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a
												href="${pageContext.request.contextPath }/ttms/system/role_list.html">角色管理</a></li>
											<li><a
												href="${pageContext.request.contextPath }/ttms/system/menu_list.html">菜单管理</a></li>
											<li><a
												href="${pageContext.request.contextPath }/ttms/user_list.action">用户管理</a></li>
										</ul>
							</li>
						</ul>
								<ul class="nav navbar-nav navbar-right">
									<li><a href="#" style="color: #FFFFFF;">用户：${USER_SESSION.username}</a></li>
									<li><a href="#" style="color: cyan;">欢迎您!</a></li>
									<li><a href="${pageContext.request.contextPath }/ttms/logout.action"
										style="color: #FFFFFF;">退出登录</a></li>
								</ul>
					</div>
				</div>
			</nav>
		</header>
		<!-- 当前路径 -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath }/#"><i
							class="fa fa-dashboard"></i> 主页</a></li>
							
					<li class="active">
						<span id="today" style="color: green;font-size: 14px;"></span>&nbsp;&nbsp;&nbsp;
						<span id="history" style="color: purple; font-size:14px;"></span>
					</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content"></section>
			<!-- /.content -->
		</div>
	</div>

	<footer>
		<!-- Content Header (Page header) -->
		<div class="container content-header breadcrumb"
			style="text-align: center; width: 100%; position: fixed; bottom: 0px; z-index: 1;">
			<!-- 版权信息 -->
			<strong>Copyright &copy; 2020 <a
				href="https://fanyi.baidu.com/?aldtype=16047#en/zh/Silent%20combination">
					Silent combination </a>.
			</strong> All rights reserved. <br /> <strong>Version</strong>&nbsp;1.0
		</div>
	</footer>
	<script type="text/javascript">
		//页面访问计数器
		$(document).ready(function(){
			$.ajax({
				type:"get",
				url:"<%=basePath%>ttms/addCounter.action",
				success : function(data) {
					if (data != null) {
						$("#today").text('今日访问量：' + data.today);
						$("#history").text('总访问量：' + data.history);
						//alert("加一成功！")
					} else {
						alert("加一失败！")
					}
				}
			});
		});
	</script>
</body>
</html>