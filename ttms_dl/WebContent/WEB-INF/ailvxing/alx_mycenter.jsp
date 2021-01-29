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
<title>爱旅行 - 个人中心</title>
</head>
<body>
	<div class="container">
		<div class="">
			<ul class="nav nav-tabs"
				style="background-color: #F5F5F5; width: 75%; position: relavite; top: 65px;">
				<li role="presentation" class="active"><a href="#">已预订景点</a></li>
				<li role="presentation"><a
					href="${pageContext.request.contextPath }/alx/myCollectScenic.action">我的收藏</a></li>
			</ul>
		</div>

		<article>
			<div class="page-header " style="">
				<div class="page-title" style="padding-bottom: 5px">
					<ol class="breadcrumb">
						<li class="active" id="titleId">我的景点</li>
					</ol>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${page.rows}" var="row">
					<!-- 查询景点列表显示内容 -->
					<div class="col-md-12">
						<div style="width: 80%; height: 250px; margin: 0 auto; background-color: white;border-radius: 27px;">
							<img src="http://localhost:8080/data/file/${row.scenic_img}"
								width="40%" height="100%" alt="加载失败"
								style="float: left; border-radius: 30px;">
							<div class="caption"
								style="height: 99%; padding: 0px; margin: 0px auto;">

								<c:set value="${row.reserveScenics }" var="reserveScenics" />
								<c:forEach items="${reserveScenics }" var="reserveScenic">
									<div style="padding: 10px; font-size: 16px;">

										<a href="#" class="sname" style="color: orange;">景点订单编号:<span
											id="reserve_sid">${reserveScenic.reserve_sid }&nbsp;&nbsp;</span>
										</a> 景点编号:${row.scenic_id}&nbsp;&nbsp;

										<c:if test="${reserveScenic.reserve_valid == 0 }">
											<a style="color: red;">预订状态:未处理！请等待管理员处理&nbsp;&nbsp;</a>
										</c:if>
										<c:if test="${reserveScenic.reserve_valid == 1 }">
											<a style="color: green;"> 景点预订状态:已处理！&nbsp;&nbsp;</a>
										</c:if>

									</div>
									<div style="padding: 10px; font-size: 30px;">
										<a href="#" class="sname" style="color: orange;">景点名称:${row.scenic_name }</a>
									</div>
									<div style="padding: 10px; margin: 0px auto;">
										<div style="float: left; font-size: 20px;">景点电话:${row.scenic_phone}</div>
										<div style="margin-left: 81%;">
											<button type="button" class="btn btn-danger"
												onclick="cancelScenic(${reserveScenic.reserve_sid })">取消预订</button>
										</div>
									</div>
								</c:forEach>
								<div class="clearfloat" style="font-size: 20px;">
									<div style="font-size: 20px; padding: 10px;">景点价格:${row.scenic_price}
										&nbsp;元/位
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;景点评分:${row.scenic_evaluate}&nbsp;分</div>
									<div style="font-size: 20px; margin-left: 80%;">
										<a href="#" class="btn btn-info" data-toggle="modal"
											data-target="#scenicDetailDialog"
											onclick="detailScenic(${row.scenic_id})">景点详情</a>

									</div>
								</div>

							</div>
						</div>
						<br>
					</div>
				</c:forEach>

			</div>
		</article>
		<div class="col-md-12 text-center">
			<itheima:page
				url="${pageContext.request.contextPath }/alx/myReserveScenic.action" />
		</div>
	</div>
	<br>
	<br>
	<br>

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
								type="hidden" id="detail_alx_uid" name="alx_uid" /> <input
								type="hidden" id="detail_reserve_sid" name="reserve_sid" />
						</form>
						<div class="thumbnail">
							<img id="detail_scenic_img" width="100%" height="250px"
								alt="加载失败">
							<div class="caption">
								<p style="font-size: 22px; color: dodgerblue;">
									<strong>景点名称:</strong><span id="detail_scenic_name"></span>
								</p>
								<p style="font-size: 22px; color: orange;">
									<strong>景点介绍:</strong><span id="detail_scenic_introduce"></span>
								</p>
								<p style="font-size: 22px; color: red;">
									<strong>景点电话:</strong><span id="detail_scenic_phone"></span>
								</p>
								<p style="font-size: 22px; color: black;">
									<strong>预订时间:</strong><span id="detail_scenic_startDate"></span>
								</p>
							</div>
							<div></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
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
        url:"<%=basePath%>alx/myReserveScenic2.action",
        data:{"scenic_id":scenic_id},//注意这里的传过去的键值对要对应上
		success:function(data) {
        	console.log(data);
            $("#detail_scenic_id").val(data.scenic_id);
            $("#detail_reserve_sid").val(reserve_sid);
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

//将该景点取消预订
function cancelScenic(reserve_sid) {
	if(confirm('确实要取消预订该景点吗?')) {
	$.ajax({
        type:"get",
        url:"<%=basePath%>alx/userCancelScenic.action",
        data:{"reserve_sid":reserve_sid},//注意这里的传过去的键值对要对应上
		success:function(data) {
	        if(data=="OK"){
	            alert("景点取消预订成功！");
	            window.location.reload();
	        }else{
	           alert("景点取消预订失败！");
	          	window.location.reload();
	        }
	        }
	    });
	}
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

</script>

</html>