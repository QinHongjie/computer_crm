$(function(){

	//全选复选框
	$(".check_all").find("input[type=checkbox]").click(function() {
	    if (this.checked) {  
			$("input[name='ids']").each(function() {
				//遍历所有的 checkbox
				$("tr").first().nextAll().addClass("info");      
				$(this).prop("checked", "checked");
			})
		} else {   
			//反之 取消全选 
			$("input[name='ids']").each(function() { 
				//遍历所有的 checkbox        
				$("tr").first().nextAll().removeClass("info");
				$(this).attr("checked", false);
			})
		}
	})
	
	// 每点击一次表格 都做判断 判断是否有选中的用户 多选删除按钮是否可用
	$("table").click(function(){
		var index = 0;
		$("input[name='ids']").each(function() {
			if($(this).is(":checked")){
				index++;
			}
		})
		if(index==0){
			$(".del_all").attr("disabled",true);
		}else{
			$(".del_all").attr("disabled",false);
		}
	})
	
	 //除了表头（第一行）以外所有的行添加click事件.
    $("tr").first().nextAll().click(function () {
        //判断td标记的背景颜色和body的背景颜色是否相同;
        if ($(this).find("input[type=checkbox]").is(':checked')) {
            $(this).removeClass("info");
            $(this).find("input[type=checkbox]").attr("checked", false);
        } else {
            $(this).addClass("info");
            $(this).find("input[type=checkbox]").prop("checked", "checked");
        }
    });
	
})
