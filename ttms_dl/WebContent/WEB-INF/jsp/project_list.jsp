<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%@ include file="frame.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>项目管理</title>

<script type="text/javascript">
function todelect(){
	
	    var Checkbox=false;//默认复选框为空
	     $("input[name='id']").each(function(){//获取复选框节点id
	      if (this.checked==true) {        
	        Checkbox=true;    //已勾选
	      }
	    });
	    if (Checkbox){//boolean值为true
	        var t=confirm("您确认要删除选中的内容吗？");//弹出对话进行警告
	        if (t==false) return false;    //不勾选不处理
	        obj = document.getElementsByName("id");//将复选框定义成一个jquery对象
	        check_val = [];//定义一个数组
	        for(k in obj){//k相当于i,往这个jquery对象添加勾选的id;
	            if(obj[k].checked)//选中的都放进 数组里
	                check_val.push(obj[k].value);
	        }
	   
	        $.ajax({//利用ajax发出请求
	            type:"POST",//post类型
	            url:"<%=basePath%>ttms/project_list/deleteCheck.action?ids="+check_val, //向Controller里的deleteSelect传输ids
	            success:function(data){//删除成功后，deleteMany会返回一个"ok";
	            if(data=="OK"){
	                alert("删除项目成功！");//返回ok后弹出一个对话框。
	                window.location.reload();
	            }else{
					 alert("删除项目失败！");
        			 window.location.reload();
				}
	        } 
	});
	      
	    }
	    else{
	        alert("请选择您要删除的内容!");//不勾选不提交，弹出警告框。
	        return false;
	    }
	    
	    
	}
	/* 禁用 */
