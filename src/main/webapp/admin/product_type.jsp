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
	<h3 class="page-header">商品类型列表</h3>
	<p>
        <button type="button" class="btn btn-default" onclick="javascript:location.reload();">
        	<span class="glyphicon glyphicon-refresh"></span>
        </button>
        <button type="button" class="btn btn-success">
        	<span class="glyphicon glyphicon-plus"></span>新增
        </button>
        <button type="button" class="btn btn-danger del_all" disabled="true">
        	<span class="glyphicon glyphicon-trash"></span>多选删除
        </button>
	</p>
	<div class="table-responsive">
		<table class="table table-striped table-hover">
	 		<tr>
	 			<th><label class="check_all"><input type="checkbox">全选</label></th>
	 			<th>类型编号</th>
	 			<th>类型名</th>
	 			<th>操作</th>
	 		</tr>
	 		<!-- 遍历展示用户信息 -->
	 		<c:forEach items="${comTypeList }" var="t">
	 			<tr>
		 			<td><input type="checkbox" name="ids" value="${t.id }"></td>
		 			<td>${t.id }</td>
		 			<td>${t.typeName }</td>
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
</body>
</html>