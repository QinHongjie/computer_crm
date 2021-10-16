<%@ page pageEncoding="utf-8" import="java.util.*" %>
<!-- 引入C标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>数码商城 | ${typeName }</title>
	<jsp:include page="head.jsp"></jsp:include>
	<link href="${pageContext.request.contextPath }/css/path_nav.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/css/product_show.css" rel="stylesheet">
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
				<c:choose>
				<c:when test="${minPrice!=null || maxPrice!=null }">
					<li><a href="type_show.action?type=${type }">${typeName }</a></li>
					<li class="active">价格搜索</li>
				</c:when>
				<c:otherwise>
					<li class="active">${typeName }</li>
				</c:otherwise>
				</c:choose>
			</ol>
		</div>
	</div>
	
	<!-- 商品展示区 -->
	<div class="product-show">
		<div class="container">
			<div class="col-md-2 col-sm-12">
				<div class="chaxun">
					<h5>价格范围查询</h5>
					<form action="type_show.action?type=${type }" method="post">
						<div class="input-group">
							<span class="input-group-addon">Min:</span>
							<input name="minPrice" type="text" class="form-control" value="${minPrice }" placeholder="0" maxlength="5">
							<span class="input-group-addon" style="padding-left:0;">.0</span>
						</div>
						<div class="input-group">
							<span class="input-group-addon">Max</span>
							<input name="maxPrice" type="text" class="form-control" value="${maxPrice }" placeholder="999999" maxlength="5">
							<span class="input-group-addon" style="padding-left:0;">.0</span>
						</div>
						<button type="submit" class="btn btn-lg btn-block">查询</button>
					</form>
				</div>
			</div>
			<div class="col-md-10 col-sm-12">
				<div class="row">
					<c:forEach var="i" items="${pageComs}">
						<div class="col-xs-12 col-sm-6 col-md-4">
							<div class="thumbnail move_top">
								<a href="detail_show.action?id=${i.id}">
									<img data-src="<%=request.getContextPath() %>/static/${i.picture}"
										 title="${i.intro}">
									<div class="caption">
										<h3>${i.comName}</h3>
										<p>${i.intro}</p>
										<p><span class="money">¥${i.price}</span></p>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</div><!-- row -->
				<%-- <div class="text-center"><font color="red">当前是第${page }页/共${sumPage }页</font></div> --%>
				<!-- 分页区 -->
				<nav id="paging" aria-label="Page navigation">
					<ul id="page_both" class="pager">
						<!-- 上一页分页按钮 -->
						<c:choose>
						<c:when test="${page == 1 }">
							<li class="previous disabled"><a><span aria-hidden="true">&larr;</span> Older</a></li>
						</c:when>
						<c:otherwise>
							<li class="previous"><a href="type_show.action?type=${type }&page=${page-1}">
							<span aria-hidden="true">&larr;</span> Older</a></li>
						</c:otherwise>
						</c:choose>
						
						<!-- 下一页分页按钮 -->
						<c:choose>
						<c:when test="${page == sumPage}">
							<li class="next disabled"><a>Newer <span aria-hidden="true">&rarr;</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="next"><a href="type_show.action?type=${type}&page=${page+1}">
							Newer <span aria-hidden="true">&rarr;</span></a></li>
						</c:otherwise>
						</c:choose>
					</ul>
					
					<!-- 分页数字按钮 -->
					<ul id="page_num" class="pagination">
						<c:forEach begin="${page-5>0?page-5:1 }" end="${page+4>sumPage?sumPage:page+4 }" var="n">
							<!-- 判断是否是当前页 -->
							<c:if test="${page == n}">
								<li class="active"><a href="javascript:;">${n }</a></li>
							</c:if>
							<c:if test="${page != n}">
								<li><a href="type_show.action?type=${type }&page=${n }">${n }</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<!--	-	-	-	-	-	main page end	-	-	-	-	-	-->
	
	<!-- 引入页脚 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>