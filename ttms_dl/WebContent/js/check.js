
			/* 	校验用户名： */
			/* 
				1.确定事件：onfocus 获得焦点
				2.事件要驱动函数：showTips
				3.函数要干一些事情：修改span的内容
			 */
			function showTips(spanID,msg){
				//首先获取要操作的元素span
				var span = document.getElementById(spanID);
				span.innerHTML = "<font size='3' color='#02a9fc'>"+msg+"</font>";
			}
			/*
				1.确定事件：onblur 失去焦点
				2.事件要驱动函数：checkUsername
				3.函数要显示校验结果
			 */
			function checkUsername(){
				//获得用户输入的内容
				var uValues = document.getElementById("username").value;
				//判断用户输入的内容
				//获得要显示结果的span
				var span = document.getElementById("span_username");
				//显示校验的结果
				if(uValues.length < 6 ){
					span.innerHTML = "<font size='3' color='red'>用户名，太短!</font>";
					return false;
				}else{
					span.innerHTML = "<font size='3' color='#00ff45'>用户名，可用!</font>";
					return true;
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
					span.innerHTML = "<font size='3' color='red'>密码，太短!</font>";
					return false;
				}else{
					span.innerHTML = "<font size='3' color='#00ff45'>密码，可用!</font>";
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
					span.innerHTML = "<font size='3' color='red'>密码不一致!</font>";
					return false;
				}else{
					span.innerHTML = "<font size='3' color='#00ff45'>√</font>";
					return true;
				}
			}
			/* 校验邮箱 */
			function checkEmail(){
				//定义邮箱判断正则表达式
				var emailReg = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,})$/;
				//获取用户输入的邮箱
				var uEmile = document.getElementById("email").value;
				//获取输出span，span_email
				var span = document.getElementById("span_email");
				//校验邮箱格式并输出校验结果
				if(emailReg.test(uEmile)){
					span.innerHTML = "<font size='3' color='#00ff45'>邮箱格式正确!</font>";
					return true;
				}else{
					span.innerHTML = "<font size='3' color='red'>邮箱格式不对!</font>";
					return false;
				}
			}
			/* 校验手机号 */
			function checkMobile(){
				//定义手机号判断正则表达式
				var regu = /^[1][345789][0-9]{9}$/;
				//获取用户输入的手机号
				var uPhone = document.getElementById("phonenumber").value;
				//获取输出span，span_email
				var span = document.getElementById("span_phonenumber");
				//校验手机号格式并输出校验结果
				if(regu.test(uPhone)){
					span.innerHTML = "<font size='3' color='#00ff45'>手机号格式正确!</font>";
					return true;
				}else{
					span.innerHTML = "<font size='3' color='red'>手机号格式不对!</font>";
					return false;
				}
			}
			/* 全部判断提交 */
			function checkForm(){
				var flag = checkUsername() && checkPassword() && checkRePassword() && checkEmail() && checkMobile();
				return flag;
			}
