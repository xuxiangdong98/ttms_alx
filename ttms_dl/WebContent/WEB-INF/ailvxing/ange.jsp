<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 引入页面框架jsp文件 -->
<%@ include file="alx_framework.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>客栈</title>
</head>
<body>    
 <!-- 主体 -->
    <div id="content">
    	<a onclick="one()">征召一次</a>
    	<a onclick="ten()">征召十次</a>
    	<br>
    	<div>
    	<h3 id="herolist"></h3><br>
    	</div>
    </div>
</body>
<script type="text/javascript">
function one(){
	$.ajax({
		type:"get",
		url:"<%=basePath%>Randomone.action",
		success:function(data){
			console.log(data);
			  $("#herolist").append(data);
		}
		
	});
}
function ten(){
	$.ajax({
		type:"get",
		url:"<%=basePath%>Randomten.action",
		success:function(data){
			console.log(data);
	            for(var i = 0;i < data.length;i++){
	                $("#herolist").append(data[i]+"<br>");
	            }
		}
	});
}
</script>
</html>