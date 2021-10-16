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
	<h3 class="page-header">用户信息管理</h3>
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
	 			<th>用户编号</th>
	 			<th>用户头像</th>
	 			<th>用户名</th>
	 			<th>电话号码</th>
	 			<th>收货地址</th>
	 			<th>状态</th>
	 			<th>操作</th>
	 		</tr>
	 		<!-- 遍历展示用户信息 -->
	 		<c:forEach items="${userList }" var="u">
	 			<tr>
		 			<td><input type="checkbox" name="ids" value="${u.id }"></td>
		 			<td>${u.id }</td>
		 			<td><img class="img-circle" src="${pageContext.request.contextPath }/img/head_pho.jpg" width="50px"/></td>
		 			<td>${u.userName }</td>
		 			<td>${u.telephone }</td>
		 			<td>${u.address }</td>
		 			<td>
		 				<c:if test="${u.status==1 }"><span class="text-success"><i class="i-succee"></i>正常</span></c:if>
		 				<c:if test="${u.status==0 }"><span class="text-danger"><i class="i-danger"></i>禁止</span></c:if>
		 			</td>
		 			<!-- 重新把Continue设置为0 在外面的forEach可继续遍历 -->
					<c:set var="Continue" value="0"/>
					<!-- 判断如果是当前登录用户 则不显示信息 -->
	 				<c:if test="${u.userName eq ADMIN_SESSION.userName}" >
						<!-- 把Continue设置为1 直接跳出当前forEach 类似continue -->
						<c:set var="Continue" value="1"/>
			 			<td><button type="button" class="btn btn-info">
			 					<span class="glyphicon glyphicon-pencil"></span>修改
			 				</button></td>
	 				</c:if>
	 				<c:if test="${Continue==0}">
			 			<td>
			 				<a href="#"><button type="button" class="btn btn-info">
			 					<span class="glyphicon glyphicon-pencil"></span>修改
			 				</button></a>
			 				<a href="#"><button type="button" class="btn btn-danger">
			 					<span class="glyphicon glyphicon-trash"></span>
			 				</button></a>
			 			</td>
	 				</c:if>
			 	</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 分页区 -->
	<font color="red">&nbsp;共 ${sumPage } 页&nbsp;</font> 
	&nbsp;每页展示
	<select>
		<option>3</option>
		<option>6</option>
		<option>12</option>
		<option>20</option>
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
				<li class="previous"><a href="user_list.action?page=${page-1}">
				<span aria-hidden="true">&larr;</span> 上一页</a></li>
			</c:otherwise>
			</c:choose>
			
			<!-- 下一页分页按钮 -->
			<c:choose>
			<c:when test="${page == sumPage}">
				<li class="next disabled"><a>下一页 <span aria-hidden="true">&rarr;</span></a></li>
			</c:when>
			<c:otherwise>
				<li class="next"><a href="user_list.action?page=${page+1}">
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
					<li><a href="user_list.action?page=${n }">${n }</a></li>
				</c:if>
			</c:forEach>
		</ul>
	</nav>
	
	<script>
		var num = ${num }
		$(function(){
			$("select").val(num );
			$("select").change(function(){
				location.href = "user_list.action?num="+$(this).val();
			})
		})
	</script>
	
</body>
</html>