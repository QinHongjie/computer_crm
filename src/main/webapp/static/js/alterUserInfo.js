$(function(){
	
	//修改用户信息验证
	// 验证用户名
	$("#inputAlterName").on("input propertychange", ckeckAlterName);
	
	// 验证电话号码
	$("#inputTel").on("input propertychange", checkTel);
	
	// 验证地址
	$("#inputAddress").on("input propertychange", checkAddress);
	
	$("#per_form button.submit").click(function(){
		if(ckeckAlterName() && checkTel() && checkAddress()){
			$("#per_form").attr("onsubmit","return true");
			$("#per_form").submit();
		}
	})
	// 重置后隐藏错误提示信息
	$("#per_form button[type=reset]").click(function(){
		$(".alert").hide();
	})
	
	
	var sleep = 700;//加载时间
	// 点击提交按钮时 显示加载动画
	$(".form-signin button.submit").click(function(){
		$(".loading").show();
		setTimeout(function(){
			$(".loading").hide();
		},sleep);
	});
	// 修改密码验证
	// 验证原密码
	$("#inputPass").on("input propertychange", checkOldPass);
	
	// 验证新密码
	$("#inputPass1").on("input propertychange", checkPass);
	
	// 确认密码验证
	$("#inputPass2").on("input propertychange", checkBothPassRight);
	
	$("#pass_form button.submit").click(function(){
		setTimeout(function(){
			if(checkOldPass() && checkPass() && checkBothPassRight()){
				$("#pass_form").attr("onsubmit","return true");
				$("#pass_form").submit();
			}
		}, sleep);
	})
	
})