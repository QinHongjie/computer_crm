$(function(){
	
	
	//导航栏搜索框 边框样式
	$("#form_search").focus(function(){
		$("#searchform").css("border","1px solid #00eff2");
		$("#form_search").blur(function(){
			$("#searchform").css("border","1px solid rgba(55,55,55,1)");
		});
	});
	
	// 鼠标点击导航栏扩展图标时 左侧导航栏显示
	$("#but-navbar").click(function(){
		$("#navbar-left").css("left","0");
		$("#blackM").css("display","block");
	});
	// 鼠标点击左侧导航栏以外(黑幕)时 隐藏左侧导航栏
	$("#blackM").click(function(){
		$("#navbar-left").css("left","-250px");
		$("#blackM").css("display","none");
	});
	
	// 监听窗口滚动条
	$(window).scroll(function(){
		// 页面滚动到导航栏下面时 抽离导航栏中文字和搜索框 使其固定在顶部显示
		var sTop = $(window).scrollTop();
		if(sTop >= 155){
			$("#navbar").css("position","fixed");
		}else{
			$("#navbar").css("position","static");
		}
		
		if(sTop >=600){
			$("#toTop").css("display","block");
		}else{
			$("#toTop").css("display","none");
		}
	});
	
	// 顶部导航条右侧 用户栏(登录/注册)
	$(".dropdown-toggle").click(function(){//事件对象 兼容
		$(".dropdown-menu").show();
	});
	$(document).bind("click",function(e){
		var e = e || window.event;	//事件对象，兼容ie
		var target = e.target||e.srcElement;	//源对象，兼容火狐和ie
		while(target){//循环遍历至根节点 防止点击的是下拉菜单本身
			if(target.id=="dropdown"){
				return;
			}
			target=target.parentNode;
		}
		$(".dropdown-menu").hide();
	});

	
	
});

function getScQuantity(){
	//同步请求
	$.ajax({
		type : "POST",
		async : false,
		dataType : "json",
		url : "GetScQuantity",
		success : function(data) {
			//获取数据
			scQuantity = data["scQuantity"];
		}
	});
	return scQuantity;
}
