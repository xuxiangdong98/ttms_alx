/* $(function(){
				/* 
					表格最佳浅蓝色#D9EDF7
					表格最佳浅绿色#DFF0D8	
					表格最佳浅黄色#FCF8E3
					表格最佳浅红色#F2DEDE
				 */
				/* //修改奇数行
				$("tr:odd").css("background","#FCF8E3");
				//修改偶数行除第一行外
				$("tr:even:gt(0)").css("background","#F2DEDE");
		 });
		  */
		 /* 隔行换色 */
			 function init(){
		     //1.获取表格
		     var tblEle = document.getElementById("tableDate");
		     //2.获取表格中tbody里面的行数(长度)
		     var len = tblEle.tBodies[0].rows.length;
		     //3.对tbody里面的行进行遍历
		     for(var i=0;i<len;i++){
		         if(i%4==0){
		             tblEle.tBodies[0].rows[i].style.backgroundColor="#D9EDF7";
		         }
		 		else if(i%5==1){
		             tblEle.tBodies[0].rows[i].style.backgroundColor="#DFF0D8";
		         }
		 		else if(i%5==2){
		 		    tblEle.tBodies[0].rows[i].style.backgroundColor="#FCF8E3";
		 		}
		 		else{
		 		    tblEle.tBodies[0].rows[i].style.backgroundColor="#F2DEDE";
		 		}
		     }
		 }
		 /* 选中变色 */
		 $(function() {
		 	var tb = $("#tableDate tr");
		 	var oldColor;
		 	for (var i = 1; i < tb.length; i++) {
		 		//alert(oldColor);
		 		$("#tableDate tr")[i].onmouseover = function() {
		 			oldColor = this.style.backgroundColor;
		 			this.style.backgroundColor = "yellow";
		 		}
		 		$("#tableDate tr")[i].onmouseout = function() {
		 			this.style.backgroundColor = oldColor;
		 		}
		 	}
		 });
		  //全选 
		 $(function(){
		 	$("#all").click(function(){
		 		$("input[type='checkbox']:gt(0)").prop("checked",this.checked);
		 	});
		 });
