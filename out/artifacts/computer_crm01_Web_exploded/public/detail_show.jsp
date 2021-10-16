<%@ page pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>数码商城 | ${computer.comName }</title>
	<jsp:include page="head.jsp"></jsp:include>
	<link href="<%=request.getContextPath() %>/static/css/path_nav.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/static/css/detailpage.css" rel="stylesheet">
</head>
<body>
	<!-- 	-	-	-	引入页头	-	-	-	-->
	<jsp:include page="header.jsp"></jsp:include>
	
	<!--	-	-	-	-	-	main page begin	-	-	-	-	-	-->
	<%
		Map<String,String> m = (Map<String,String>)request.getAttribute("computer");
		String comment = m.get("comment");
	%>
	<!-- 路径导航栏 -->
	<div class="path-nav">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="index.jsp">首页</a></li>
				<li><a href="type_show.action?type=<%=m.get("ctid") %>"><%=m.get("typeName") %></a></li>
				<li class="active"><%=m.get("comName")%></li>
			</ol>
		</div>
	</div>
	
	<!-- 商品详情区 -->
	<div id="detail" class="container">
		<div class="col-md-7 col-sm-12">
			<img data-src="<%=request.getContextPath() %>/static/<%=m.get("picture")%>" title="<%=m.get("intro")%>">
		</div>
		<div class="col-md-5 col-sm-12">
			<h3><%=m.get("comName") %></h3>
			<p><%=m.get("intro") %></p>
			<p>
				<span class="price">¥<%=m.get("price") %></span>
			</p>
			<form class="quantity" action="user_sc_add.do" method="post">
				<button class="btn btn-lg" type="submit">加入购物车</button>
				<input style="opacity: 0" type="checkbox" name="id" value="<%=m.get("id") %>" checked="checked">
				<div>
					<input type="button" value="-" class="minus input-lg btn">
					<input type="text" class="input-lg" name="quantity" value="1" title="数量" size="4">
					<input type="button" value="+" class="plus input-lg btn">
				</div>
			</form>
			<table class="table">
				<tr>
					<td>分类</td><td><%=m.get("typeName") %></td>
				</tr>
				<tr>
					<td>商品特色</td>
					<td>
						<%if(comment.equals("1")){%>
							推荐商品
						<%}else{ %>
							普通商品
						<%} %>
					</td>
				</tr>
				<tr>
					<td>店长评价</td><td>very Good!</td>
				</tr>
			</table>
		</div>
		
	</div>
	<script>
		// 调整商品数量
		// 商品数量
		var quantity = $("form.quantity input[type='text']").val();
		// 减少数量按钮
		$(".minus").click(function(){
			quantity--;
			if(quantity<1)quantity=1;
			$("form.quantity input[type='text']").val(quantity);
		})
		// 增加数量按钮
		$(".plus").click(function(){
			quantity++;
			$("form.quantity input[type='text']").val(quantity);
		})
	</script>
	<!--	-	-	-	-	-	main page end	-	-	-	-	-	-->
	
	<!-- 引入页脚 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>