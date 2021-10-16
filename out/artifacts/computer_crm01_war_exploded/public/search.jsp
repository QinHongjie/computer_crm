<%@ page pageEncoding="utf-8" import="java.util.*" %>
<!-- 引入C标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>数码商城 | 搜索内容</title>
	<jsp:include page="head.jsp"></jsp:include>
	<link href="<%=request.getContextPath() %>/static/css/path_nav.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/static/css/product_show.css" rel="stylesheet">
</head>
<body>
	<!-- 	-	-	-	引入页头	-	-	-	-->
	<jsp:include page="header.jsp"></jsp:include>
	
	<!--	-	-	-	-	-	main page begin	-	-	-	-	-	-->
	<!-- 路径导航栏 -->
	<div class="path-nav">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="index.jsp?page=0">首页</a></li>
				<li class="active">${content=='' ? '所有商品' : content }</li>
			</ol>
		</div>
	</div>
	
	<div class="product-show">
		<div class="container">
			<div class="row">
				<%
					List<Map<String,String>> computer = (List<Map<String,String>>)request.getAttribute("computer");
					if(computer != null){
						for(Map<String,String> m : computer){
				%>
				<div class="col-xs-12 col-sm-6 col-md-3">
					<div class="thumbnail move_top">
						<a href="detail_show.action?id=<%=m.get("id")%>">
						<img data-src="<%=request.getContextPath() %>/static/<%=m.get("picture")%>" 
								title="<%=m.get("intro")%>">
						<div class="caption">
							<h3><%=m.get("comName")%></h3>
							<p><%=m.get("intro")%></p>
							<p><span class="money">¥<%=m.get("price")%></span></p>
						</div>
						</a>
					</div>
				</div>
				<%
						}
					}
				%>
			</div><!-- row -->
		</div><!-- container -->
	</div><!-- product-show -->
	
	<!--	-	-	-	-	-	main page end	-	-	-	-	-	-->
	
	<!-- 引入页脚 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>