<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 引入页面框架jsp文件 -->
<%@ include file="alx_framework.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>爱上旅行！</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/index.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/counselor.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/index.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-2.1.0.js"></script>
</head>
<body>
	<!-- 景点热门详情 -->
	<div class="modal fade" id="scenicDetailDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">景点详细信息</h4>
				</div>
				<div class="modal-body">
					<div class="form-horizontal" id="detail_scenic">
						<form class="form-horizontal" id="reserveScenicForm">
							<input type="hidden" id="detail_scenic_id" name="scenic_id" /> <input
								type="hidden" id="detail_alx_uid" name="alx_uid" />
						</form>
						<div class="thumbnail">
							<img id="detail_scenic_img" width="100%" height="250px"
								alt="加载失败">
							<div class="caption">
								<p style="font-size: 22px; color: dodgerblue;">
									<strong>景点名称:</strong><span id="detail_scenic_name"></span>
								</p>
								<p style="font-size: 22px; color: deepskyblue">
									<strong>景点价格:</strong><span id="detail_scenic_price"></span>
								</p>
								<p style="font-size: 22px; color: skyblue;">
									<strong>景点评分:</strong><span id="detail_scenic_evaluate"></span>
								</p>
								<p style="font-size: 22px; color: orange;">
									<strong>景点介绍:</strong><span id="detail_scenic_introduce"></span>
								</p>
								<p style="font-size: 22px; color: red;">
									<strong>景点电话:</strong><span id="detail_scenic_phone"></span>
								</p>
								<p style="font-size: 22px; color: black;">
									<strong>开放时间:</strong><span id="detail_scenic_startDate"></span>
								</p>
								<p style="font-size: 22px; color: black;">
									<strong>关闭时间:</strong><span id="detail_scenic_endDate"></span>
								</p>

							</div>
							<div></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<a href="${pageContext.request.contextPath }/showScenicList.action"
						class="btn btn-info">景点预订</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="chat-wrapper">
		<div id="btn_open" class="chat-support-btn" draggable="true">
			<!-- 聊天窗口缩小后的头像图标 -->
			<img src='${pageContext.request.contextPath }/images/counselor.png'></img>
		</div>
		<div class="chat-main" draggable="true">
			<div class="chat-header">
				<b id="btn_close" class="chat-close">></b>
				<div class="chat-service-info">
					<a class="chat-service-img"></a>
					<div class="chat-service-title">
						<p class="chat-service-name">清风顾问</p>
						<p class="chat-service-detail">我是您的专属顾问</p>
					</div>
				</div>
			</div>
			<div id="chat_contain" class="chat-contain"></div>
			<div class="chat-submit">
				<p id='chatHint' class="chat-hint">
					<span class="chat-hint-icon">!</span><span class="chat-hint-text">发送内容不能为空</span>
				</p>
				<textarea id="chat_input" class="chat-input-text" autofocus
					placeholder="请输入您想对我说的话，按Enter键发送（shift+Enter换行）。"></textarea>
				<div class="chat-input-tools">
					<button class="chat-input-button">发送</button>
					<button class="chat-close-button">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 主体 -->
	<div id="content">
		<div class="main">
			<div class="slider">
				<div class="v">
					<div class="wrap"> 
						<!-- 实际工作的时候 一般 网站的信息 都是 动态获取 然后 渲染到页面上 -->
						<a href="#"><img
							src="${pageContext.request.contextPath }/upload/pic1.jpg"
							width="710" /></a> <a href="#"><img
							src="${pageContext.request.contextPath }/upload/pic2.jpg"
							width="710" /></a> <a href="#"><img
							src="${pageContext.request.contextPath }/upload/pic3.jpg"
							width="710" /></a> <a href="#"><img
							src="${pageContext.request.contextPath }/upload/pic4.jpg"
							width="710" /></a> <a href="#"><img
							src="${pageContext.request.contextPath }/upload/pic5.jpg"
							width="710" /></a> <a href="#"><img
							src="${pageContext.request.contextPath }/upload/pic6.jpg"
							width="710" /></a> <a href="#"><img
							src="${pageContext.request.contextPath }/upload/pic7.jpg"
							width="710" /></a> <a href="#"><img
							src="${pageContext.request.contextPath }/upload/pic8.jpg"
							width="710" /></a> <a href="#"><img
							src="${pageContext.request.contextPath }/upload/pic9.jpg"
							width="710" /></a> <a href="#"><img
							src="${pageContext.request.contextPath }/upload/pic10.jpg"
							width="710" /></a>
					</div>
					<div class="thumbpics">
						<ul>
							<li><img
								src="${pageContext.request.contextPath }/upload/pic1.jpg"
								width="60" class="curr" />
								<div class="icon"></div></li>
							<li><img
								src="${pageContext.request.contextPath }/upload/pic2.jpg"
								width="60" /></li>
							<li><img
								src="${pageContext.request.contextPath }/upload/pic3.jpg"
								width="60" /></li>
							<li><img
								src="${pageContext.request.contextPath }/upload/pic4.jpg"
								width="60" /></li>
							<li><img
								src="${pageContext.request.contextPath }/upload/pic5.jpg"
								width="60" /></li>
							<li><img
								src="${pageContext.request.contextPath }/upload/pic6.jpg"
								width="60" /></li>
							<li><img
								src="${pageContext.request.contextPath }/upload/pic7.jpg"
								width="60" /></li>
							<li><img
								src="${pageContext.request.contextPath }/upload/pic8.jpg"
								width="60" /></li>
							<li><img
								src="${pageContext.request.contextPath }/upload/pic9.jpg"
								width="60" /></li>
							<li><img
								src="${pageContext.request.contextPath }/upload/pic10.jpg"
								width="50" /></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="section">
				<div class="title">
					<div></div>
					<h2>
						<a class="anchor" id="life" href="#">美景</a>
					</h2>
				</div>
				<div class="thumb">
					<ul>
						<li><img
							src="${pageContext.request.contextPath }/upload/img1.jpg" />
							<p>
								<a href="#">城市美景</a>
								<!-- <span>(12张)</span> -->
							</p>
							<div class="cover"></div></li>
						<li><img
							src="${pageContext.request.contextPath }/upload/img2.jpg" />
							<p>
								<a href="#">自然美景</a>
							</p>
							<div class="cover"></div></li>
						<li><img
							src="${pageContext.request.contextPath }/upload/img3.jpg" />
							<p>
								<a href="#">乡村风光</a>
							</p>
							<div class="cover"></div></li>
						<li><img
							src="${pageContext.request.contextPath }/upload/img4.jpg" />
							<p>
								<a href="#">名山名水</a>
							</p>
							<div class="cover"></div></li>
						<li><img
							src="${pageContext.request.contextPath }/upload/img5.jpg" />
							<p>
								<a href="#">名胜古迹</a>
							</p>
							<div class="cover"></div></li>
						<li><img
							src="${pageContext.request.contextPath }/upload/img6.jpg" />
							<p>
								<a href="#">异域风采</a>
							</p>
							<div class="cover"></div></li>
					</ul>
				</div>
			</div>

		</div>
		<div class="sider">
			<div class="recommend">
				<div class="title">
					<h2>
						<a href="#">热门景点</a>
					</h2>
				</div>
				<div class="view">
					<a id="hot_scenic_id" data-toggle="modal"
						data-target="#scenicDetailDialog" onclick="hotdetail()" value>
						<img width="208px" id="hot_scenic_img" />
					</a> <a onclick="hotdetail()" data-toggle="modal"
						data-target="#scenicDetailDialog">
						<h3 id="hot_scenic_name"></h3>
					</a>
					<div id="divtext">
						<p id="hot_scenic_introduce"></p>
					</div>
				</div>
			</div>

			<div class="active">
				<div class="title">
					<h3>主题活动</h3>
				</div>
				<div class="actdesc">
					<a href="#"><img
						src="${pageContext.request.contextPath }/upload/img18.jpg" /></a>
					<p class="h">
						<a href="#">热门团</a>
					</p>
					<p>
						截止日期：<span>2020年8月31日</span>
					</p>
				</div>
			</div>

			<div class="tag">
				<div class="title">
					<h3>热门标签</h3>
				</div>
				<div class="taglist">
					<ul>
						<li><a href="#" class="lev1">标签</a></li>
						<li><a href="#" class="lev3">登山</a></li>
						<li><a href="#" class="lev3">自驾车</a></li>
						<li><a href="#" class="lev2">骑车</a></li>
						<li><a href="#" class="lev2">自然</a></li>
						<li><a href="#" class="lev3">徒步</a></li>
						<li><a href="#" class="lev3">兴趣</a></li>
						<li><a href="#" class="lev1">心情</a></li>
						<li><a href="#" class="lev2">户外</a></li>
						<li><a href="#" class="lev1">景色</a></li>
						<li><a href="#" class="lev3">大海</a></li>
						<li><a href="#" class="lev2">骑车</a></li>
						<li><a href="#" class="lev1">大海</a></li>
						<li><a href="#" class="lev3">徒步</a></li>
						<li><a href="#" class="lev3">天气</a></li>
						<li><a href="#" class="lev1">心情</a></li>
						<li><a href="#" class="lev2">景色</a></li>
						<li><a href="#" class="lev2">景色</a></li>
						<li><a href="#" class="lev1">驴友</a></li>
					</ul>
				</div>
			</div>

			<br> <br> <br> <br> <br>
		</div>
	</div>


	<script>
		var d = document;
		/*显示对话窗口*/
		function openBody() {
			$('.chat-support-btn').css({
				'display' : 'none'
			});
			$('.chat-main').css({
				'display' : 'inline-block',
				'height' : '0'
			});
			$('.chat-main').animate({
				'height' : '525px'
			})
		}
		openBody();
		// 模拟一些后端传输数据
		var serviceData = {
			'robot' : {
				'chat' : [ 'Google一下吗？www.google.com', '这个网站您看一下www.baidu.com',
						'稍等哦~', '嘿嘿', '百度一下？www.baidu.com', '嗯嗯嗯' ],
			}
		};

		var chatMain = $('.chat-main'), chatHint = $('#chatHint'), chat_Hint = $('#chat_hint'), headerInfoDiv = $('.header-info-div');
		chat_main = d.querySelector('.chat-main');
		chatInput = d.querySelector('#chat_input'), chatContain = d
				.querySelector('#chat_contain'), btnOpen = d
				.querySelector('#btn_open'), btnClose = d
				.querySelector('#btn_close');

		/*拖动*/

		document.ondragover = function(e) {
			console.log("Firefox上此处不会执行，Chrome正常");
			e.preventDefault();
		};
		function chatDrag(target) {
			target.ondragstart = function(e) {
				e = e || window.event;
				e.dataTransfer.clearData();
				offsetX = e.offsetX;
				offsetY = e.offsetY;
			}
			target.ondrag = function(e) {
				e = e || window.event;
				var x = e.pageX;
				var y = e.pageY;
				if (x == 0 && y == 0) {
					return; //不处理拖动最后一刻X和Y都为0的情形
				}
				x -= offsetX;
				y -= offsetY;
				target.style.left = x + 'px';
				target.style.top = y + 'px';
			}
		}
		chatDrag(chat_main);//拖动聊天窗口
		chatDrag(btnOpen);//拖动头像小图标

		/*头像信息*/

		/*鼠标在头像上*/
		$('.chat-service-img').mouseenter(function() {
			headerInfoDiv.fadeIn(1000);
		})
		$('.chat-service-img').mouseleave(function() {
			headerInfoDiv.fadeOut();
		})
		/*关闭对话框*/
		function closeChat() {
			$('.chat-main').animate({
				'height' : '0'
			});
			$('.chat-main').css({
				'display' : 'none'
			});
			$('.chat-support-btn').css({
				'display' : 'inline-block'
			});
		}

		btnOpen.addEventListener('click', function(e) {/*点击头像打开聊天窗口*/
			e = e || window.event;
			openBody();
		})

		btnClose.addEventListener('click', closeChat)

		/*创建新消息框*/
		function createInfo(name, value) {
			var chatTime = new Date();
			chatTime = chatTime.toLocaleTimeString();
			var nodeP = d.createElement('p'), nodeSpan = d
					.createElement('span')
			nodeTime = d.createElement('p');
			value = value
					.replace(
							/(((ht|f)tps?):\/\/)?([A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*)/g,
							function(content) {
								return "<a href='http://"+content+"' class='chat-address' target='view_window' style='color:#6666cc '>"
										+ content + '</a>';
								;
							});
			nodeP.classList.add('chat-' + name + '-contain');
			nodeSpan.classList.add('chat-' + name + '-text', 'chat-text');
			nodeTime.classList.add('chat-time');
			nodeSpan.innerHTML = value;
			nodeTime.innerHTML = chatTime;
			nodeP.appendChild(nodeTime);
			nodeP.appendChild(nodeSpan);
			chatContain.appendChild(nodeP);
			chatContain.scrollTop = chatContain.scrollHeight;
		}
		createInfo('service', '亲 终于等到您了！我是爱旅行旅游专属客服，有关旅游的任何问题，您都可以随时咨询我！'); /*发送第一句话*/
		var timer, timerId, flagInput = false;
		shiftDown = false; // 判断是否按住shift键

		function chatHintNull(chatHint) {//空输入提示
			setTimeout(function() {
				chatHint.fadeIn();
				clearTimeout(timerId);
				timer = setTimeout(function() {
					chatHint.fadeOut();
				}, 1000);
			}, 10);
			timerId = timer;
		};
		/*监控是否按下enter*/
		function isEnter(Input, Hint, type, e) {
			e = e || window.event;
			if (e.keyCode == 16) {//按住shift键
				shiftDown = true;
			}
			if (e.keyCode == 13) {

				if (shiftDown == true) {
					shiftDown = false;
					return true;
				} else if (shiftDown == false && Input.value == '') {
					Hint();
					return true;
				} else {
					e.preventDefault();
					createInfo(type, Input.value);
					submityouText(Input.value);
					Input.value = null;
					Input.focus();

				}
			}
		}

		chatInput.addEventListener('keydown', function(e) {/*输入框按enter*/
			e = e || window.event;
			isEnter(chatInput, chatHintNull, 'you', e);
		})

		/*为按钮绑定事件*/
		$('.chat-input-button').click(function() {/*消息框发送*/

			if (chatInput.value != '') {
				createInfo('you', chatInput.value);
				submityouText(chatInput.value);
				chatInput.value = null;
				chatInput.focus();

			} else {
				chatHintNull(chatHint);
			}
		});

		/*关闭按钮*/
		$('.chat-close-button').click(function closeChat() {
			$('.chat-main').animate({
				'height' : '0'
			});
			$('.chat-main').css({
				'display' : 'none'
			});
			$('.chat-support-btn').css({
				'display' : 'inline-block'
			});
		});
		/*按钮特效*/
		var buttons = $('button');
		buttons.each(function(i) {
			$(this).mouseenter(function() {
				buttons.eq(i).fadeTo('slow', 0.8);
			});
		})
		buttons.each(function(i) {
			$(this).mouseleave(function() {
				buttons.eq(i).fadeTo('slow', 1);
			});
		})

		function submityouText(text) {

			// 模拟后端回复
			var num = Math.random() * 10;
			if (num <= 7) {
				getServiceText(serviceData);
			}
		}

		function getServiceText(data) {/*已定义后台消息框*/
			var serviceText = data.robot.chat, i = Math.floor(Math.random()
					* serviceText.length);
			createInfo('service', serviceText[i]);
		}
	</script>
</body>


<script type="text/javascript">
//页面加载完成显示热门景点
$(document).ready(function(){
	$.get("<%=basePath%>getHotScenic.action", function(data) {
		$("#hot_scenic_img").attr('src','http://localhost:8080/data/file/'+data.scenic_img)
		$("#hot_scenic_introduce").text(data.scenic_introduce);
		$("#hot_scenic_name").text(data.scenic_name);
		$("#hot_scenic_id").val(data.scenic_id);
		
	});
});
//查询热门景点详情
function hotdetail() {
	var scenic_id = $("#hot_scenic_id").val();
    $.ajax({
        type:"get",
        url:"<%=basePath%>getScenicById.action",
			data : {"scenic_id" : scenic_id},//注意这里的传过去的键值对要对应上
			success : function(data) {
				$("#detail_scenic_id").val(data.scenic_id);
				$("#detail_scenic_img").attr('src','http://localhost:8080/data/file/' + data.scenic_img)
				$("#detail_scenic_name").text(data.scenic_name)
				$("#detail_scenic_price").text(data.scenic_price)
				$("#detail_scenic_evaluate").text(data.scenic_evaluate).attr('style', 'font-size:18px')
				$("#detail_scenic_introduce").text(data.scenic_introduce).attr('style', 'font-size:18px')
				$("#detail_scenic_phone").text(data.scenic_phone).attr('style','font-size:18px')
				$("#detail_scenic_startDate").text(new Date(data.scenic_startDate).toLocaleDateString());
				$("#detail_scenic_endDate").text(new Date(data.scenic_endDate).toLocaleDateString());
			}
		});
	}
</script>
</html>