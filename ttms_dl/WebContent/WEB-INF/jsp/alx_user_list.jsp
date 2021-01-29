<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%@ include file="frame.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>爱旅行用户管理</title>

<script type="text/javascript">
function todelect(){
	    var Checkbox=false;//默认复选框为空
	     $("input[name='alx_uid']").each(function(){//获取复选框节点id
	      if (this.checked==true) {        
	        Checkbox=true;    //已勾选
	      }
	    });
	    if (Checkbox){//boolean值为true
	        var t=confirm("您确认要删除选中的内容吗？");//弹出对话进行警告
	        if (t==false) return false;    //不勾选不处理
	        obj = document.getElementsByName("alx_uid");//将复选框定义成一个jquery对象
	        check_val = [];//定义一个数组
	        for(k in obj){//k相当于i,往这个jquery对象添加勾选的id;
	            if(obj[k].checked)//选中的都放进 数组里
	                check_val.push(obj[k].value);
	        }
	   
	        $.ajax({//利用ajax发出请求
	            type:"POST",//post类型
	            url:"<%=basePath%>ttms/deleteCheck.action?ids="+check_val, //向Controller里的deleteSelect传输ids
	            success:function(data){//删除成功后，会返回一个"ok";
	            if(data=="OK"){
	                alert("删除爱旅行用户成功！");//返回ok后弹出一个对话框。
	                window.location.reload();
	            }else{
					 alert("删除爱旅行用户失败！");
        			 window.location.reload();
				}
	        	} 
			});
	   	}else{
	        alert("请选择您要删除的内容!");//不勾选不提交，弹出警告框。
	        return false;
	    }
	    
	    
	}
	/* 禁用 */
