<%@ page pageEncoding="utf-8" import="java.util.*" %>
<!-- 引入C标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>数码商城 | 管理后台</title>
	<jsp:include page="head.jsp"></jsp:include>

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/static/admin/css/dashboard.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/static/admin/js/iframeAutoHeight.js"></script>
    <script src="${pageContext.request.contextPath }/static/admin/js/admin_index.js"></script>

</head>
<body>
	<c:if test="${adminName eq null }">
		<script>
			alert("登录超时，请重新登录！");
			location.href = "login.jsp";
		</script>
	</c:if>
	
	<!-- 	-	-	-	顶部固定横向导航条	-	-	-	 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand text-center" href="javascript:;"><font size="5" color="#fff">数码商城 后台</font></a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
 						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								 ${adminName }<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="javascript:;">个人配置</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="${pageContext.request.contextPath }/AdminLogoutServlet">注销登录</a></li>
							</ul>
						</li>
					</ul>
					<form class="navbar-form navbar-right">
						<input type="text" class="form-control" placeholder="Search...">
					</form>
					<p class="navbar-text navbar-right"><a href="javascript:;" class="navbar-link">在线用户: ${onlineCount }</a></p>
					<!-- 动态添加内容区域 -->
					<div class="nav navbar-nav navbar-right col-md-5 col-lg-7">
						<ul class="nav navbar-nav addend"></ul>
					</div>
				</div>
			</div>
		</div>
    </nav>
	
	<div class="container-fluid">
		<div class="row">
			<!-- 	-	-	-	左侧竖导航标签栏	-	-	-	 -->
			<div class="col-sm-3 col-md-2 sidebar" id="accordion">
				<!-- 登录管理员信息模块 -->
				<div class="nav nav-sidebar text-admin">
					<div class="col-sm-5 col-md-5">
						<img class="img-circle" src="${pageContext.request.contextPath }/static/img/head_photo.jpg" width="70px"/>
					</div>
					<div class="col-sm-7 col-md-7">
						<h3>${adminName }</h3>
						<p class="status"><i class="i-circle"></i><span>在线</span></p>
					</div>
				</div>
				
				<!-- 	-	-	-	管理导航模块	-	-	-	 -->
				<ul class="nav nav-sidebar panel">
					<li class="pull-down-li">
						<a role="button" href="welcome.admin" target="iframe">
							控制台
							<span class="glyphicon glyphicon-hdd pull-right"></span>
						</a>
					</li>
				</ul>
				<!-- 	-	用户管理	-	 -->
				<ul class="nav nav-sidebar panel">
					<li class="pull-down-li">
						<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapseOne">
							用户管理
							<span class="glyphicon glyphicon-menu-hamburger pull-right"></span>
						</a>
					</li>
					<div id="collapse1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
						<ul class="nav">
							<li><a href="user_list.admin" target="iframe">
								<span class="glyphicon glyphicon-menu-right"></span>
								&nbsp;用户信息管理
							</a></li>
							<li><a href="user_right.admin" target="iframe">
								<span class="glyphicon glyphicon-menu-right"></span>
								&nbsp;用户权限管理
							</a></li>
						</ul>
					</div>
				</ul>
		    	<!-- 	-	商品管理	-	 -->
		    	<ul class="nav nav-sidebar panel">
					<li class="pull-down-li">
						<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="true" aria-controls="collapseOne">
						商品管理<span class="glyphicon glyphicon-menu-hamburger pull-right"></span>
						</a>
					</li>
					<div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
						<ul class="nav">
							<li><a href="product_list.admin" target="iframe">
								<span class="glyphicon glyphicon-menu-right"></span>
								&nbsp;商品信息管理
							</a></li>
							<li><a href="product_type.admin" target="iframe">
								<span class="glyphicon glyphicon-menu-right"></span>
								&nbsp;商品类型管理
							</a></li>
							<li><a href="#">
								<span class="glyphicon glyphicon-trash"></span>
								&nbsp;商品回收站
							</a></li>
						</ul>
					</div>
				</ul>
				<!-- 	-	订单管理	-	 -->
				<ul class="nav nav-sidebar panel">
					<li class="pull-down-li">
						<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="true" aria-controls="collapseOne">
						订单管理<span class="glyphicon glyphicon-menu-hamburger pull-right"></span>
						</a>
					</li>
					<div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
						<ul class="nav">
							<li><a href="javasript:;">
								<span class="glyphicon glyphicon-time"></span>
								&nbsp;订单列表
							</a></li>
						</ul>
					</div>
				</ul>
			</div><!-- sidebar 栅格 -->
        
			<!-- 	-	-	-	操作引入页	-	-	-	 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<iframe id="external_frame" src="${iframePage==null?'welcome':iframePage }.jsp" name="iframe" width="100%" height="660px"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes">
				</iframe>
			</div>
			
		</div><!-- row -->
	</div><!-- container-fluid -->

	<script>
		
	
	</script>
	
</body>
</html>