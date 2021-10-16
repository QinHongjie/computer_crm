<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="head.jsp"></jsp:include>
	<link href="<%=request.getContextPath() %>/static/css/footer.css" rel="stylesheet">
</head>
<body>
	<!--	-	-	-	-	-	footer begin	-	-	-	-	-	-->
	<footer id="footer" class="footer">
		<div class="container">
			<div class="row col-md-9 col-sm-12">
				<div class="col-md-2 col-sm-4 col-xs-6 footer_item">
					<h3 class="footer_title">帮助中心</h3>
					<ul class="footer_list">
						<li class="footer_list-item">购物指南</li>
						<li class="footer_list-item">支付方式</li>
						<li class="footer_list-item">配送方式</li>
					</ul>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 footer_item">
					<h3 class="footer_title">服务支持</h3>
					<ul class="footer_list">
						<li class="footer_list-item">保修政策</li>
						<li class="footer_list-item">服务标准</li>
						<li class="footer_list-item">退换货政策</li>
					</ul>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 footer_item">
					<h3 class="footer_title">关于我们</h3>
					<ul class="footer_list">
						<li class="footer_list-item">公司介绍</li>
						<li class="footer_list-item">加入我们</li>
						<li class="footer_list-item">联系我们</li>
					</ul>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 footer_item">
					<h3 class="footer_title">新闻资讯</h3>
					<ul class="footer_list">
						<li class="footer_list-item">营业执照</li>
						<li class="footer_list-item">新闻动态</li>
						<li class="footer_list-item">版权申明</li>
					</ul>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 footer_item">
					<h3 class="footer_title">线下门店</h3>
					<ul class="footer_list">
						<li class="footer_list-item">法律申明</li>
						<li class="footer_list-item">隐私政策</li>
						<li class="footer_list-item">服务条款</li>
					</ul>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 footer_item">
					<h3 class="footer_title">线下门店</h3>
					<img data-src="<%=request.getContextPath() %>/static/img/wx_dr.jpg" width="80px" />
				</div>
			</div><!-- .row -->
			<div class="col-md-3 col-sm-12 text-center">
				<h3 class="pel">4006-999-999</h3>
				<p><span class="time">周一至周日 8:00-18:00</span></p>
				<p>
					<button>24小时在线客服</button>
				</p>
			</div>
		</div><!-- .container -->
	</footer>
	<footer class="panel-footer text-center">
		版权所有2056-2086 数码家电在线商城  沪ICP备000000000号-0
	</footer>
	<!--	-	-	-	-	-	footer end	-	-	-	-	-	-->
</body>
</html>
