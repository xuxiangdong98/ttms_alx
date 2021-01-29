<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 引入页面框架jsp文件 -->
<!DOCTYPE html>
<html>
<head>
<title>注册用户</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/register.css" />
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/init.css" />
<script src="${pageContext.request.contextPath }/js/jquery-2.1.0.js"></script>
<script type="text/javascript">
	function showTips(spanID, msg) {
		var span = document.getElementById(spanID);
		span.innerHTML = msg;

	}
	function checkUname(alx_uname) {
		var uValue = document.getElementById("alx_uname").value;

		var span = document.getElementById("span_uname");

		var bool = false;
		
		if (uValue.length < 6) {
			span.innerHTML = "能长点吗？"
			return false;
		} else {
			/* 【话唠】bing 12:35:29这是异步函数,就是你发请求时候，函数就结束了,获取不到结果 
			async: false,改为false让它同步即可*/
			$.ajax({
		        type:"get",
		        url:"${pageContext.request.contextPath }/alx/checkUname.action",
		        async: false,
				data:{"alx_uname":uValue},
				success : function(data) {
					if (data == true) {
						$("#span_uname").text("用户名可用").attr("style","color:green;");
						bool=true;
					} else {
						$("#span_uname").text("用户名已存在!").attr("style","color:red;");
					}
				}
			});
			return bool;
		}
	
	}
	
	/* 校验密码 */
	function checkPassword(){
		//获取用户输入的密码
		var uPwd = document.getElementById("password").value;
		
		//获取span
		var span = document.getElementById("span_password");
		//校验密码并返回结果
		if(uPwd.length < 6){
			span.innerHTML = "<font size='2' color='red'>密码，太短!</font>";
			return false;
		}else{
			span.innerHTML = "<font size='2' color='green'>密码，可用!</font>";
			return true;
		}
	}
	/* 校验确认密码 */
	function checkRePassword(){
		//获取用户输入的密码
		var uPwd = document.getElementById("password").value;
		
		//获取确认密码
		var uRePwd = document.getElementById("repassword").value;
		
		//获取确认密码span
		var span = document.getElementById("span_repassword");
		//校验密码并返回结果
		if(uPwd != uRePwd){
			span.innerHTML = "<font size='2' color='red'>密码不一致!</font>";
			return false;
		}else{
			span.innerHTML = "<font size='2' color='green'>√</font>";
			return true;
		}
	}
	function checkForm() {
		var flag = checkUname(alx_uname) && checkPassword() && checkRePassword();
		return flag;
	}
</script>

</head>
<body>

	<div id="bg">
		<img src="${pageContext.request.contextPath }/images/wallpaper.jpg" />
	</div>
	<div id="register">
		<div class="logo">
			<a href="./index.jsp"></a>
		</div>
		<div class="box">
			<div class="regform">
				<h2>普通注册</h2>
				<form
					action="${pageContext.request.contextPath }/alx/alxregist.action"
					method="post" onsubmit="return checkForm()">
					<table>
						<tr>
							<td>用户名：</td>
							<td><input type="text" id="alx_uname" name="alx_uname" required
								onfocus="showTips('span_uname','名称不小于6位')" onblur="checkUname()" />
								<span id="span_uname"></span></td>
							<td></td>
						</tr>
						<tr>
							<td>密 码：</td>
							<td><input type="password" name="alx_upassword" required
								id="password" onfocus="showTips('span_password','密码不小于6位')"
								onblur="checkPassword()" onkeyup="checkPassword()" /> <span
								id="span_password"></span></td>
							<td></td>
						</tr>
						<tr>
							<td>确认密码：</td>
							<td><input type="password" id="repassword" required
								onfocus="showTips('span_repassword','密码不一致!')"
								onblur="checkRePassword()" onkeyup="checkRePassword()" /><span
								id="span_repassword"></span></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="submit"
								class="sub" value="注 册"/></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="quickreg">
				<h2>快速注册</h2>
				<div class="apps">
					<a class="qq" href="javascript:void(0)"></a> <a class="sina"
						href="javascript:void(0)"></a> <a class="taobao"
						href="javascript:void(0)"></a> <a class="tent"
						href="javascript:void(0)"></a> <a class="douban"
						href="javascript:void(0)"></a>
				</div>
				<div class="nowlog">
					<a href="${pageContext.request.contextPath }/toAlxlogin.action">已有账号，现在去登陆！</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部 -->
	<div id="footer">
		<div class="line"></div>
		<div class="copy">
			<p>网站开发测试中...</p>
			<div class="footerDiv">
				Copyright &copy; 2020 <a
					href="https://fanyi.baidu.com/?aldtype=16047#zh/en/%E5%BE%90%E5%90%91%E4%B8%9C">Xu
					xiangdong</a>.All rights reserved.
			</div>
		</div>
	</div>
</body>
</html>