function toforbid(){
	
	    var Checkbox=false;//默认复选框为空
	     $("input[name='id']").each(function(){//获取复选框节点id
	      if (this.checked==true) {        
	        Checkbox=true;    //已勾选
	      }
	    });
	    if (Checkbox){//boolean值为true
	        var t=confirm("您确认要禁用该项目吗？");//弹出对话进行警告
	        if (t==false) return false;    //不勾选不处理
	        obj = document.getElementsByName("id");//将复选框定义成一个jquery对象
	        check_val = [];//定义一个数组
	        for(k in obj){//k相当于i,往这个jquery对象添加勾选的id;
	            if(obj[k].checked)//选中的都放进 数组里
	                check_val.push(obj[k].value);
	        }
	   
	        $.ajax({//利用ajax发出请求
	            type:"POST",//post类型
	            url:"<%=basePath%>ttms/project_list/updateStateNo.action?ids="+check_val,
	            success:function(data){
	            if(data=="OK"){
	                alert("禁用项目成功！");
	                window.location.reload();
	            }else{
					 alert("禁用项目失败！");
        			 window.location.reload();
				}
	        	}
			});
	    }
	    else{
	        alert("请选择您要禁用的项目!");//不勾选不提交，弹出警告框。
	        return false;
	    }
}
/* 启用 */
function tostart(){
	
	    var Checkbox=false;//默认复选框为空
	     $("input[name='id']").each(function(){//获取复选框节点id
	      if (this.checked==true) {        
	        Checkbox=true;    //已勾选
	      }
	    });
	    if (Checkbox){//boolean值为true
	        var t=confirm("您确认要启用该项目吗？");//弹出对话进行警告
	        if (t==false) return false;    //不勾选不处理
	        obj = document.getElementsByName("id");//将复选框定义成一个jquery对象
	        check_val = [];//定义一个数组
	        for(k in obj){//k相当于i,往这个jquery对象添加勾选的id;
	            if(obj[k].checked)//选中的都放进 数组里
	                check_val.push(obj[k].value);
	        }
	   
	        $.ajax({//利用ajax发出请求
	            type:"POST",//post类型
	            url:"<%=basePath%>ttms/project_list/updateStateOk.action?ids="+check_val,
	            success:function(data){
	            if(data=="OK"){
	                alert("启用项目成功！");
	                window.location.reload();
	            }else{
					 alert("启用项目失败！");
        			 window.location.reload();
				}
	        	}
			});
	    }
	    else{
	        alert("请选择您要启用的项目!");//不勾选不提交，弹出警告框。
	        return false;
	    }
}
</script>

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
								<li class="active" id="titleId">项目信息管理</li>
							</ol>
						</div>
					</div>
					<form id="queryFormId"
						action="${pageContext.request.contextPath }/ttms/project_list.action">
						<!-- 查询表单 -->
						<div class="row page-search">
							<div class="col-md-12">
								<ul class="list-unstyled list-inline">
									<li><input type="text" id="name" value="${Name }"
										name="name" class="form-control" placeholder="项目名称"></li>
									<li class='O1'><button type="submit"
											class="btn btn-primary btn-search">查询项目</button></li>
									<li class='O2'><a href="#" class="btn btn-info btn-add"
										data-toggle="modal" data-target="#newProjectDialog"
										onclick="clearProject()">新建项目</a></li>
									<li class='O3'><button type="button"
											class="btn btn-danger btn-invalid"
											onclick="return toforbid()">禁用项目</button></li>
									<li class='O4'><button type="button"
											class="btn btn-success btn-valid" onclick="return tostart()">启用项目</button></li>
									<li class='O5'><button type="button"
											class="btn btn-danger btn-delete" onclick="return todelect()">删除项目</button></li>
								</ul>
							</div>
						</div>
						<!-- 项目列表显示内容 -->
						<div class="row col-md-12">
							<table id="tableDate" class="table table-bordered">
								<thead>
									<tr>
										<th><input id="all" type="checkbox" />全选</th>
										<th>项目编码</th>
										<th>项目名称</th>
										<th>开始时间</th>
										<th>结束时间</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.rows}" var="row">
										<tr>
											<td><input type="checkbox" name="id" value="${row.id }" /></td>
											<td>${row.id}</td>
											<td>${row.name}</td>
											<td>${row.beginDate}</td>
											<td>${row.endDate}</td>

											<c:if test="${row.valid==0 }">
												<td>禁用</td>
											</c:if>
											<c:if test="${row.valid==1 }">
												<td>启用</td>
											</c:if>

											<td><a href="#" class="btn btn-primary btn-xs"
												data-toggle="modal" data-target="#projectEditDialog"
												onclick="editProject(${row.id})">修改</a> <a href="#"
												class="btn btn-danger btn-xs"
												onclick="deleteProject(${row.id})">删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-12 text-right">
								<itheima:page
									url="${pageContext.request.contextPath }/ttms/project_list.action" />
							</div>
						</div>
					</form>
				</div>
			</article>
		</div>
	</div>

	<!-- 创建项目模态框 -->
	<div class="modal fade" id="newProjectDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建项目信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_project_form">
						<div class="form-group">
							<label for="new_projectCode"
								style="float: left; padding: 7px 15px 0 27px;">项目编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_projectCode"
									placeholder="请输入项目编号" name="code" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_projectName" class="col-sm-2 control-label">
								项目名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_projectName"
									placeholder="请输入项目名称" name="name" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_projectBeginDate"
								style="float: left; padding: 7px 15px 0 27px;">开始时间</label>
							<div class="col-sm-10">
								<input type="Date" class="form-control" min="1970-01-01"
									max="2099-12-31" id="new_projectBeginDate" name="beginDate" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_projectEndDate"
								style="float: left; padding: 7px 15px 0 27px;">结束时间</label>
							<div class="col-sm-10">
								<input type="Date" class="form-control" id="new_projectEndDate"
									min="1970-01-01" max="2099-12-31" name="endDate" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_projectNote" class="col-sm-2 control-label">
								备注说明 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_projectNote"
									placeholder="请输入备注信息" name="note" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createProject()">创建项目</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改项目模态框 -->
	<div class="modal fade" id="projectEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改项目信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_project_form">
						<input type="hidden" id="edit_id" name="id" />
						<div class="form-group">
							<label for="edit_projectCode"
								style="float: left; padding: 7px 15px 0 27px;">项目编号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_projectCode"
									placeholder="项目编号" name="code" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_projectName" class="col-sm-2 control-label">
								项目名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_projectName"
									placeholder="项目名称" name="name" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_projectBeginDate"
								style="float: left; padding: 7px 15px 0 27px;">开始时间</label>
							<div class="col-sm-10">
								<input type="Date" class="form-control" min="1970-01-01"
									max="2099-12-31" id="edit_projectBeginDate" name="beginDate" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_projectEndDate"
								style="float: left; padding: 7px 15px 0 27px;">结束时间</label>
							<div class="col-sm-10">
								<input type="Date" class="form-control" id="edit_projectEndDate"
									min="1970-01-01" max="2099-12-31" name="endDate" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_projectNote" class="col-sm-2 control-label">
								备注说明 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_projectNote"
									name="note" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateProject()">保存修改</button>
				</div>
			</div>
		</div>
	</div>






	<!-- --------------------------植入 添加/修改/删除JS开始------------------------ -->
	<script type="text/javascript">
	//清空新建项目窗口中的数据
	function clearProject() {
	    $("#new_projectCode").val("");
	    $("#new_projectName").val("")
	    $("#new_projectBeginDate").val("")
	    $("#new_projectEndDate").val("")
	    $("#new_projectNote").val("");
	}
	// 创建项目
	function createProject() {
		$.post("<%=basePath%>ttms/project_list/create.action",
		$("#new_project_form").serialize(),function(data){
		        if(data =="OK"){
		            alert("项目创建成功！");
		            window.location.reload();
		        }else{
		            alert("项目创建失败！");
		            window.location.reload();
		        }
		    });
		}
	
	// 通过id获取修改的项目信息
	function editProject(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>ttms/project_list/getProjectById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_id").val(data.id);
	            $("#edit_projectCode").val(data.code);
	            $("#edit_projectName").val(data.name)
	            $("#edit_projectBeginDate").val(data.beginDate)
	            $("#edit_projectEndDate").val(data.endDate)
	            $("#edit_projectNote").val(data.note);
	        }
	    });
	}
    // 执行修改项目操作
	function updateProject() {
		$.post("<%=basePath%>ttms/project_list/update.action",$("#edit_project_form").serialize(),function(data){
			if(data =="OK"){
				alert("项目信息更新成功！");
				window.location.reload();
			}else{
				alert("项目信息更新失败！");
				window.location.reload();
			}
		});
	}
    
		// 删除项目
		function deleteProject(id) {
		    if(confirm('确实要删除该项目吗?')) {
		$.post("<%=basePath%>ttms/project_list/delete.action",{"id":id},
		function(data){
		            if(data =="OK"){
		                alert("项目删除成功！");
		                window.location.reload();
		            }else{
		                alert("删除项目失败！");
		                window.location.reload();
		            }
		        });
		    }
		}
		 
	</script>
	<!-- --------------------------植入 添加/修改/删除JS结束-------------------------- -->
</body>
</html>
