<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 引入页面框架jsp文件 -->
<%@ include file="frame.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- 导入echart图表的核心依赖库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
<title>景点收藏量统计</title>
</head>
<body>
	<div class="container-fluid">
		<article>
			<div class="container">
				<div id="chartmain" style="margin: 0px auto; width: 80%;height:570px; background-color: #F0F8FF;"></div>
			</div>
		</article>
	</div>
</body>
<script type="text/javascript">
    //初始化echarts
    function chushihua(myChart){
        var option = {
        		title: {
    				text: '爱旅行景点收藏量统计图',
    				subtext: '未加载成功数据',
    				x: 'center'
    			},           
            series:[{
                name:'景点收藏量',
                type:'pie', 
                radius:'90%', 
                data:[
                    {value:0,name:'无'},
                ]
            }]
        };

        myChart.setOption(option);   
    }

    //从数据库读取数据赋值给echarts
    function fuzhi(myChart){
        $.ajax({
            contentType : "application/json",
            type : "GET",
            url : "<%=basePath%>ttms/statistics_ScenicCollect.action",
            dataType : "json",
            success : function(data) {
                //创建一个数组，用来装对象传给series.data，因为series.data里面不能直接鞋for循环
                var servicedata=[];
                var servicedata2=[];

                for(var i=0;i<data.length;i++){
                    var obj=new Object();
                    obj.name=data[i].name; 
                    obj.value=data[i].value;
                    servicedata[i]=obj;
                }
          		console.log(servicedata);
                for(var j=0;j<data.length;j++){
                    var obj=new Object();
                    obj.name=data[j].name; 
                    servicedata2[j]=obj;
                }
                console.log(servicedata2);
                myChart.setOption({
                	title: {
        				text: '爱旅行景点收藏量统计图',
        				subtext: '动态数据',
        				x: 'center'
        			},  
        			tooltip: {
        				trigger: 'item',
        				formatter: "{a} <br/>{b} : {c} ({d}%)"
        			},
        			/* 颜色和选项的对应关系 */
        			legend: {
        				orient: 'vertical',
        				left: 'left',
        				data:servicedata2,
        			},
                    series:[{
                        name:'景点收藏量',
                        type:'pie', 
                        radius:'60%', 
                        data:servicedata,
                    }]

                });

            }
        });
    }
    //初始化echarts实例
    var myChart = echarts.init(document.getElementById('chartmain'));
    chushihua(myChart);
    fuzhi(myChart);    

</script>
</html>