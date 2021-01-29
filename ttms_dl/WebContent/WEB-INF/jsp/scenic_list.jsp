<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%@ include file="frame.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>景点管理</title>
</head>
<body>

	<!-- 正文-->
	<div class="wrapper">
		<div class="container-fluid">
			<article>
				<div class="container">
					<div class="page-header">
						<div class="page-title" style="padding-bottom: 5px">
							<ol class="breadcrumb">
								<li class="active" id="titleId">景点信息管理</li>
							</ol>
						</div>
					</div>
					<!-- 查询表单 -->
					<form id="queryFormId"
						action="${pageContext.request.contextPath }/ttms/showScenicList.action">
						<div class="col-md-12">
							<ul class="list-unstyled list-inline">
								<li><input type="text" id="scenic_name"
									value="${scenic_name }" name="scenic_name" class="form-control"
									placeholder="景点名称"></li>
								<li class='O1'><button type="submit"
										class="btn btn-primary btn-search">查询景点</button></li>
							</ul>
							<div style="text-align: right;">
								<a href="#" class="btn btn-info" data-toggle="modal"
									data-target="#addScenicDetailDialog" onclick="clearScenic()">发布景点</a>
							</div>
						</div>

						<!-- 查询景点列表显示内容 -->
						<c:forEach items="${page.rows}" var="row">
							<div class="col-md-12">
								<div
									style="width: 80%; height: 350px; margin: 0 auto; background-color: aliceblue; border-radius: 30px">
									<img src="http://localhost:8080/data/file/${row.scenic_img}"
										width="50%" height="100%" alt="加载失败"
										style="float: left; border-radius: 30px;">
									<div class="caption" style="height: 99%; margin: 0px auto;">
										<div style=" text-align: center;">
											<div style="padding: 10px; font-size: 16px;">景点编号:${row.scenic_id}</div>
											<div style="padding: 10px; font-size: 30px;">
												<a href="#" class="sname" style="color: orange;">景点名称:${row.scenic_name}</a>
											</div>
											<div style="font-size: 20px; padding: 10px;">景点电话:${row.scenic_phone}</div>
											<div style="font-size: 20px; padding: 10px;">景点评分:${row.scenic_evaluate}&nbsp分</div>

											<div style="font-size: 20px;">
												<div style="font-size: 20px; padding: 10px;">景点价格:${row.scenic_price}&nbsp元</div>
												<div
													style="font-size: 20px; margin-left: 60%; margin: 20px;">
													<a href="#" class="btn btn-info btn-xs" data-toggle="modal"
														data-target="#scenicDetailDialog"
														onclick="detailScenic(${row.scenic_id})">景点详情</a>
													<button type="button" class="btn btn-primary btn-xs"
														data-toggle="modal" data-target="#scenicEditDetailDialog"
														onclick="editScenic(${row.scenic_id})">修改景点</button>
													<button type="button" class="btn btn-danger btn-xs"
														onclick="deleteScenic(${row.scenic_id})">删除景点</button>

												</div>
											</div>
										</div>
									</div>
								</div>
								<br>
							</div>

						</c:forEach>
						<div class="col-md-12 text-center">
							<itheima:page
								url="${pageContext.request.contextPath }/ttms/showScenicList.action" />
						</div>
						</form>
				</div>
			</article>
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
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改景点模态框 -->
	<div class="modal fade" id="scenicEditDetailDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改景点</h4>
				</div>
				<div class="modal-body">
					<img id="edit_scenic_img" width="100%" height="250px" alt="加载失败">
					<hr>
					<form method="post" class="form-horizontal" id="edit_scenic_form"
						enctype="multipart/form-data">
						<input type="hidden" id="edit_scenic_id" name="scenic_id" />
						<div class="form-group">
							<label for="edit_scenic_name" class="col-sm-2 control-label">
								景点名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_scenic_name"
									placeholder="请输入景点名称" name="scenic_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_scenic_price" class="col-sm-2 control-label">
								景点价格 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_scenic_price"
									placeholder="请输入景点价格" name="scenic_price" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_scenic_evaluate" class="col-sm-2 control-label">
								景点评分 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control"
									id="edit_scenic_evaluate" placeholder="请输入景点评分"
									name="scenic_evaluate" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_scenic_phone" class="col-sm-2 control-label">
								景点电话 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_scenic_phone"
									placeholder="请输入景点电话" name="scenic_phone" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_scenic_introduce" class="col-sm-2 control-label">
								景点介绍 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control"
									id="edit_scenic_introduce" placeholder="请输入景点介绍"
									name="scenic_introduce" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_scenic_heat" class="col-sm-2 control-label">
								景点热度 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_scenic_heat"
									placeholder="请输入景点价格" name="scenic_heat" />
							</div>
						</div>
						<!-- <div class="form-group">
							<label for="new_create_time"
								style="float: left; padding: 7px 15px 0 27px;">创建时间</label>
							<div class="col-sm-10">
								<input type="Date" class="form-control" min="1970-01-01"
									max="2099-12-31" id="new_create_time" name="create_time" />
							</div>
						</div> -->
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateScenic()">保存修改</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 添加景点模态框 -->
	<div class="modal fade" id="addScenicDetailDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">发布新景点</h4>
				</div>
				<div class="modal-body">
					<form method="post" class="form-horizontal" id="new_scenic_form"
						enctype="multipart/form-data">

						<div class="form-group">
							<label for="addname" class="col-sm-2 control-label"> </label>
							<div class="col-sm-10">
								<input id="addname" type="hidden" name="addname"
									value="${USER_SESSION.username }">
							</div>
						</div>

						<div class="form-group">
							<label for="file" class="col-sm-2 control-label">景点图片 </label>
							<div class="col-sm-10">
								<input type="file" id="file" name="uploadfile">
							</div>
						</div>
						<div class="form-group">
							<label for="new_scenic_name" class="col-sm-2 control-label">
								景点名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_scenic_name"
									placeholder="请输入景点名称" name="scenic_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_scenic_price" class="col-sm-2 control-label">
								景点价格 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_scenic_price"
									placeholder="请输入景点价格" name="scenic_price" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_scenic_evaluate" class="col-sm-2 control-label">
								景点评分 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_scenic_evaluate"
									placeholder="请输入景点评分" name="scenic_evaluate" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_scenic_phone" class="col-sm-2 control-label">
								景点电话 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_scenic_phone"
									placeholder="请输入景点电话" name="scenic_phone" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_scenic_introduce" class="col-sm-2 control-label">
								景点介绍 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control"
									id="new_scenic_introduce" placeholder="请输入景点介绍"
									name="scenic_introduce" />
							</div>
						</div>
						<!-- <div class="form-group">
							<label for="new_create_time"
								style="float: left; padding: 7px 15px 0 27px;">创建时间</label>
							<div class="col-sm-10">
								<input type="Date" class="form-control" min="1970-01-01"
									max="2099-12-31" id="new_create_time" name="create_time" />
							</div>
						</div> -->
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createScenic()">发布景点</button>
				</div>
			</div>
		</div>
	</div>



	<!-- --------------------------植入 添加/修改/删除JS开始------------------------ -->

	<script type="text/javascript">
	

	//清空发布景点窗口中的数据
	function clearScenic() {
	    $("#new_scenic_name").val("");
	    $("#new_scenic_price").val("")
	    $("#new_scenic_evaluate").val("")
	    $("#new_scenic_phone").val("");
	    $("#new_scenic_introduce").val("");
	}
	// 创建景点
	function createScenic() {
		var file = document.getElementById("file").value;
		if(file.length==0||file==""){
			alert("请选择要上传的图片");
			return false;
		}
		
		var formData = new FormData($( "#new_scenic_form" )[0]);  
	    $.ajax({
	        type:"POST",
	        url: "<%=basePath%>ttms/createScenic.action",
	        data: formData,  
	        async: false,  
	        cache: false,  
	        contentType: false,  
	        processData: false,  
	        success: function(data){
		        if(data =="OK"){
		            alert("景点发布成功！");
		            window.location.reload();
		        }else{
		            alert("景点发布失败！");
		            window.location.reload();
		        }
		    }
	       
	    });      
	};
	//查询景点详情
	function detailScenic(scenic_id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>/ttms/getScenicById.action",
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
	
	// 通过id获取要修改的景点信息
	function editScenic(scenic_id) {
		 $.ajax({
		        type:"get",
		        url:"<%=basePath%>/ttms/getScenicById.action",
		        data:{"scenic_id":scenic_id},//注意这里的传过去的键值对要对应上
		        success:function(data) {
		        	console.log(data);
		            $("#edit_scenic_id").val(data.scenic_id);
		            $("#edit_scenic_img").attr('src','http://localhost:8080/data/file/'+data.scenic_img)
		            $("#edit_scenic_name").val(data.scenic_name);
		            $("#edit_scenic_price").val(data.scenic_price);
		            $("#edit_scenic_evaluate").val(data.scenic_evaluate);
		            $("#edit_scenic_introduce").val(data.scenic_introduce);
		            $("#edit_scenic_phone").val(data.scenic_phone);
		            $("#edit_scenic_heat").val(data.scenic_heat);
		           /*  $("#edit_scenic_startDate").val(data.scenic_startDate);
		            $("#edit_scenic_endDate").val(new Date(data.scenic_endDate).toLocaleDateString()); */
		        }
		    });
	}
    // 执行修改景点操作
	function updateScenic() {
		$.post("<%=basePath%>ttms/updateScenic.action",$("#edit_scenic_form").serialize(),function(data){
			if(data =="OK"){
				alert("景点信息修改成功！");
				window.location.reload();
			}else{
				alert("景点信息修改失败！");
				window.location.reload();
			}
		});
	}
    
		// 删除项目
		function deleteScenic(scenic_id) {
		    if(confirm('确实要删除该景点吗?')) {
		$.post("<%=basePath%>ttms/deleteScenic.action",{"scenic_id":scenic_id},
		function(data){
		            if(data =="OK"){
		                alert("景点删除成功！");
		                window.location.reload();
		            }else{
		                alert("删除景点失败！");
		                window.location.reload();
		            }
		        });
		    }
		}
	</script>
	<!-- --------------------------植入 添加/修改/删除JS结束-------------------------- -->
</body>
</html>
