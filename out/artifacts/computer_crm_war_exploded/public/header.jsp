<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="head.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath }/js/base.js"></script>
	<link href="${pageContext.request.contextPath }/css/header.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/js/header.js"></script>
</head>
<body>
	<!-- 粒子背景特效 -->
	<script type="text/javascript" color="0,205,205" opacity='0.7' zIndex="-2" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
	<!-- 	-	-	-	-	-	info nav begin 	-	-	-	-	-	 -->
	<!-- 顶部条 -->
	<div id="top-bar">
		<nav class="navbar navbar-inverse">
			<div class="container">
				<div class="collapse navbar-collapse navbar-left leftDiv-clear-paddingLeft">
					<ul class="nav navbar-nav">
						<li><a class="a-clear-paddingLeft"><span class="glyphicon glyphicon-time"></span>在线时间 08:30~21:30</a></li><!-- 时间图标+文字 -->
						<li><a>欢迎访问数码家电在线商城!</a></li>
					</ul>
				</div>
				<div class="collapse navbar-collapse navbar-right">
					<ul class="nav navbar-nav">
						<!-- 未登录显示 -->
						<c:choose>
							<c:when test="${USER_SESSION != null}">
								<li class="login_yes" class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
										<span class="user_name">${USER_SESSION.userName}</span><span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li class="per_center"><a href="javascript:;">个人中心</a></li>
										<li role="separator" class="divider"></li>
										<li class="logout"><a href="javascript:;">注销</a></li>
									</ul>
								</li>
							</c:when>
							<c:otherwise>
								<li class="login_no"><a class="shoushi" onclick="login()">登录</a></li>
								<li class="login_no"><a class="shoushi" onclick="register()">注册</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="#" class="shoppingcar" class="a-clear-paddingRight">
							<span class="glyphicon glyphicon-shopping-cart"></span><!-- 购物车图标 -->
							<span class="badge shoppingNum">0</span>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!-- 	-	-	-	-	-	info nav end 	-	-	-	-	-	 -->
	
	
	<!-- 	-	-	-	-	-	header begin 	-	-	-	-	-	 -->
	<!-- 大屏幕显示顶部导航栏 -->
	<div id="header">
		<nav id="nav-bg" class="navbar">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed icon" data-toggle="collapse" aria-expanded="false">
						<span class="glyphicon glyphicon-align-justify"></span><!-- 导航栏扩展图标 -->
					</button>
					<!-- 网站logo图 -->
					<a class="navbar-brand" href="#">
						<img class="logo" data-src="${pageContext.request.contextPath }/img/consultancy_logo.png" alt="数码商城"/>
					</a>
				</div>
				<!-- 大屏幕顶部导航条 -->
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li class="page-e"><a class="index" href="javascript:;">首页</a></li>
						<li class="page-e"><a class="notebook" href="javascript:;">笔记本</a></li>
						<li class="page-e"><a class="desktop" href="javascript:;">台式机</a></li>
						<li class="page-e"><a class="waishe" href="javascript:;">外设系列</a></li>
						<li class="page-e"><a class="appraisal" href="javascript:;">评测中心</a></li>
						<li class="page-e"><a class="after_sale" href="javascript:;">售后服务</a></li>
					</ul>
					<form id="searchform" class="navbar-right search_form" action="search.action" method="get">
						<input name="content" id="form_search" type="text" placeholder="游戏笔记本...">
						<span class="glyphicon glyphicon-search shoushi s_submit"></span>
					</form>
				</div><!-- /.nav-collapse -->
			</div><!-- /.container -->
		</nav>
		
		<!-- 小屏幕显示顶部导航栏 -->
		<nav id="nav-sm" class="navbar-fixed-top" style="background: black;">
			<div class="container-fluid">
				<!-- 小屏幕顶部导航栏 -->
				<div id="nav-top">
					<!-- 导航 -->
					<div id="but-navbar" class="icon" aria-expanded="false">
						<span class="glyphicon glyphicon-align-justify"></span><!-- 导航栏扩展图标 -->
					</div>
					<!-- 网站logo图 -->
					<div>
						<a href="#">
							<img class="logo" src="${pageContext.request.contextPath }/img/consultancy_logo.png" alt="数码商城"/>
						</a>
					</div>
					<!-- 搜索 -->
					<div class="icon" aria-expanded="false">
						<span data-toggle="modal" data-target="#myModal" class="glyphicon glyphicon-search shoushi"></span><!-- 搜索图标 -->
					</div>
				</div>
			</div>
		</nav>
		
		<!-- 左侧固定导航栏 -->
		<div id="navbar-left">
			<ul class="nav">
				<c:choose>
					<c:when test="${USER_SESSION != null}">
						<li class="login_yes" class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								<span class="user_name">${USER_SESSION.userName}</span><span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="per_center"><a href="javascript:;">个人中心</a></li>
								<li role="separator" class="divider"></li>
								<li class="logout"><a href="javascript:;">注销</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li class="login_no"><a class="shoushi" onclick="login()">登录</a></li>
						<li class="login_no"><a class="shoushi" onclick="register()">注册</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<!-- 网站logo图 -->
			<div>
				<a href="#">
					<img data-src="${pageContext.request.contextPath }/img/consultancy_logo.png" width="220px" alt="数码商城"/>
				</a>
			</div>
			<div id="info" class="list-group">
			  <a class="list-group-item page-e index" href="javascript:;">首页</a>
			  <a class="list-group-item page-e notebook" href="javascript:;">笔记本</a>
			  <a class="list-group-item page-e desktop" href="javascript:;">台式机</a>
			  <a class="list-group-item page-e waishe" href="javascript:;">外设系列</a>
			  <a class="list-group-item page-e appraisal" href="javascript:;">评测中心</a>
			  <a class="list-group-item page-e after_sale" href="javascript:;">售后服务</a>
			</div>
		</div>
		<!-- 黑幕 -->
		<div id="blackM"></div>
	</div>
	
	<!-- 搜索Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">搜索</h4>
				</div>
				<div class="modal-body">
					<form class="navbar-form navbar-right">
						<input type="text" class="form-control" placeholder="请输入关键词">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary">确认</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 右侧固定信息块 -->
		<div id="right-fixed" class="move_left">
			<div class="phone">
				<img data-src="${pageContext.request.contextPath }/img/right01.png" height="54px" width="170px"/>
			</div>
			<div>
				<a id="online_count_a">
					<div id="online_count" class="shoushi">
						<span class="glyphicon glyphicon-user"></span><!-- 在线人数图标 -->
						<span class="text">在线人数</span>
						<span class="badge online_count_i">${onlineCount }</span>
					</div>
				</a>
				<%-- <img data-src="<%=request.getContextPath() %>/static/img/right02.png" width="54px" height="54px"/> --%>
			</div>
			<div>
				<a class="shoppingcar">
					<div id="gwc" class="shoushi">
						<span class="glyphicon glyphicon-shopping-cart"></span><!-- 购物车图标 -->
						<span class="badge shoppingNum"></span>
					</div>
				</a>
				<img class="scroll-top" data-src="${pageContext.request.contextPath }/static/img/right03.png" width="54px" height="54px"/>
			</div>
		</div>
		
		<!-- 右下角 回到顶部连接 -->
		<div id="toTop" class="scroll-top">
			<span class="glyphicon glyphicon-chevron-up"></span>
		</div>
		<script>

			var loc = location.href;//获取地址url
			var n1 = loc.length;//地址的总长度
			var n2 = loc.indexOf("type=");//取得=号的位置
			var page = decodeURI(loc.substr(n2+5));//取得=号后面的内容
			// 传入转化为整型的page值 进行选择判断
			switch(parseInt(page)){
	//			case 0:$(".index").addClass("active");break;
				case 1:$(".notebook").addClass("active");break;
				case 2:$(".desktop").addClass("active");break;
				case 3:$(".waishe").addClass("active");break;
				// case 4:$(".appraisal").addClass("active");break;
				// case 5:$(".after_sale").addClass("active");break;
				default:$(".index").addClass("active");
			}
		
			// 类型页面跳转
			$(".index").click(function(){
				location.href="index.jsp?i=0"
			});
			$(".notebook").click(function(){
				location.href="type_show.action?type=1";
			});
			$(".desktop").click(function(){
				location.href="type_show.action?type=2";
			});
			$(".waishe").click(function(){
				location.href="type_show.action?type=3";
			});
			$(".appraisal").click(function(){
			 	location.href="appraisal.html";
			});
			$(".after_sale").click(function(){
			 	location.href="after_sale.html";
			});
		
			//当点击置顶后，回到页面顶部位置
			$(".scroll-top").click(function() {
			    var top = $(document).scrollTop();//获取距页面顶部距离
				var ini_h = 1;    
				timer = setInterval(function() {    
					if (top -  ini_h <= 0) {    
						$(window).scrollTop(0);
						clearInterval(timer);    
					} else {
						top = top - ini_h;    
						$(window).scrollTop(top);  
					}    
					ini_h += 10;     //数字越大走越快    
				}, 15);
			});

			// 登录页跳转
			function login(){
				location.href="${pageContext.request.contextPath }/login.action";
			}
			// 指定页面显示为注册页的动作参数
			function register(){
				location.href="${pageContext.request.contextPath }/login.action?"+"active="+encodeURI(1);
			}
			
			// 个人中心
			$(".per_center").click(function(){
				location.href="per_center.do";
			})
			// 注销
			$(".logout").click(function(){
				location.href="logout.do";
			})

			//点击购物车图标
			$(".shoppingcar").click(function(){
				<%-- var name = "<%=request.getSession(false).getAttribute("userName") %>";
				if(name == "null"){
					alert("你还没有登录 请先登录!");
					location.href = "<%=request.getContextPath()%>/public/login.jsp";
				}else{ --%>
					location.href = "user_sc_show.do";
				//}
			})
			
			// 判断用户是否登录 若有用户登录 调取接口显示用户的购物数
			var user_session = "<%=request.getSession(false).getAttribute("USER_SESSION") %>";
			if(user_session == "null"){
				$(".shoppingNum").hide();
			}else{
				$(".shoppingNum").text(getScQuantity());
			}
			
			// 搜索
			$(".s_submit").click(function(){
				$(".search_form").submit();
			})

		</script>
	<!-- 	-	-	-	-	-	header end 	-	-	-	-	-	 -->
</body>
</html>