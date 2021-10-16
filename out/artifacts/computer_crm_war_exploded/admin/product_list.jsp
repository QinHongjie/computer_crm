<%@ page pageEncoding="utf-8" import="java.util.*" %>
<!-- 引入C标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="head.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath }/admin_css/mainBase.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/admin_js/moreCheck.js"></script>
</head>
<body>
	<h3 class="page-header">商品信息管理</h3>
	<p>
        <button type="button" class="btn btn-default" onclick="javascript:location.reload();">
        	<span class="glyphicon glyphicon-refresh"></span>
        </button>
        <button type="button" class="btn btn-success">
        	<span class="glyphicon glyphicon-plus"></span>新增
        </button>
        <button type="button" class="btn btn-danger del_all" disabled="true">
        	<span class="glyphicon glyphicon-trash"></span>多选移除
        </button>
	</p>
	<div class="table-responsive">
		<table class="table table-striped table-hover">
	 		<tr>
	 			<th><label class="check_all"><input type="checkbox">全选</label></th>
	 			<th>商品编号</th>
	 			<th>商品图片</th>
	 			<th>商品名</th>
	 			<th>商品简介</th>
	 			<th>价格</th>
	 			<th>类型</th>
	 			<th>点购率</th>
	 			<th>操作</th>
	 		</tr>
	 		<!-- 遍历展示用户信息 -->
	 		<c:forEach items="${pageComList }" var="p">
	 			<tr>
		 			<td><input type="checkbox" name="ids" value="${p.id }"></td>
		 			<td>${p.id }</td>
		 			<td><img src="${pageContext.request.contextPath }/static/${p.picture }" width="60px"/></td>
		 			<td>${p.comName }</td>
		 			<td>${p.intro }</td>
		 			<td>￥${p.price }</td>
		 			<td>${p.type.typeName }</td>
		 			<td>${p.hits }</td>
		 			<td>
		 				<a href="#"><button type="button" class="btn btn-info">
		 					<span class="glyphicon glyphicon-pencil"></span>修改
		 				</button></a>
		 				<a href="#"><button type="button" class="btn btn-danger">
		 					<span class="glyphicon glyphicon-trash"></span>
		 				</button></a>
		 			</td>
			 	</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 分页区 -->
	<font color="red">&nbsp;共 ${sumPage } 页&nbsp;</font> 
	&nbsp;每页展示
	<select>
		<option>6</option>
		<option>12</option>
		<option>20</option>
		<option>30</option>
	</select>
	条数据
	<nav id="paging" aria-label="Page navigation">
		<ul id="page_both" class="pager">
			<!-- 上一页分页按钮 -->
			<c:choose>
			<c:when test="${page == 1 }">
				<li class="previous disabled"><a><span aria-hidden="true">&larr;</span> 上一页</a></li>
			</c:when>
			<c:otherwise>
				<li class="previous"><a href="product_list.action?type=${type }&page=${page-1}">
				<span aria-hidden="true">&larr;</span> 上一页</a></li>
			</c:otherwise>
			</c:choose>
			
			<!-- 下一页分页按钮 -->
			<c:choose>
			<c:when test="${page == sumPage}">
				<li class="next disabled"><a>下一页 <span aria-hidden="true">&rarr;</span></a></li>
			</c:when>
			<c:otherwise>
				<li class="next"><a href="product_list.action?type=${type}&page=${page+1}">
				下一页 <span aria-hidden="true">&rarr;</span></a></li>
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
					<li><a href="product_list.action?type=${type }&page=${n }">${n }</a></li>
				</c:if>
			</c:forEach>
		</ul>
	</nav>
	
	<script>
		var num = ${num }
		$(function(){
			$("select").val(num );
			$("select").change(function(){
				location.href = "product_list.action?num="+$(this).val();
			})
		})
	</script>
</body>
</html>