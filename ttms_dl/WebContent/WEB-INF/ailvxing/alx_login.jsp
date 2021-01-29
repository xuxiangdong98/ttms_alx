<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 引入页面框架jsp文件 -->
<!DOCTYPE html>
<html>
<head>
    <title>用户登陆</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/init.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/login.css" />
</head>
<body>
   <div id="bg"><img src="${pageContext.request.contextPath }/images/wallpaper.jpg" /></div>
   <div style="text-align: center;">
			<font color="cyan"> <%-- 提示信息--%> <span id="message">${msg}</span>
			</font>
		</div>
    <div id="login">
        <div class="logo"><a href="./index.jsp"></a></div>
        <div class="box">
            <div class="pics">
                <div class="tit">发现更多精彩!</div>
                <div class="pic1"><a href="#"><img src="${pageContext.request.contextPath }/upload/log1.jpg" /></a></div>
                <div class="pic2"><a href="#"><img src="${pageContext.request.contextPath }/./upload/log2.jpg" /></a></div>
                <div class="pic3"><a href="#"><img src="${pageContext.request.contextPath }/./upload/log3.jpg" /></a></div>
                <div class="pic4"><a href="#"><img src="${pageContext.request.contextPath }/./upload/log4.jpg" /></a></div>
            </div>
            <div class="logform">
                <form action="${pageContext.request.contextPath }/alx/alxlogin.action" method="post">
                    <h2>用户登陆</h2>
                    <table>
                        <tr>
                            <td colspan="2">
                                <input type="text" name="alx_uname" placeholder="微博账号/QQ号码/电子邮箱" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="password" name="alx_upassword" placeholder="密码" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" class="sub" value="登 陆" />
                            </td>
                            <td align="center">
                                <input type="checkbox" class="chk" name="check" />下次自动登陆
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="javascript:void(0)" class="qqlog"></a>
                            </td>
                            <td>
                                <a href="javascript:void(0)" class="sinalog"></a>
                            </td>
                        </tr>
                    </table>
                    <div class="reg">
                        <a href="javascript:void(0)">忘记密码？</a>|
                        <a href="${pageContext.request.contextPath }/toAlxregister.action">注册新账号</a>|
                        <a href="javascript:void(0)">意见反聩</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <%-- <form action="${pageContext.request.contextPath }/login.action"
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
			</div> --%>
			
   <!-- 底部 -->
     <div id="footer">
        <div class="line"></div>
        <div class="copy">
            <p>网站开发测试中...</p>
			<div class="footerDiv">
				Copyright &copy; 2020 <a href="https://fanyi.baidu.com/?aldtype=16047#zh/en/%E5%BE%90%E5%90%91%E4%B8%9C">Xu xiangdong</a>.All rights reserved.
			</div>
        </div>
    </div>
</body>
</html>