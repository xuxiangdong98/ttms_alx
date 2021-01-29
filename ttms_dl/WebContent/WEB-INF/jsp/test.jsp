<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="frame.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>英雄列表</title>
<style type="text/css">
.clearfloat {
	clear: both;
	zoom: 1;
	position: absolute;
	bottom: 25px;
}
</style>

</head>
<body>
	<div class="container">
		<div style="text-align: left;">
			<!-- <a href="#" id="add" class="btn btn-info" onclick="pagecounter()">点我计数</a> -->
			<span id="today" style="color: deepskyblue; font-size: 20px;"></span>
			<span id="history" style="color: deepskyblue; font-size: 20px;"></span>
		</div>
		<!-- 项目列表显示内容 -->
		<div style="text-align: right;">
			<a href="#" class="btn btn-info" data-toggle="modal"
				data-target="#addChampionDetailDialog" onclick="clearChampion()">发布英雄</a>
		</div>
		<div class="row">
			<c:forEach items="${heros}" var="row">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail" style="height: 250px;">
						<img src="http://localhost:8080/data/file/${row.champion_icon}"
							width="120px" height="120px" alt="加载失败" style="float: left;">
						<div class="caption">
							<h3>英雄名称:${row.champion_name}</h3>
							<p>
								<strong>英雄介绍:</strong> ${row.champion_info}
							</p>
							<p>
								<strong>创建时间:</strong> ${row.create_time}
							</p>
							<div class="clearfloat">
								<p>
									<a href="#" class="btn btn-primary" data-toggle="modal"
										data-target="#">购买</a> <a href="#" class="btn btn-primary"
										data-toggle="modal" data-target="#championDetailDialog"
										onclick="editChampion(${row.champion_id})">详情</a> <a href="#"
										class="btn btn-primary btn-xs" data-toggle="modal"
										data-target="#">修改</a> <a href="#"
										class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#">删除</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<br> <br> <br>
	</div>
	<!-- 英雄详情模态框 -->
	<div class="modal fade" id="championDetailDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">英雄详细信息</h4>
				</div>
				<div class="modal-body">
					<div class="form-horizontal" id="edit_champion">
						<input type="hidden" id="edit_champion_id" name="champion_id" />
						<div class="thumbnail">
							<img id="edit_champion_icon" width="120px" height="120px"
								alt="加载失败">
							<div class="caption">
								<p style="font-size: 22px; color: dodgerblue;">
									<strong>英雄名称:</strong><span id="edit_champion_name"></span>
								</p>
								<p style="font-size: 22px; color: deepskyblue">
									<strong>英雄绰号:</strong><span id="edit_champion_title"></span>
								</p>
								<p style="font-size: 22px; color: skyblue;">
									<strong>英雄介绍:</strong><span id="edit_champion_info"></span>
								</p>
								<p style="font-size: 22px; color: cyan;">
									<strong>英雄技巧:</strong><span id="edit_champion_tags"></span>
								</p>
								<p style="font-size: 22px; color: cyan;">
									<strong>创建时间:</strong><span id="edit_create_time"></span>
								</p>

							</div>
							<div>
								<p>
									<a href="#" class="btn btn-danger" data-toggle="modal"
										data-target="#">购买</a> <a href="#"
										class="btn btn-primary btn-xs" data-toggle="modal"
										data-target="#">返回</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加英雄 -->
	<div class="modal fade" id="addChampionDetailDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">发布新英雄</h4>
				</div>
				<div class="modal-body">
					<form method="post" class="form-horizontal" id="new_champion_form"
						enctype="multipart/form-data">

						<div class="form-group">
							<label for="addname" class="col-sm-2 control-label"> 上传用户
							</label>
							<div class="col-sm-10">
								<input id="addname" type="text" name="addname">
							</div>
						</div>

						<div class="form-group">
							<label for="file" class="col-sm-2 control-label"> 英雄图片 </label>
							<div class="col-sm-10">
								<input type="file" id="file" name="uploadfile">
							</div>
						</div>
						<div class="form-group">
							<label for="new_champion_name" class="col-sm-2 control-label">
								英雄名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_champion_name"
									placeholder="请输入英雄名称" name="champion_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_champion_title" class="col-sm-2 control-label">
								英雄绰号 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_champion_title"
									placeholder="请输入英雄绰号" name="champion_title" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_champion_info" class="col-sm-2 control-label">
								英雄介绍 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_champion_info"
									placeholder="请输入英雄介绍" name="champion_info" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_champion_tags" class="col-sm-2 control-label">
								英雄技巧 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_champion_tags"
									placeholder="请输入英雄技巧" name="champion_tags" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_create_time"
								style="float: left; padding: 7px 15px 0 27px;">创建时间</label>
							<div class="col-sm-10">
								<input type="Date" class="form-control" min="1970-01-01"
									max="2099-12-31" id="new_create_time" name="create_time" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createChampion()">发布英雄</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
