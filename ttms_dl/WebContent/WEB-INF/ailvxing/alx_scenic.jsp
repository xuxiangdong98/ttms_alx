<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<!-- 引入页面框架jsp文件 -->
<%@ include file="alx_framework.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>爱旅行 - 爱生活，爱旅行！</title>
<style type="text/css">
#footer {
	display: none;
}

.
sname {
	color: orange;
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.css" />
	
	<style type="text/css">
	<style>
			.container {
				margin: 280px auto;
				position: relative;
				width: 600px;
				height: 400px;
				background-color: red;
				overflow: hidden;
				background: url(img/1.jpg);
			}

			.view {
				width: 100%;
				height: 100%;
				display: none;
			}

			.container:hover .view {
				display: block;
				background-color: rgba(0, 0, 0, 0.6);

			}
		</style>
	</style>
</head>
<body>
	<!-- 主体 -->
	<div id="content">
		<div class="container">
			<div class="wrapper">
				<article>
					<div class="page-header">
						<div class="page-title" style="padding-bottom: 5px">
							<ol class="breadcrumb">
								<li class="active" id="titleId">景点预览</li>
							</ol>
						</div>
					</div>
					<form id="queryFormId"
						action="${pageContext.request.contextPath }/showScenicList.action">
						<!-- 查询表单 -->
						<div class="col-md-12">
							<ul class="list-unstyled list-inline">
								<li><input type="text" id="scenic_name" value="${scenic_name }"
									name="scenic_name" class="form-control" placeholder="景点名称"></li>
								<li class='O1'><button type="submit"
										class="btn btn-primary btn-search">查询景点</button></li>
							</ul>
						</div>
						<!-- 查询景点列表显示内容 -->
						<c:forEach items="${page.rows}" var="row">
							<div class="col-md-12">
								<div style="width: 100%; height: 250px; margin: 0 auto; background-color: aliceblue;border-radius: 27px"> 
									<img src="http://localhost:8080/data/file/${row.scenic_img}"
										width="40%" height="100%" alt="加载失败"
										style="float: left; border-radius: 30px;">
									<div class="caption"
										style="height: 99%; padding: 0px; margin: 0px auto;">
										<div style="padding: 10px; font-size: 14px; color: purple;">景点编号:${row.scenic_id}</div>
										<div style="padding: 8px; font-size: 30px;">
											<a href="#" class="sname" style="color: orange;">景点名称:${row.scenic_name}</a>
										</div>
										<div style="padding: 5px; margin: 0px auto;">
											<div style=" font-size: 20px; padding: 3px; color: skyblue;">景点电话:${row.scenic_phone}</div>
											<div style=" font-size: 20px; padding: 3px; color: green;">景点评分:${row.scenic_evaluate}&nbsp分</div>
											<div style=" font-size: 20px; padding: 3px; color: hotpink;">景点价格:${row.scenic_price}&nbsp元</div>
										</div>
											<div style="font-size: 20px; margin-left:60%;">
												<a href="#" class="btn btn-info" data-toggle="modal"
													data-target="#scenicDetailDialog"
													onclick="detailScenic(${row.scenic_id})">景点详情</a>
											</div>
									</div>
								</div>
								<br>
							</div>

						</c:forEach>
						<div class="col-md-12" style="">
							<itheima:page
								url="${pageContext.request.contextPath }/showScenicList.action" />
						</div>
					</form>

				</article>
			</div>
		</div>
	</div>

	<!-- 景点详情 -->
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
					<button type="button" class="btn btn-primary"
						onclick="reserveScenic()">立即预订</button>
					<button type="button" class="btn btn-info"
						onclick="collectScenic()">收藏</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
//查询详情
function detailScenic(scenic_id) {
    $.ajax({
        type:"get",
        url:"<%=basePath%>getScenicById.action",
        data:{"scenic_id":scenic_id},//注意这里的传过去的键值对要对应上
        success:function(data) {
        	console.log(data);
            $("#detail_scenic_id").val(data.scenic_id);
            $("#detail_scenic_img").attr('src','http://localhost:8080/data/file/'+data.scenic_img)
            $("#detail_scenic_name").text(data.scenic_name)
            $("#detail_scenic_price").text(data.scenic_price)
            $("#detail_scenic_evaluate").text(data.scenic_evaluate).attr('style','font-size:18px')
            $("#detail_scenic_introduce").text(data.scenic_introduce).attr('style','font-size:18px')
            $("#detail_scenic_phone").text(data.scenic_phone).attr('style','font-size:18px')
            $("#detail_scenic_startDate").text(new Date(data.scenic_startDate).toLocaleDateString());
            $("#detail_scenic_endDate").text(new Date(data.scenic_endDate).toLocaleDateString());
        }
    });
}
//将该景点添加到用户预订
 function reserveScenic() {
	var scenic_id = $("#detail_scenic_id").val();
	console.log(scenic_id);
	 $.ajax({
	        type:"get",
	        url:"<%=basePath%>alx/userReserveScenic.action",
	        data:{"scenic_id":scenic_id},
	        success:function(data) {
	        if(data =="OK"){
	            alert("景点预订成功！");
	            window.location.reload();
	        }else if(data == "FailIn"){
	        	   alert("景点预订失败,你已预订的订单还未处理！");
	        }else{
	           alert("景点预订失败！");
	           $(window).attr("location","<%=basePath%>alxCheck.action");
	          <%--   window.location.href="<%=basePath%>/toAlxlogin.action"; --%>
	        }
	        }
	    });
	} 

//将该景点添加到用户收藏
function collectScenic() {
	var scenic_id = $("#detail_scenic_id").val();
	console.log(scenic_id);
	 $.ajax({
	        type:"get",
	        url:"<%=basePath%>alx/userCollectScenic.action",
	        data:{"scenic_id":scenic_id},
	        success:function(data) {
	        if(data =="OK"){
	            alert("景点收藏成功！");
	            window.location.reload();
	        }else if(data == "FailIn"){
	        	   alert("景点收藏失败,你已经收藏过了！");
	        }else{
	           alert("景点收藏失败！");
	           $(window).attr("location","<%=basePath%>alxCheck.action");
	        }
	        }
	    });
	}
	
/* 	
//这里给所有ajax请求添加一个complete函数
$.ajaxSetup({
            complete : function(xhr, status) {
                //拦截器实现超时跳转到登录页面
                // 通过xhr取得响应头
                var REDIRECT = xhr.getResponseHeader("REDIRECT");
                //如果响应头中包含 REDIRECT 则说明是拦截器返回的
                if (REDIRECT == "REDIRECT")
                {
                    var win = window;
                    while (win != win.top)
                    {
                        win = win.top;
                    }
                    //重新跳转到 login.html 
                    win.location.href = xhr.getResponseHeader("CONTEXTPATH");
                }
            }
        }); */
</script>
</html>