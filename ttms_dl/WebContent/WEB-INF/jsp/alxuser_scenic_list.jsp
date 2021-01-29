<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%@ include file="frame.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>景点预订管理</title>
</head>
<body onload="init()">

	<!-- 正文-->
	<div class="wrapper">
		<div class="container-fluid">
			<article>
				<div class="container">
					<div class="page-header">
						<div class="page-title" style="padding-bottom: 5px">
							<ol class="breadcrumb">
								<li class="active" id="titleId">景点预订管理</li>
							</ol>
						</div>
					</div>
					<!-- 查询表单 -->
					<form id="queryFormId"
						action="${pageContext.request.contextPath }/ttms/showAllAlxUserReserveScenicList.action">
						<%-- <div class="col-md-12">
							<ul class="list-unstyled list-inline">
								<li><input type="text" id="scenic_name"
									value="${scenic_name }" name="scenic_name" class="form-control"
									placeholder="景点名称"></li>
								<li class='O1'><button type="submit"
										class="btn btn-primary btn-search">查询</button></li>
							</ul>
						</div>
 --%>

						<!-- 景点预订列表显示内容 -->
						<div class="row col-md-12">
							<table id="tableDate" class="table table-bordered">
								<thead>
									<tr>
										<th><input id="all" type="checkbox" />全选</th>
										<th>景点预订单号</th>
										<th>景点名称</th>
										<th>用户名称</th>
										<th>预定时间</th>
										<th>预订处理</th>
										<!-- 预定成功，预定失败，给该用户发送预定失败原因：人数已满 -->
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${page.rows}" var="row">
										<tr>
											<td><input type="checkbox" name="id"
												value="${row.reserve_sid }" />
											</td>
											<td>${row.reserve_sid }</td>
											<c:forEach items="${row.alxScenics }" var="alxScenics">
											<td>${alxScenics.scenic_name}</td>
											</c:forEach>
											<c:forEach items="${row.alxUsers }" var="alxUsers">
											<td>${alxUsers.alx_uname}</td>
											</c:forEach>
											
											<td>${row.reserve_startDate}</td>
											<c:if test="${row.reserve_valid==0 }">
												<td>未处理预订</td>
											</c:if>
											<c:if test="${row.reserve_valid==1 }">
												<td>已处理预订</td>
											</c:if>

											<td><a href="#" class="btn btn-primary btn-xs"
												data-toggle="modal" data-target="#projectEditDialog"
												onclick="handleAlxUserReserveScenic(${row.reserve_sid})">处理</a> 
												<a href="#"
												class="btn btn-danger btn-xs"
												onclick="deleteAlxUserReserveScenic(${row.reserve_sid})">删除</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-12 text-right">
								<itheima:page
									url="${pageContext.request.contextPath }/ttms/showAllAlxUserReserveScenicList.action" />
							</div>
						</div>
					</form>
				</div>
			</article>
		</div>
	</div>


	</div>
	</article>
	</div>
	</div>
	<br>

	<script type="text/javascript">
	// 删除预订项
	function deleteAlxUserReserveScenic(reserve_sid) {
	    if(confirm('确实要删除该预订项吗?')) {
	$.post("<%=basePath%>ttms/deleteAlxUserReserveScenic.action",{"reserve_sid":reserve_sid},
	function(data){
	            if(data =="OK"){
	                alert("该预订项删除成功！");
	                window.location.reload();
	            }else{
	                alert("该预订项景点失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
	 // 处理景点预订操作
	function handleAlxUserReserveScenic(reserve_sid) {
		alert("确定处理该预订")
		$.post("<%=basePath%>ttms/handleAlxUserReserveScenic.action",{"reserve_sid":reserve_sid},
		function(data){
			if(data =="OK"){
				alert("处理景点预订成功！");
				window.location.reload();
			}else{
				alert("处理景点预订失败！");
				window.location.reload();
			}
		});
	}
    
	</script>
</body>
</html>
