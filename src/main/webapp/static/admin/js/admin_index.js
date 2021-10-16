$(function(){
	// 点击子菜单 清除其他active 并且指定当前菜单项为active
	$(".nav-sidebar .nav li").click(function(){
		$(".nav-sidebar .nav li.active").removeClass("active");
		$(this).addClass("active");
	})

	// 点击菜单栏添加左边框效果 并且清除active类效果
	$(".nav-sidebar > .pull-down-li a").click(function(){
		$(".nav-sidebar > .pull-down-li a").each(function(){
			$(this).removeClass("active");
		})
		$(this).addClass("active")
		$(".nav-sidebar .nav .active").removeClass("active");
	})
	
	$(".panel-collapse.collapse .nav li").click(function(){
		var text = $(this).text();
		var href = $(this).find("a").attr("href");
		var index=0;
		$(".addend .addp").each(function(){
			if($(this).text()==text){
				index++;
			}
		})
		if(index==0){
			$(".addend").append("<p class='navbar-text addp'>"
								+"<a style='color:white' href='"+href+"' target='iframe'>"
								+text
								+"</a>"
								+"<span class='glyphicon glyphicon-remove remove_li'></span>"
								+"</p>");
		}
		click_remove();
	})
	function click_remove(){
		$(".remove_li").click(function(){
			$(this).parent("p").remove();
		})
	}
	
})