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
function todelectUser(){
	    var Checkbox=false;//默认复选框为空
	     $("input[name='id']").each(function(){//获取复选框节点id
	      if (this.checked==true) {        
	        Checkbox=true;    //已勾选
	      }
	    });
	    if (Checkbox){//boolean值为true
	        var t=confirm("您确认要删除选中的用户吗？");//弹出对话进行警告
	        if (t==false) return false;    //不勾选不处理
	        obj = document.getElementsByName("id");//将复选框定义成一个jquery对象
	        check_val = [];//定义一个数组
	        for(k in obj){//k相当于i,往这个jquery对象添加勾选的id;
	            if(obj[k].checked)//选中的都放进 数组里
	                check_val.push(obj[k].value);
	        }
	   
	        $.ajax({//利用ajax发出请求
	            type:"POST",//post类型
	            url:"<%=basePath%>ttms/user_list/deleteUserCheck.action?ids="+check_val, //向Controller里的deleteSelect传输ids
	            success:function(data){//删除成功后，deleteMany会返回一个"ok";
	            if(data=="OK"){
	                alert("删除用户成功！");//返回ok后弹出一个对话框。
	                window.location.reload();
	            }else{
					 alert("删除用户失败！");
        			 window.location.reload();
				}
	        } 
	});
	      
	    }
	    else{
	        alert("请选择您要删除的用户!");//不勾选不提交，弹出警告框。
	        return false;
	    }
	}
</script>

</head>
<body onload="init()">
	<div class="wrapper">
		<div class="container-fluid">
			<article>
				<!-- 表单 -->
				<div class="container">
					<!-- 页面导航 -->
					<div class="page-header">
						<div class="page-title" style="padding-bottom: 5px">
							<ol class="breadcrumb">
								<li class="active" id="titleId">用户信息管理</li>
							</ol>
						</div>
					</div>
					<form class="form-inline" method="get" id="userFormHead"
						action="${pageContext.request.contextPath }/ttms/user_list.action">
						<!-- 查询表单 -->
						<div class="row page-search">
							<div class="col-md-12">
								<ul class="list-unstyled list-inline">
									<li><input type="text" id="username" value="${username }"
										name="username" class="form-control" placeholder="请输入用户信息"></li>
									<li class='O1'><button type="submit"
											class="btn btn-primary btn-search">查询用户</button></li>
									<li class='O2'><a href="#" class="btn btn-info btn-add"
										data-toggle="modal" data-target="#newUserDialog"
										onclick="clearUser()">新建用户</a></li>
									<li class='O3'><button type="button"
											class="btn btn-danger btn-delete"
											onclick="return todelectUser()">删除用户</button></li>
								</ul>
							</div>
						</div>
						<!-- 项目列表显示内容 -->
						<div class="row col-md-12">
							<table class="table table-bordered" id="tableDate">
								<thead>
									<tr>
										<th><input id="all" type="checkbox" />全选</th>
										<th>选择</th>
										<th>用户名</th>
										<th>邮箱</th>
										<th>手机号</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.rows}" var="row">
										<tr>
											<td><input type="checkbox" name="id" value="${row.id }" /></td>
											<td>${row.id}</td>
											<td>${row.username}</td>
											<td>${row.email}</td>
											<td>${row.mobile}</td>

											<c:if test="${row.valid==0 }">
												<td>禁用</td>
											</c:if>
											<c:if test="${row.valid==1 }">
												<td>启用</td>
											</c:if>

											<td><a href="#" class="btn btn-primary btn-xs"
												data-toggle="modal" data-target="#userEditDialog"
												onclick="editUser(${row.id})">修改</a> <a href="#"
												class="btn btn-danger btn-xs"
												onclick="deleteUser(${row.id})">删除</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-12 text-right">
								<itheima:page
									url="${pageContext.request.contextPath }/ttms/user_list.action" />
							</div>
						</div>
					</form>

				</div>
			</article>
		</div>
	</div>

	<!-- 修改用户模态框 -->
	<div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_user_form">
						<input type="hidden" id="edit_id" name="id" />
						<div class="form-group">
							<label for="edit_userName"
								style="float: left; padding: 7px 15px 0 27px;">用户名 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userName"
									placeholder="用户名称" name="username" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userEmail"
								style="float: left; padding: 7px 15px 0 27px;">邮&nbsp;&nbsp;&nbsp;箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userEmail"
									name="email" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userMobile"
								style="float: left; padding: 7px 15px 0 27px;">手机号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userMobile"
									name="mobile" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateUser()">保存修改</button>
				</div>
			</div>
		</div>
	</div>


	<!-- --------------------------植入 添加/修改/删除JS开始------------------------ -->
	<script type="text/javascript">
	// 通过id获取修改的用户信息
	function editUser(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>ttms/user_list/getUserById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#edit_id").val(data.id);
	            $("#edit_userName").val(data.username);
	            $("#edit_userEmail").val(data.email);
	            $("#edit_userMobile").val(data.mobile);
	        }
	    });
	}
    // 执行修改用户操作
	function updateUser() {
		$.post("<%=basePath%>ttms/user_list/updateUser.action",$("#edit_user_form").serialize(),function(data){
			if(data =="OK"){
				alert("用户信息更新成功！");
				window.location.reload();
			}else{
				alert("用户信息更新失败！");
				window.location.reload();
			}
		});
	}
    
	
	
		// 删除用户
		function deleteUser(id) {
		    if(confirm('确实要删除该用户吗?')) {
		$.post("<%=basePath%>ttms/user_list/delete.action",{"id":id},
		function(data){
		            if(data =="OK"){
		                alert("用户删除成功！");
		                window.location.reload();
		            }else{
		                alert("删除用户失败！");
		                window.location.reload();
		            }
		        });
		    }
		}
		 
	</script>
</body>
</html>