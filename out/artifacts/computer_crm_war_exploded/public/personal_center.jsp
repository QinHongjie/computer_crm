<%@ page pageEncoding="utf-8" import="java.util.*" %>
<!-- 引入C标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>数码商城 | 个人中心</title>
	<jsp:include page="head.jsp"></jsp:include>
	<link href="${pageContext.request.contextPath}/css/path_nav.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/userinfoCheck.js"></script>
	<script src="${pageContext.request.contextPath}/js/alterUserInfo.js"></script>
	<style>
		#per_center div{
			background: white;
		}
		#per_center>div>div{
			padding: 20px 0;
		}
		#per_center #head_photo img{
			border-radius: 50%;
			width: 300px;
			height: 300px;
		}
		#per_center input[type=file] {
		    display: inline-block;
		}
		
		form input,
		form button{
			margin-bottom: 20px;
		}
		form .submit{
			background: #00EFF2;
		}
		#pass_form{
			display: none;
		}
		
		#per_center .alert{
			padding: 0 10px;
			display: none;
		}
		
		img.loading{
			display:none;
		}
	</style>
</head>
<body>
	<!-- 	-	-	-	引入页头	-	-	-	-->
	<jsp:include page="header.jsp"></jsp:include>
	
	<!--	-	-	-	-	-	main page begin	-	-	-	-	-	-->
	<!-- 路径导航栏 -->
	<div class="path-nav">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="index.action">首页</a></li>
				<li class="active">个人中心</li>
			</ol>
		</div>
	</div>
	
	<!--	-	-	-	个人信息模块	-	-	-	-->
	<div id="per_center">
		<div class="container">
			<div id="head_photo" class="col-md-5 col-sm-12 text-center">
				<img id="showImg" src="${pageContext.request.contextPath }/img/head_pho.jpg" />
				<p>修改头像：<input class="upload-file-img" type="file" name="file" id="personsFile" onchange="uploadImg()" /></p>
				<p><a href="javascript:;" class="alter_per">修改基本信息</a></p>
				<p><a href="javascript:;" class="alter_pass">修改密码</a></p>
			</div>
			<div class="col-md-7 col-sm-12">
				<!-- 修改个人信息表单域 -->
				<form id="per_form" class="form-signin" action="${pageContext.request.contextPath }/user_alter_info.do" method="post" onsubmit="return false">
					<!-- 用户名输入区 -->
					<label>用户名：</label>
					<input name="alterName" type="text" id="inputAlterName" class="form-control input" value="${USER_SESSION.userName }" placeholder="昵称(1~8位中文或英文字符)" maxlength="8" required />
					<label for="name" class="alert alert-danger">验证用户名错误提示信息</label>
					<!-- 电话号码输入区 -->
					<label>电话号码：</label>
					<input name="alterTel" type="tel" id="inputTel" class="form-control input" value="${USER_SESSION.telephone }" placeholder="电话号码" required>
					<label for="tel" class="alert alert-danger">验证用户名错误提示信息</label>
					<!-- 收货地址输入区 -->
					<label><font color="red">*</font>收货地址：</label>
					<input name="alterAddress" type="address" id="inputAddress" class="form-control input" value="${USER_SESSION.address }" placeholder="收货地址" required>
					<label for="address" class="alert alert-danger">验证收货地址提示信息</label>
					<!-- 提交、重置按钮 -->
					<button class="btn btn-lg btn-block submit" type="submit" id="register">确认修改</button>
					<button class="btn btn-lg btn-block" type="reset">重置</button>
				</form>
				
				<!-- 修改密码文本域 -->
				<form id="pass_form" class="form-signin" action="${pageContext.request.contextPath }/user_alter_pass.do" method="post" onsubmit="return false">
					<!-- 原密码输入区 -->
					<label>原密码：</label>
					<input type="password" id="inputPass" class="form-control input" placeholder="原密码" required>
					<label for="oldPass" class="alert alert-danger">验证原密码提示信息</label>
					<!-- 新密码输入区 -->
					<label>新密码：</label>
					<input type="password" id="inputPass1" class="form-control input" placeholder="(6-20位字母、数字、下划线)" required>
					<label for="pass" class="alert alert-danger">验证新密码提示信息</label>
					<!-- 确认密码输入区 -->
					<label>确认密码：</label>
					<input name="newPass" type="password" id="inputPass2" class="form-control input" placeholder="确认密码" required>
					<label for="isPass" class="alert alert-danger">确认密码验证提示信息</label>
					<!-- 提交按钮 -->
					<button class="btn btn-lg btn-block submit" type="submit">确认修改</button>
					<img class="loading" src="${pageContext.request.contextPath }/img/loading.gif" width="24px" />
				</form>
			</div>
		</div>
	</div>
	<script>
		// 点击显示修改个人信息模块
		$(".alter_per").click(function(){
			$("#pass_form").hide();
			$("#per_form").show();
		})
		// 点击显示修改密码模块
		$(".alter_pass").click(function(){
			$("#per_form").hide();
			$("#pass_form").show();
		})
		// 修改头像
		function uploadImg() {
		    var _name, _fileName, personsFile;
		    personsFile = document.getElementById("personsFile");
		    _name = personsFile.value;
		    _fileName = _name.substring(_name.lastIndexOf(".") + 1).toLowerCase();
		    if (_fileName !== "png" && _fileName !== "jpg") {
		        alert("上传图片格式不正确，请重新上传");
		    } else {
		        $("#showImg").attr("src", window.URL.createObjectURL(personsFile.files[0]));
		    }
		}
	</script>
	<!--	-	-	-	-	-	main page end	-	-	-	-	-	-->
	
	<!-- 引入页脚 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>