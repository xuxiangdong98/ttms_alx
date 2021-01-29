<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 引入页面框架jsp文件 -->
<%@ include file="frame.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- 导入echart图表的核心依赖库 -->
<title>爱旅行用户访问量统计</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<article>
			<div class="container">
				<span id="alxUser_count"></span>
				<div id="container"
					style="margin: 0px auto; width: 80%; height: 570px; background-color: #F0F8FF;">
					<div style="border: 1px solid red; width: 100%">总用户量：</div>
				</div>
			</div>
		</article>
	</div>
</body>
<script type="text/javascript">
	var container = document.getElementById('container');
	// 初始化加载对象myContainer
	var myContainer = echarts.init(container);
	//未获取数据前，显示loading加载动画
	myContainer.showLoading();

	function bindData() {
		//为了效果明显，我们做了延迟读取数据
		setTimeout(function() {
			//异步加载数据,get请求我们刚刚准备的json文件,正式开发中调用相应的接口
			$.get('<%=basePath%>ttms/statistics_alxUserVisit.action', function(res) {
				console.log(res)
				var servicedata2=[];
				console.log(res[0].today);
				console.log(res[0].history);
                servicedata2[0] = res[0].today; 
                servicedata2[1] = res[0].history; 
                
				
				//获取数据后，隐藏loading动画
				myContainer.hideLoading();
				myContainer.setOption(option = {
					//定义一个标题
					color : [ '#3398DB' ],
					tooltip : {
						trigger : 'axis',
						axisPointer : { // 坐标轴指示器，坐标轴触发有效
							type : 'cross' // 默认为直线，可选为：'line' | 'shadow'
						}
					},
					title : {
						text : '日访问量统计'
					},
					// xAxis代表x轴的数据
					xAxis : {
						 data:['今日访问量','总访问量']
					// 字段对应从json里面的字段
					},
					// yAxis代表y轴的数据,不写会自动适应数据
					yAxis : {},
					// series代表鼠标悬浮到图标上时提示的对应信息
					series : [ {
						name : '访问量',
						type : 'bar',
						 data: servicedata2,
						// 字段对应从json里面的字段
						barWidth : '40%',
						showBackground : true,
						backgroundStyle : {
							color : 'rgba(220, 220, 220, 0.8)'
						}
					} ]
				});
			})
		}, 1000)
	}
	bindData();
</script>
</html>