//查询详情
function editChampion(champion_id) {
    $.ajax({
        type:"get",
        url:"<%=basePath%>ttms/getHeroById.action",
        data:{"champion_id":champion_id},//注意这里的传过去的键值对要对应上
        success:function(data) {
        	console.log(data);
            $("#edit_champion_id").val(data.champion_id);
            $("#edit_champion_icon").attr('src','http://localhost:8080/data/file/'+data.champion_icon)
            $("#edit_champion_name").text(data.champion_name)
            $("#edit_champion_title").text(data.champion_title)
            $("#edit_champion_info").text(data.champion_info).attr('style','font-size:18px')
            $("#edit_champion_tags").text(data.champion_tags).attr('style','font-size:18px')
            $("#edit_create_time").text(new Date(data.create_time).toLocaleDateString());
/*             $("#edit_create_time").text(data.create_time);  */
        }
    });
}
<%-- $(function(){ 
	　　$("#add").click(function(){ 
	　　$.ajax({
		type:"get",
		url:"<%=basePath%>/addCounter.action",
		success:function(data){
			if(data != null){
				$("#today").text('今日点击量：'+data.today);
				$("#history").text('总点击量：'+data.history);
				//alert("加一成功！")
			}else{
				alert("加一失败！")
			}
			
		}
		});
	}); 
});  --%>
<%-- //点击加一备份
function pagecounter(){
	$.ajax({
		type:"get",
		url:"<%=basePath%>/addCounter.action",
		success:function(data){
			if(data != null){
				$("#today").text('今日点击量：'+data.today);
				$("#history").text('总点击量：'+data.history);
				//alert("加一成功！")
			}else{
				alert("加一失败！")
			}
			
		}
	});
} --%>

<%-- //页面访问计数器
$(document).ready(function(){
	$.ajax({
		type:"get",
		url:"<%=basePath%>/addCounter.action",
		success:function(data){
			if(data != null){
				$("#today").text('今日访问量：'+data.today);
				$("#history").text('总访问量：'+data.history);
				//alert("加一成功！")
			}else{
				alert("加一失败！")
			}
			
		}
	});
}); --%>

//清空发布英雄窗口中的数据
function clearChampion() {
    $("#new_champion_name").val("");
    $("#new_champion_title").val("")
    $("#new_champion_info").val("")
    $("#new_champion_tags").val("");
    $("#new_create_time").val("");
}
// 创建英雄
function createChampion() {
	var addname = document.getElementById("addname").value;
	var file = document.getElementById("file").value;
	if(addname==""){
		alert("填写上传人");
		return false;
	}
	if(file.length==0||file==""){
		alert("请选择要上传的文件");
		return false;
	}
	
	var formData = new FormData($( "#new_champion_form" )[0]);  
    $.ajax({
        type:"POST",
        url: "<%=basePath%>ttms/createHero.action",
        data: formData,  
        async: false,  
        cache: false,  
        contentType: false,  
        processData: false,  
        success: function(data){
	        if(data =="OK"){
	            alert("英雄发布成功！");
	            window.location.reload();
	        }else{
	            alert("英雄发布失败！");
	            window.location.reload();
	        }
	    }
       
    });      
};
/*//formDate使用模板
function doUpload() {  
    var formData = new FormData($( "#uploadForm" )[0]);  
    $.ajax({  
         url: '' ,  
         type: 'POST',  
         data: formData,  
         async: false,  
         cache: false,  
         contentType: false,  
         processData: false,  
         success: function (returndata) {  
             alert(returndata);  
         },  
         error: function (returndata) {  
             alert(returndata);  
         }  
    });  
}   */
</script>

</html>