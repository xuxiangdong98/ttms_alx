<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 用户登录页面 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户登录</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/Login/Login_button.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-2.1.0.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.js"></script>
<script>
	// 判断是登录账号和密码是否为空
	function check() {
		var username = $("#username").val();
		var password = $("#password").val();
		if (username == "" || password == "") {
			$("#message").text("账号或密码不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="container"
		style="border: 2px solid white; border-radius: 15px 15px 15px 15px; position: relative; margin-top: 15%; text-align: center; width: 360px; height: 280px;">

		<p class="login-box-msg"
			style="font-size: 30px; color: #FFFFFF; position: relative; margin-top: 10%;">
			<strong>旅游管理系统</strong>
		</p>
		<div style="text-align: center;">
			<font color="cyan"> <%-- 提示信息--%> <span id="message">${msg}</span>
			</font>
		</div>
		<form action="${pageContext.request.contextPath }/ttms/login.action"
			method="post" id="login_form" onsubmit="return check()">

			<div class="form-group has-feedback">
				<input type="text" class="form-control" name="username" id="username"
					placeholder="账号" >
			</div>

			<div class="form-group has-feedback">
				<input type="password" class="form-control" name="password" id="password"
					placeholder="密码">
			</div>
			
			<!-- <input type="submit" value="登录" /> -->
			</form>
			<div>
				<button type="submit" form="login_form">登录</button>
			</div>
			
	</div>
</body>
</html>