function toforbid(){
	    var Checkbox=false;//默认复选框为空
	     $("input[name='alx_uid']").each(function(){//获取复选框节点id
	      if (this.checked==true) {        
	        Checkbox=true;    //已勾选
	      }
	    });
	    if (Checkbox){//boolean值为true
	        var t=confirm("您确认要禁用该爱旅行用户吗？");//弹出对话进行警告
	        if (t==false) return false;    //不勾选不处理
	        obj = document.getElementsByName("alx_uid");//将复选框定义成一个jquery对象
	        check_val = [];//定义一个数组
	        for(k in obj){//k相当于i,往这个jquery对象添加勾选的id;
	            if(obj[k].checked)//选中的都放进 数组里
	                check_val.push(obj[k].value);
	        }
	   
	        $.ajax({//利用ajax发出请求
	            type:"POST",//post类型
	            url:"<%=basePath%>ttms/updateStateNo.action?ids="+check_val,
	            success:function(data){
	            if(data=="OK"){
	                alert("禁用爱旅行用户成功！");
	                window.location.reload();
	            }else{
					 alert("禁用爱旅行用户失败！");
        			 window.location.reload();
				}
	        	}
			});
	    }
	    else{
	        alert("请选择您要禁用的爱旅行用户!");//不勾选不提交，弹出警告框。
	        return false;
	    }
}
/* 启用 */
function tostart(){
	    var Checkbox=false;//默认复选框为空
	     $("input[name='alx_uid']").each(function(){//获取复选框节点id
	      if (this.checked==true) {        
	        Checkbox=true;    //已勾选
	      }
	    });
	    if (Checkbox){//boolean值为true
	        var t=confirm("您确认要启用该爱旅行用户吗？");//弹出对话进行警告
	        if (t==false) return false;    //不勾选不处理
	        obj = document.getElementsByName("alx_uid");//将复选框定义成一个jquery对象
	        check_val = [];//定义一个数组
	        for(k in obj){//k相当于i,往这个jquery对象添加勾选的id;
	            if(obj[k].checked)//选中的都放进 数组里
	                check_val.push(obj[k].value);
	        }
	   
	        $.ajax({//利用ajax发出请求
	            type:"POST",//post类型
	            url:"<%=basePath%>ttms/updateStateOk.action?ids="+check_val,
	            success:function(data){
	            if(data=="OK"){
	                alert("启用爱旅行用户成功！");
	                window.location.reload();
	            }else{
					 alert("启用爱旅行用户失败！");
        			 window.location.reload();
				}
	        	}
			});
	    }
	    else{
	        alert("请选择您要启用的爱旅行用户!");//不勾选不提交，弹出警告框。
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
								<li class="active" id="titleId">爱旅行用户信息管理</li>
							</ol>
						</div>
					</div>
					<form id="queryFormId"
						action="${pageContext.request.contextPath }/ttms/alxUserList.action">
						<!-- 查询表单 -->
						<div class="row page-search">
							<div class="col-md-12">
								<ul class="list-unstyled list-inline">
									<li><input type="text" id="alx_uname" value="${Alx_uname }"
										name="alx_uname" class="form-control" placeholder="爱旅行用户名称"></li>
									<li class='O1'><button type="submit"
											class="btn btn-primary btn-search">查询用户</button></li>
									<li class='O2'><a href="#" class="btn btn-info btn-add"
										data-toggle="modal" data-target="#newAlxUserDialog"
										onclick="clearAlxUser()">新建用户</a></li>
									<li class='O3'><button type="button"
											class="btn btn-danger btn-invalid"
											onclick="return toforbid()">禁用用户</button></li>
									<li class='O4'><button type="button"
											class="btn btn-success btn-valid" onclick="return tostart()">启用用户</button></li>
									<li class='O5'><button type="button"
											class="btn btn-danger btn-delete" onclick="return todelect()">删除用户</button></li>
								</ul>
							</div>
						</div>
						<!-- 用户列表显示内容 -->
						<div class="row col-md-12">
							<table id="tableDate" class="table table-bordered">
								<thead>
									<tr>
										<th><input id="all" type="checkbox" />全选</th>
										<th>用户编号</th>
										<th>用户名称</th>
										<th>用户密码</th>
										<th>用户性别</th>
										<th>用户年龄</th>
										<th>用户状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.rows}" var="row">
										<tr>
											<td><input type="checkbox" name="alx_uid" value="${row.alx_uid }" /></td>
											<td>${row.alx_uid}</td>
											<td>${row.alx_uname}</td>
											<td>${row.alx_upassword}</td>
											<c:if test="${row.alx_usex==0 }">
												<td>女</td>
											</c:if>
											<c:if test="${row.alx_usex==1 }">
												<td>男</td>
											</c:if>
											<td>${row.alx_age}</td>
											
											<c:if test="${row.alx_ustate==0 }">
												<td>禁用</td>
											</c:if>
											<c:if test="${row.alx_ustate==1 }">
												<td>启用</td>
											</c:if>
											<td>
												<a href="#" class="btn btn-primary btn-xs"
												data-toggle="modal" data-target="#alxUserEditDialog"
												onclick="editAlxUser(${row.alx_uid})">修改</a> 
												<a href="#" class="btn btn-danger btn-xs"
												onclick="deleteAlxUser(${row.alx_uid})">删除</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="col-md-12 text-right">
								<itheima:page
									url="${pageContext.request.contextPath }/ttms/alxUserList.action" />
							</div>
						</div>
					</form>
				</div>
			</article>
		</div>
	</div>

	<!-- 创建用户模态框 -->
	<div class="modal fade" id="newAlxUserDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_alxuser_form">
						<input type="hidden" id="alx_uid" name="alx_uid" />
						<div class="form-group">
							<label for="new_alx_uname" class="col-sm-2 control-label">
								用户名称 
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_alx_uname"
									placeholder="请输入用户名称" name="alx_uname" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_alx_upassword" class="col-sm-2 control-label">
								用户密码
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_alx_upassword"
									placeholder="请输入用户密码" name="alx_upassword" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">
								用户性别
							</label>
							<div class="col-sm-10">
								<label for="man">男</label> 
								<input name="alx_usex" id="man" type="radio" value="1" checked="checked" /> 
								<label for="woman">女</label> 
								<input name="alx_usex" id="woman" type="radio" value="0" /> 
							</div>
						</div>
						<div class="form-group">
							<label for="new_alx_age" class="col-sm-2 control-label">
								用户年龄
							</label>
							<div class="col-sm-10">
								<input type="number" value="20" pattern="^[0-9]{0,1}$" 
								class="form-control" id="new_alx_age" 
								placeholder="请输入用户名称" name="alx_age">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">
								用户状态
								
							</label>
							<div class="col-sm-10">
								<label for="open">启用</label> 
								<input name="alx_ustate" id="open" type="radio" value="1" checked="checked" /> 
								<label for="close">禁用</label> 
								<input name="alx_ustate" id="close" type="radio" value="0" /> 
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createAlxUser()">创建用户</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改用户模态框 -->
	<div class="modal fade" id="alxUserEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改爱旅行用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_alxuser_form">
						<input type="hidden" id="edit_alx_uid" name="alx_uid" />
						<div class="form-group">
							<label for="edit_alx_uname" class="col-sm-2 control-label">
								用户名称 
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_alx_uname"
									placeholder="请输入用户名称" name="alx_uname" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_alx_upassword" class="col-sm-2 control-label">
								用户密码
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_alx_upassword"
									placeholder="请输入用户密码" name="alx_upassword" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">
								用户性别
							</label>
							<div class="col-sm-10">
								<label for="edit_man">男</label> 
								<input name="alx_usex" id="edit_man" type="radio" value="1" checked="checked" /> 
								<label for="edit_woman">女</label> 
								<input name="alx_usex" id="edit_woman" type="radio" value="0" /> 
							</div>
						</div>
						<div class="form-group">
							<label for="edit_alx_age" class="col-sm-2 control-label">
								用户年龄
							</label>
							<div class="col-sm-10">
								<input type="number" value="20" pattern="^[0-9]{0,1}$" 
								class="form-control" id="edit_alx_age" 
								placeholder="请输入用户名称" name="alx_age">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">
								用户状态
							</label>
							<div class="col-sm-10">
								<label for="edit_open">启用</label> 
								<input  name="alx_ustate" id="edit_open" type="radio" value="1" checked="checked" /> 
								<label for="edit_close">禁用</label> 
								<input  name="alx_ustate" id="edit_close" type="radio" value="0" /> 
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateAlxUser()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	//清空新建爱旅行用户窗口中的数据
	function clearAlxUser() {
	    $("#new_alx_uname").val("");
	    $("#new_alx_upassword").val("")
	}
	// 创建爱旅行用户
	function createAlxUser() {
		$.post("<%=basePath%>ttms/createAlxUser.action",
		$("#new_alxuser_form").serialize(),function(data){
		        if(data =="OK"){
		            alert("爱旅行用户创建成功！");
		            window.location.reload();
		        }else{
		            alert("爱旅行用户创建失败！");
		            window.location.reload();
		        }
		    });
		}
	
	// 通过id获取修改的爱旅行用户信息
	function editAlxUser(alx_uid) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>ttms/getAlxUserById.action",
	        data:{"alx_uid":alx_uid},
	        success:function(data) {
	            $("#edit_alx_uid").val(data.alx_uid);
	            $("#edit_alx_uname").val(data.alx_uname);
	            $("#edit_alx_upassword").val(data.alx_upassword)
	            
	            if (data.alx_usex == 1) {
	            	$("#edit_man").prop("checked",true);
				} else{
					$("#edit_woman").prop("checked",true);
				}
	  	          
	            $("#edit_alx_age").val(data.alx_age);
	            
	            if(data.alx_ustate==1){
	            	$("#edit_open").prop("checked",true);
	            }else{
	            	$("#edit_close").prop("checked",true);
	             }
	        }
	    });
	}
    // 执行修改爱旅行用户操作
	function updateAlxUser() {
		$.post("<%=basePath%>ttms/updateAlxUser.action",$("#edit_alxuser_form").serialize(),function(data){
			if(data =="OK"){
				alert("爱旅行用户信息更新成功！");
				window.location.reload();
			}else{
				alert("爱旅行用户信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除爱旅行用户
	function deleteAlxUser(alx_uid) {
		if(confirm('确实要删除该用户吗?')) {
			$.post("<%=basePath%>ttms/deleteAlxUser.action",{"alx_uid":alx_uid},
			function(data){
		    	if(data =="OK"){
		        	alert("爱旅行用户删除成功！");
		            window.location.reload();
		        }else{
		            alert("删除爱旅行用户失败！");
		            window.location.reload();
		        }
		    });
		}
	}
	</script>
</body>
</html>
