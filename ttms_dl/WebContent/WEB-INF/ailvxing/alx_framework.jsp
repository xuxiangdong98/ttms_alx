<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 爱旅行页面框架jsp,包含所有页面的共同部分 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/init.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/functions.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/common.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-2.1.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.js"></script>
<style type="text/css">
.footerDiv {
	
}

a {
	color: blue;
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	color: red;
	text-decoration: underline;
}

a:active {
	color: darkred;
}
</style>
</head>
<body>
	<!-- 头部 -->
	<div id="header">
		<div class="topnav">
			<div class="w980">
				<ul class="l">
					<li><a
						href="${pageContext.request.contextPath }/toLogin.action">管理系统</a></li>
				</ul>
				<div class="info">
					<ul>
						<!-- 如果用户的session为空则显示登录注册 -->
						<c:if test="${AlxUser_Session.alx_uname==null }">
							<li><a
								href="${pageContext.request.contextPath }/toAlxregister.action">注册</a></li>
							<li><a
								href="${pageContext.request.contextPath }/toAlxlogin.action">登陆</a></li>
						</c:if>
						<!-- 如果用户的session不为空则显示用户信息及注销登录 -->
						<c:if test="${AlxUser_Session.alx_uname!=null }">
							<!-- 如果用户昵称不为空则显示用户昵称 -->
							<c:if test="${AlxUser_Session.alx_ualias!=null }">
								<li>欢迎您！<span style="color: hotpink;">${AlxUser_Session.alx_ualias }</span></li>
							</c:if>
							<!-- 如果用户昵称为空或为空串则显示用户名 -->
							<c:if
								test="${AlxUser_Session.alx_ualias==null||AlxUser_Session.alx_ualias==''}">
								<li>欢迎您！<span style="color: hotpink;">${AlxUser_Session.alx_uname }</span></li>
							</c:if>
							<li><img alt="${AlxUser_Session.alx_uicon }"
								src="${AlxUser_Session.alx_uicon }"></li>

							<li><a
								href="${pageContext.request.contextPath }/alx/alxlogout.action">注销登录</a></li>
						</c:if>
						<li><a href="#" class="msg">&nbsp;</a></li>
						<li><a href="#" class="mail">&nbsp;</a></li>
						<li><img
							src="${pageContext.request.contextPath }/upload/photos/admin.jpg" /><a
							href="${pageContext.request.contextPath }/alx/myReserveScenic.action">个人中心</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="nav">
			<div class="w980">
				<div class="logo l">
					<a href="${pageContext.request.contextPath }/toAlxindex.action"></a>
				</div>
				<div class="menu l">
					<ul>
						<li>|<a href="${pageContext.request.contextPath }/showScenicList.action" class="toplist">景点预定</a> 
							<a href="#">酒店预订</a>
						</li>
					</ul>
				</div>
				<div class="search r">
					<form action="" method="">
						<input type="text" name="" value="" />
						<button type="submit"></button>
					</form>
				</div>
			</div>
		</div>
		<div class="line" id="line"></div>
	</div>
	<div class="tools">
		<a href="javascript:void(0)" class="gotop" style="font-size: 12px;"><i></i>返回顶部</a>
	</div> 
	<!-- 底部 -->
	<div id="footer">
		<div class="footerDiv" style="text-align: center;">
			<span id="today" style="color: deepskyblue; font-size: 16px; line-height: 48px;"></span>
			<span id="history" style="color: deepskyblue; font-size: 16px; line-height: 48px;"></span>
		</div>
		<!-- <div class="copy">
			<p>网站开发测试中...</p>
			<div class="footerDiv"> 
				Copyright &copy; 2020 <ahref="https://fanyi.baidu.com/?aldtype=16047#zh/en/%E5%BE%90%E5%90%91%E4%B8%9C">Test</a>.All rights reserved.
			</div>
		</div> -->
	</div>
</body>
</html>
<script type="text/javascript">
//页面访问计数器
$(document).ready(function(){
	$.ajax({
		type:"get",
		url:"<%=basePath%>addCounter.action",
		success : function(data) {
			if (data != null) {
				$("#today").text('今日访问量：' + data.today);
				$("#history").text('总访问量：' + data.history);
			} 
		}
	});
});
</script>