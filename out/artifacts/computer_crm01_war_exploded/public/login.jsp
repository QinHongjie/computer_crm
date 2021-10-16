<%@ page pageEncoding="UTF-8" import="java.util.*" %>
<!-- 引入C标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>数码商城 | 登录</title>
	<jsp:include page="head.jsp"></jsp:include>
	<link href="<%=request.getContextPath() %>/static/css/login.css" rel="stylesheet">
	<script src="<%=request.getContextPath() %>/static/js/userinfoCheck.js"></script>
	<script src="<%=request.getContextPath() %>/static/js/login.js"></script>
  	<script src="<%=request.getContextPath() %>/static/js/three.min.js"></script>
</head>
<body>
	<script>
	 	/**
	 	*刷新验证码
	 	*/
	 	function reCodeImg(){  
	    	$(".codeImg").attr("src","<%=request.getContextPath() %>/GetCodeServlet?r="+Math.random());
		}
 	</script>
	<!-- 	-	-	-	-	-	main body begin 	-	-	-	-	-	-->
	<div id="main" class="container">
		<!-- 标题logo -->
		<div class="form-signin-heading text-center">
			<a href="<%=request.getContextPath()%>/index.action">
				<img src="<%=request.getContextPath() %>/static/img/login_log.png" />
			</a>
			<div><font color="red"><c:out value="${message}"></c:out></font></div>
		</div>
		<!-- 登录块 -->
		<form action="<%=request.getContextPath() %>/LoginServlet.do" method="post" id="form-login" class="form-signin">
			<!-- 用户名输入区 -->
			<input name="username" type="text" id="loginInputName" class="form-control input" placeholder="用户名" maxlength="8" required autofocus>
			<label for="loginName" class="alert alert-danger">验证用户名错误提示信息</label>
			<!-- 密码输入区 -->
			<input name="password" type="password" id="loginInputPassword" class="form-control input" placeholder="密码" maxlength="20" required>
			<label for="loginPass" class="alert alert-danger">验证密码错误提示信息</label>
			<!-- 验证码输入区 -->
			<div id="check_code" class="input">
			    <div class="input-group">
					<input name="checkCode" type="text" class="form-control" placeholder="输入验证码" maxlength="4" autocomplete="off">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button" onclick="reCodeImg()">
							<img class="codeImg" src="<%=request.getContextPath() %>/GetCodeServlet" alt="点击刷新" />
						</button>
					</span>
			    </div><!-- /input-group -->
			</div><!-- check_code -->
			<div class="checkbox">
				<label>
					<input class="check" type="checkbox" value="remember-me"> 记住我（请在私人设备上使用此功能）
				</label>
			</div>
			<button class="btn btn-lg btn-block submit" type="submit">登录</button>
			<button class="btn btn-lg btn-block" type="button" id="changeRegister">注册</button>
			<img class="loading" src="<%=request.getContextPath() %>/static/img/loading.gif" />
			<div class="dsf">
				第三方账号登录：
				<a href="#">
					<img src="<%=request.getContextPath() %>/static/img/qq_icon.png" />
				</a>
			</div>
			<div class="pull-right wjmm">忘记密码？点这里找回</div>
		</form>
		
		<!-- 注册块 -->
		<form action="<%=request.getContextPath() %>/RegisterServlet.do" method="post" id="form-register" class="form-signin" onsubmit="return false">
			<!-- 用户名输入区 -->
			<input name="username" type="text" id="inputRegisterName" class="form-control input" placeholder="昵称(1~8位中文或英文字符)" maxlength="8" required autofocus />
			<label for="name" class="alert alert-danger">验证用户名错误提示信息</label>
			<!-- 电话号码输入区 -->
			<input name="telephone" type="tel" id="inputTel" class="form-control input" placeholder="电话号码(为1 3/4/5/7/8 开头的11位数字)" required>
			<label for="tel" class="alert alert-danger">验证电话错误提示信息</label>
			<!-- 密码输入区 -->
			<input name="password" type="password" id="inputPass1" class="form-control input" placeholder="密码(6-20位字母、数字、下划线)" maxlength="20" required>
			<label for="pass" class="alert alert-danger">验证密码错误提示信息</label>
			<!-- 再次输入密码区 -->
			<input type="password" id="inputPass2" class="form-control input" placeholder="确认密码" required>
			<label for="isPass" class="alert alert-danger">验证确认密码错误提示信息</label>
			<!-- 同意协议复选框 -->
			<div class="checkbox">
				<label>
					<input class="check" type="checkbox" value="remember-me"> 我同意《用户手册》和《保密条款》
				</label>
				<label for="checkbox" class="alert alert-danger" role="alert">请同意《用户手册》和《保密条款》!</label>
			</div>
			<button class="btn btn-lg btn-block submit" type="button" id="register">注册</button>
			<button class="btn btn-lg btn-block" type="button" id="changeLogin">已有账号？点我登录</button>
			<img class="loading" src="<%=request.getContextPath() %>/static/img/loading.gif" />
			<div class="dsf">
				第三方账号登录：
				<a href="#">
					<img src="<%=request.getContextPath() %>/static/img/qq_icon.png" />
				</a>
			</div>
		</form>
		
	</div> <!-- /container -->
	
	<script>
		// 点击登录页中的注册按钮
		$("#changeRegister").click(function(){
			location.href="<%=request.getContextPath()%>/public/login.jsp?"+"active="+encodeURI(1);
		});
	</script>
	<!-- 	-	-	-	-	-	main body end 	-	-	-	-	-	-->
</body>
</html>