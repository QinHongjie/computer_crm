<%@ page pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>数码商城</title>
	<jsp:include page="head.jsp"></jsp:include>
	<link href="<%=request.getContextPath() %>/static/css/index.css" rel="stylesheet">
</head>
<body>
	<!-- 	-	-	-	引入页头	-	-	-	-->
	<jsp:include page="header.jsp"></jsp:include>
	
	<!--	-	-	-	-	-	main page begin	-	-	-	-	-	-->
	<div id="carousel">
		<!-- 轮播图 -->
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img data-src="<%=request.getContextPath() %>/static/img/lunb01.jpg" alt="...">
				</div>
				<div class="item">
					<img data-src="<%=request.getContextPath() %>/static/img/lunb02.jpg" alt="...">
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- 轮播图层上层 列表项 -->
		<div id="carousel-list" class="container move_bottom">
			<div class="container">
				<div class="list-group">
				  <a href="#" class="list-group-item active">全部分类<span class="glyphicon glyphicon-triangle-bottom"></span></a>
				  <a href="#" class="list-group-item">游戏笔记本</a>
				  <a href="#" class="list-group-item">游戏台式机</a>
				  <a href="#" class="list-group-item">办公电脑</a>
				  <a href="#" class="list-group-item">游戏鼠键/耳机</a>
				  <a href="#" class="list-group-item">高清摄像头</a>
				  <a href="#" class="list-group-item">VR专区</a>
				  <a href="#" class="list-group-item">驱动下载</a>
				  <a href="#" class="list-group-item">保修政策</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 轮播图下面 缩略图信息块 -->
	<div style="background: white;">
		<div id="four-info" class="container">
			<div class="col-md-3">
				<div>
					<img data-src="<%=request.getContextPath() %>/static/img/001.png" />
				</div>
			</div>
			<div class="col-md-3 h">
				<div>
					<img data-src="<%=request.getContextPath() %>/static/img/002.jpg" class="move_top" />
				</div>
			</div>
			<div class="col-md-3 h">
				<div>
					<img data-src="<%=request.getContextPath() %>/static/img/003.jpg" class="move_top" />
				</div>
			</div>
			<div class="col-md-3 h">
				<div>
					<img data-src="<%=request.getContextPath() %>/static/img/004.jpg" class="move_top" />
				</div>
			</div>
		</div>
	</div>
	
	<!-- 精选单品推荐 缩略图 -->
	<div style="background: white;">
		<div id="jxdp" class="container">
			<h3 class="panel-heading">精选单品推荐</h3>
			<div class="row text-center">
				<%
					List<Map<String,String>> recomm = (List<Map<String,String>>)request.getAttribute("recomm");
					if(recomm != null){
						for(Map<String,String> m : recomm){
				%>
				<div class="col-xs-12 col-sm-6 col-md-3">
					<div class="thumbnail move_top">
						<a href="detail_show.action?id=<%=m.get("id")%>">
							<img data-src="<%=request.getContextPath() %>/static/<%=m.get("picture")%>" 
									title="<%=request.getContextPath() %>/static/<%=m.get("picture")%>">
						</a>
						<div class="caption">
							<h3><%=m.get("comName") %></h3>
							<p><%=m.get("intro") %></p>
						</div>
					</div>
				</div>
				<%
						}
					}
				%>
			</div>
		</div>
	</div>
	
	<!-- 中间内容 大图标+缩略图 混合块 -->
	<div id="central_content" class="container">
		<!-- 	-	-	-	-	-	笔记本/游戏本	-	-	-	-	-	-->
		<div class="panel-heading nav">
			<span class="s-title">笔记本/游戏本</span>
			<a href="#" class="pull-right">more+</a>
		</div>
		<div class="col-sm-12 col-md-5 big-img">
			<img class="move_right" data-src="<%=request.getContextPath() %>/static/img/bjb_big.jpg" />
		</div>
		<div class="col-sm-12 col-md-7 text-center h">
			<div class="row">
				<%
					List<Map<String,String>> bjb = (List<Map<String,String>>)request.getAttribute("bjb");
					if(bjb != null){
						for(Map<String,String> m : bjb){
				%>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<div class="thumbnail move_top">
						<a href="detail_show.action?id=<%=m.get("id")%>">
						<img data-src="<%=request.getContextPath() %>/static/<%=m.get("picture")%>" 
							title="<%=m.get("intro")%>">
						</a>
						<div class="caption">
							<h3><%=m.get("comName")%></h3>
							<p><%=m.get("intro")%></p>
							<p><span class="money">¥<%=m.get("price")%></span></p>
						</div>
					</div>
				</div>
				<%
						}
					}
				%>
			</div><!-- row -->
		</div><!-- 缩略图栅格 -->
		
		<!-- 	-	-	-	-	-	台式机/一体机	-	-	-	-	-	-->
		<div class="panel-heading">
			<span class="s-title">台式机/一体机</span>
			<a href="#" class="pull-right">more+</a>
		</div>
		<div class="col-sm-12 col-md-5 big-img">
			<img class="move_right" data-src="<%=request.getContextPath() %>/static/img/tsj_big.jpg" />
		</div>
		<div class="col-sm-12 col-md-7 text-center h">
			<div class="row">
				<%
					List<Map<String,String>> tsj = (List<Map<String,String>>)request.getAttribute("tsj");
					if(tsj != null){
						for(Map<String,String> m : tsj){
				%>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<div class="thumbnail move_top">
						<a href="detail_show.action?id=<%=m.get("id")%>">
						<img data-src="<%=request.getContextPath() %>/static/<%=m.get("picture")%>" 
							title="<%=m.get("intro")%>">
						</a>
						<div class="caption">
							<h3><%=m.get("comName")%></h3>
							<p><%=m.get("intro")%></p>
							<p><span class="money">¥<%=m.get("price")%></span></p>
						</div>
					</div>
				</div>
				<%
						}
					}
				%>
			</div><!-- row -->
		</div><!-- 缩略图栅格 -->
		
		<!--	-	-	-	-	-	外观系列		-	-	-	-	-	-->
		<div id="wsxl">
			<div class="panel-heading">
				<span class="s-title">外观系列</span>
			</div>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#mouse" aria-controls="mouse" role="tab" data-toggle="tab">鼠标</a></li>
				<li role="presentation"><a href="#keyboard" aria-controls="keyboard" role="tab" data-toggle="tab">键盘</a></li>
				<li role="presentation"><a href="#other" aria-controls="other" role="tab" data-toggle="tab">其它</a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- 鼠标产品展示标签页 -->
				<div role="tabpanel" class="tab-pane active" id="mouse">
					<div class="col-sm-12 col-md-5 big-img">
						<img class="move_right" data-src="<%=request.getContextPath() %>/static/img/wgxl_k_big_01.jpg" />
					</div>
					<div class="col-sm-12 col-md-7 text-center h">
						<div class="row">
							<%
								List<Map<String,String>> sb = (List<Map<String,String>>)request.getAttribute("sb");
								if(sb != null){
									for(Map<String,String> m : sb){
							%>
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail move_top">
									<a href="detail_show.action?id=<%=m.get("id")%>">
									<img data-src="<%=request.getContextPath() %>/static/<%=m.get("picture")%>" 
										title="<%=m.get("intro")%>">
									</a>
									<div class="caption">
										<h3><%=m.get("comName")%></h3>
										<p><%=m.get("intro")%></p>
										<p><span class="money">¥<%=m.get("price")%></span></p>
									</div>
								</div>
							</div>
							<%
									}
								}
							%>
						</div><!-- row -->
					</div><!-- 缩略图栅格 -->
				</div><!-- mouse -->
				<!-- 键盘产品展示标签页 -->
				<div role="tabpanel" class="tab-pane" id="keyboard">
					<div class="col-sm-12 col-md-5 big-img">
						<img class="move_right" data-src="<%=request.getContextPath() %>/static/img/wgxl_k_big_02.jpg" />
					</div>
					<div class="col-sm-12 col-md-7 text-center h">
						<div class="row">
							<%
								List<Map<String,String>> jp = (List<Map<String,String>>)request.getAttribute("jp");
								if(jp != null){
									for(Map<String,String> m : jp){
							%>
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail move_top">
									<a href="detail_show.action?id=<%=m.get("id")%>">
									<img data-src="<%=request.getContextPath() %>/static/<%=m.get("picture")%>" 
										title="<%=m.get("intro")%>">
									</a>
									<div class="caption">
										<h3><%=m.get("comName")%></h3>
										<p><%=m.get("intro")%></p>
										<p><span class="money">¥<%=m.get("price")%></span></p>
									</div>
								</div>
							</div>
							<%
									}
								}
							%>
						</div><!-- row -->
					</div><!-- 缩略图栅格 -->
				</div><!-- keyboard -->
				<!-- 其它商品展示标签页 -->
				<div role="tabpanel" class="tab-pane" id="other">
					<div class="col-sm-12 col-md-5 big-img">
						<img class="move_right" data-src="<%=request.getContextPath() %>/static/img/wgxl_k_big_01.jpg" />
					</div>
					<div class="col-sm-12 col-md-7 text-center h">
						<div class="row">
							<%
								List<Map<String,String>> other = (List<Map<String,String>>)request.getAttribute("other");
								if(other != null){
									for(Map<String,String> m : other){
							%>
							<div class="col-sm-4 col-md-4">
								<div class="thumbnail move_top">
									<a href="detail_show.action?id=<%=m.get("id")%>">
									<img data-src="<%=request.getContextPath() %>/static/<%=m.get("picture")%>" 
										title="<%=m.get("intro")%>">
									</a>
									<div class="caption">
										<h3><%=m.get("comName")%></h3>
										<p><%=m.get("intro")%></p>
										<p><span class="money">¥<%=m.get("price")%></span></p>
									</div>
								</div>
							</div>
							<%
									}
								}
							%>
						</div><!-- row -->
					</div><!-- 缩略图栅格 -->
				</div><!-- other -->
			</div>
		</div><!-- 外观系列 -->
	</div><!-- central_content -->
	
	<!--	-	-	-	-	-	main page end	-	-	-	-	-	-->
	
	<!-- 引入页脚 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>