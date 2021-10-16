<%@ page pageEncoding="utf-8" import="java.util.*" %>
<!-- 引入C标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>数码商场 | 后台登录</title>
	<jsp:include page="head.jsp"></jsp:include>
	<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
</head>
<body>
	<c:if test="${ADMIN_SESSTION != null }">
		<script>location.href="admin_index.action";</script>
	</c:if>

	<div class="container">
		<form class="form-signin" action="login.admin" method="post">
			<h2 class="form-signin-heading">数码商场管理后台</h2>
			<!-- 管理员名输入区 -->
			<label for="inputEmail" class="sr-only">User name</label>
			<input name="adminName" type="text" id="inputEmail" class="form-control" placeholder="管理员" required autofocus />
			<!-- 密码输入区 -->
			<label for="inputPassword" class="sr-only">Password</label>
			<input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required />
			<div class="checkbox">
				<label>
					<input type="checkbox" value="remember-me"> Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block submit" type="submit">登录</button>
			<font color="red">${msg }</font>
		</form>
	</div>
  
	<script>
		
	</script>

</body>
</html>