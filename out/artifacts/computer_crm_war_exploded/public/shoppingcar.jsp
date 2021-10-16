<%@ page pageEncoding="UTF-8" %>
<!-- 引入C标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>数码商城 | 购物车</title>
	<jsp:include page="head.jsp"></jsp:include>
	<link href="${pageContext.request.contextPath }/css/shoppingcar.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/js/shoppingcar.js"></script>
</head>
<body>
	<!-- 	-	-	-	引入页头	-	-	-	-->
	<jsp:include page="header.jsp"></jsp:include>
	
	<!--	-	-	-	-	-	main page begin	-	-	-	-	-	-->
	<c:choose>
	<c:when test="${scList.size() > 0}">
	<!-- 若已购物 -->
	<div id="shoppinglist">
		<div class="container">
			<div class="col-md-8 col-sm-12">
				<form id="form_del" action="${pageContext.request.contextPath }/user_sc_del.do" onsubmit="return false">
					<div class="table-responsive">
						<table class="table table-hover">
							<tr>
								<th><input id="check_all" type="checkbox"></th>
								<th>商品</th>
								<th>名称</th>
								<th>价格</th>
								<th>数量</th>
								<th>合计</th>
							</tr>
							<c:set var="s" value="0" />
							<c:set var="total" value="0" />
							<c:forEach var="i" items="${scList}">
								<tr>
									<td><input type="checkbox" name="ids" value="${i.id}"></td>
									<td>
										<a href="detail_show.action?id=${i.com.id}">
											<img data-src="${pageContext.request.contextPath }/static/${i.com.picture}"
												 title="${i.com.intro}"/>
										</a>
									</td>
									<td class="title">${i.com.intro}</td>
									<td>¥${i.com.price}</td>
									<td>${i.sum}</td>
									<td class="total">¥${i.com.price * i.sum}</td>
								</tr>
								<c:set var="s" value="${s + i.sum}" />
								<c:set var="total" value="${total + i.com.price * i.sum}"/>
							</c:forEach>
						</table>
					</div>
					<button id="del" class="btn btn-lg btn-block" type="submit">将选中商品从购物车中移除</button>
				</form>
			</div>
			<div class="col-md-4 col-sm-12">
				<table class="table">
					<tr>
						<th colspan="2">购物车总计</th>
					</tr>
					<tr>
						<td>购物数量</td>
						<td>${s}</td>
					</tr>
					<tr>
						<td>订单总计</td>
						<td class="total"><font color="red">¥${total}</font></td>
					</tr>
				</table>
				<button id="go" class="btn btn-lg btn-block" type="button">前往收银台</button>
			</div>
		</div>
	</div>
	</c:when>
	
	<c:otherwise>
	<!-- 若没有购物 -->
	<div id="no-shopping" class="container text-center">
		<p>你的购物车目前是空的</p>
		<p><a href="index.action">
			<button class="btn btn-lg btn-block" type="button">返回商店</button>
		</a></p>
	</div>
	</c:otherwise>
	</c:choose>
	<!--	-	-	-	-	-	main page end	-	-	-	-	-	-->
	
	<!-- 引入页脚 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>