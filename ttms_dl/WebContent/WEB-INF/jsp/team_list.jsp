<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%@ include file="frame.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<title>团目管理</title>
<!-- 引入表格的全选和隔行换色JS -->
<script src="${pageContext.request.contextPath }/js/table.js"
	type="text/javascript" charset="utf-8"></script>
	
	<script type="text/javascript">
function todelectTeam(){
	
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
	            url:"<%=basePath%>ttms/team_list/deleteTeamCheck.action?ids="+check_val,
	            success:function(data){//删除成功后会返回一个"ok";
	            if(data=="OK"){
	                alert("删除团目成功！");//返回ok后弹出一个对话框。
	                window.location.reload();
	            }else{
					 alert("删除团目失败！");
        			 window.location.reload();
				}
	        } 
	});
	      
	    }
	    else{
	        alert("请选择您要删除的团目!");//不勾选不提交，弹出警告框。
	        return false;
	    }
	    
	    
	}
	/* 禁用 */
function toforbidTeam(){
	
	    var Checkbox=false;//默认复选框为空
	     $("input[name='id']").each(function(){//获取复选框节点id
	      if (this.checked==true) {        
	        Checkbox=true;    //已勾选
	      }
	    });
	    if (Checkbox){//boolean值为true
	        var t=confirm("您确认要禁用该团目吗？");//弹出对话进行警告
	        if (t==false) return false;    //不勾选不处理
	        obj = document.getElementsByName("id");//将复选框定义成一个jquery对象
	        check_val = [];//定义一个数组
	        for(k in obj){//k相当于i,往这个jquery对象添加勾选的id;
	            if(obj[k].checked)//选中的都放进 数组里
	                check_val.push(obj[k].value);
	        }
	   
	        $.ajax({//利用ajax发出请求
	            type:"POST",//post类型
	            url:"<%=basePath%>ttms/team_list/updateTeamStateNo.action?ids="+check_val,
	            success:function(data){
	            if(data=="OK"){
	                alert("禁用团目成功！");
	                window.location.reload();
	            }else{
					 alert("禁用团目失败！");
        			 window.location.reload();
				}
	        	}
			});
	    }
	    else{
	        alert("请选择您要禁用的团目!");//不勾选不提交，弹出警告框。
	        return false;
	    }
}
/* 启用 */
function tostartTeam(){
	
	    var Checkbox=false;//默认复选框为空
	     $("input[name='id']").each(function(){//获取复选框节点id
	      if (this.checked==true) {        
	        Checkbox=true;    //已勾选
	      }
	    });
	    if (Checkbox){//boolean值为true
	        var t=confirm("您确认要启用该团目吗？");//弹出对话进行警告
	        if (t==false) return false;    //不勾选不处理
	        obj = document.getElementsByName("id");//将复选框定义成一个jquery对象
	        check_val = [];//定义一个数组
	        for(k in obj){//k相当于i,往这个jquery对象添加勾选的id;
	            if(obj[k].checked)//选中的都放进 数组里
	                check_val.push(obj[k].value);
	        }
	   
	        $.ajax({//利用ajax发出请求
	            type:"POST",//post类型
	            url:"<%=basePath%>ttms/team_list/updateTeamStateOk.action?ids="+check_val,
	            success:function(data){
	            if(data=="OK"){
	                alert("启用团目成功！");
	                window.location.reload();
	            }else{
					 alert("启用团目失败！");
        			 window.location.reload();
				}
	        	}
			});
	    }
	    else{
	        alert("请选择您要启用的团目!");//不勾选不提交，弹出警告框。
	        return false;
	    }
}
</script>
</head>
<body onload="init()">
	<!-- -------------------------------------------隐藏内容开始--------------------------------- -->
	<!--  添加/修改框主体 -->
	<!-- <div id="login" class="login">
		添加/修改框标题
		<div id="login-title" class="login-title">
			<h3>添加团信息</h3>
			<span><a id="closeBtn" href="javascript:void(0)">关闭</a></span>
		</div>
		添加/修改框表单
		<div id="login-form">
			<div class="login-input">
				<label>团名称：</label> <input type="text" placeholder="请输入团名称"
					class="list-input" />
			</div>
			<div class="login-input">
				<label>所属项目：</label> <select class="login-input">
					<option value="-1">--请选择--</option>
					<option value="0">环球游</option>
					<option value="1">国内游</option>
					<option value="2">国外游</option>
				</select>
			</div>
			<div class="login-input">
				<label>开始时间：</label> <input type="date" class="list-input" />
			</div>

			<div class="login-input">
				<label>结束时间：</label> <input type="date" class="list-input" />
			</div>

			<div class="login-input">
				<label>有效：</label> <input type="radio" name="valid" checked
					value="1">启用 <input type="radio" name="valid" value="0">禁用
			</div>

			<div class="login-input">
				<label>备注：</label>
				<textarea rows="2"></textarea>
			</div>
		</div>
		添加/修改框登陆按钮
		<input type="submit" id="loginSubmit" value="保存" class="loginSubmit" />
	</div>

	遮盖层
	<div id="bg" class="bg"></div> -->
	<!-- ---------------------------------------------隐藏内容结束--------------------------------------------------- -->

	<div class="wrapper">
		<div class="container-fluid">
			<article>
				<!-- 表单 -->
				<div class="container">
					<!-- 页面导航 -->
					<div class="page-header">
						<div class="page-title" style="padding-bottom: 5px">
							<ol class="breadcrumb">
								<li class="active">团信息管理</li>
							</ol>
						</div>
						<div class="page-stats"></div>
					</div>
					<form class="form-inline" method="get"
						action="${pageContext.request.contextPath }/ttms/team_list.action">
						<!-- 查询表单 -->
						<div class="row page-search">
							<div class="col-md-12">
								<ul class="list-unstyled list-inline">
									<li><input type="text" id="name" value="${Name }"
										name="name" class="form-control" placeholder="团目名称"></li>
									<li><select class="form-control" id="projectId"
										name="projectId">
											<option value="">选择项目</option>
											<option value="1">国内游</option>
											<option value="0">国外游</option>
									</select></li>
									<li><select id="valid" name="valid" class="form-control">
											<option value="">选择状态</option>
											<option value="1">启用</option>
											<option value="0">禁用</option>
									</select></li>

									<li class='O1'><button type="submit"
											class="btn btn-primary btn-search">查询团目</button></li>
									<li class='O2'><a href="#" class="btn btn-info btn-add"
										data-toggle="modal" data-target="#newTeamDialog"
										onclick="clearTeam()">新建团目</a></li>
									<li class='O3'><button type="button"
											class="btn btn-danger btn-invalid"
											onclick="return toforbidTeam()">禁用团目</button></li>
									<li class='O4'><button type="button"
											class="btn btn-success btn-valid" onclick="return tostartTeam()">启用团目</button></li>
									<li class='O5'><button type="button"
											class="btn btn-danger btn-delete" onclick="return todelectTeam()">删除团目</button></li>
								</ul>
							</div>
						</div>

						<!-- 项目列表显示内容 -->
						<div class="row col-md-12">
							<table id="tableDate" class="table table-bordered">
								<thead>
									<tr>
										<th><input id="all" type="checkbox" />全选</th>
										<th>团编号</th>
										<th>团名称</th>
										<th>所属项目</th>
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
											<td>${row.projectId}</td>

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
												onclick="deleteTeam(${row.id})">删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-12 text-right">
								<itheima:page
									url="${pageContext.request.contextPath }/ttms/team_list.action" />
							</div>
						</div>
					</form>

				</div>
			</article>

		</div>
	</div>
	<!-- --------------------------植入 添加/修改/删除JS开始------------------------ -->
	<script type="text/javascript">
	//清空新建团目窗口中的数据
	function clearProject() {
	    $("#new_projectCode").val("");
	    $("#new_projectName").val("")
	    $("#new_projectBeginDate").val("")
	    $("#new_projectEndDate").val("")
	    $("#new_projectNote").val("");
	}
	// 创建客户
	function createProject() {
		$.post("<%=basePath%>ttms/project_list/create.action",
		$("#new_project_form").serialize(),function(data){
		        if(data =="OK"){
		            alert("团目创建成功！");
		            window.location.reload();
		        }else{
		            alert("团目创建失败！");
		            window.location.reload();
		        }
		    });
		}
	
	// 通过id获取修改的团目信息
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
    // 执行修改团目操作
	function updateProject() {
		$.post("<%=basePath%>ttms/project_list/update.action",$("#edit_project_form").serialize(),function(data){
			if(data =="OK"){
				alert("团目信息更新成功！");
				window.location.reload();
			}else{
				alert("团目信息更新失败！");
				window.location.reload();
			}
		});
	}
    
		// 删除团目
		function deleteTeam(id) {
		    if(confirm('确实要删除该团目吗?')) {
		$.post("<%=basePath%>ttms/team_list/delete.action",{"id":id},
		function(data){
		            if(data =="OK"){
		                alert("团目删除成功！");
		                window.location.reload();
		            }else{
		                alert("删除团目失败！");
		                window.location.reload();
		            }
		        });
		    }
		}
		 
	</script>
</body>
</html>
