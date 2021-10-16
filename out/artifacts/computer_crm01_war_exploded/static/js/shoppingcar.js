$(function(){
	
	//全选复选框
	$("#check_all").click(function() {
	    if (this.checked) {  
			$("input[name='ids']").each(function() { 
				//遍历所有的 checkbox        
				$(this).prop("checked", "checked");      
			})    
		} else {   
			//反之 取消全选 
			$("input[name='ids']").each(function() { 
				//遍历所有的 checkbox        
				$(this).attr("checked", false);
			})
		}
	})
	
	//“删除商品”提交
	$("#form_del button[type='submit']").click(function(){
		var flag=0;
		//遍历商品复选框
		$("input[name='ids']").each(function() { 
			if(this.checked)flag++;
		})
		if(flag!=0){
			$("#form_del").attr("onsubmit","return true");
			$("#form_del").submit();
		}
	})
	
})