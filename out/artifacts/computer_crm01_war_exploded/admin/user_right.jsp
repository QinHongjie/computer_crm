<%@ page pageEncoding="utf-8" import="java.util.*" %>
<!-- 引入C标签 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="head.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath }/static/admin/css/mainBase.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/static/admin/js/moreCheck.js"></script>
    <link href="${pageContext.request.contextPath }/static/bootstrap-switch/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/static/bootstrap-switch/js/bootstrap-switch.min.js"></script>
	<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.2/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-switch/3.3.2/js/bootstrap-switch.min.js"></script> -->
</head>
<body>
	<!-- 判断是否经过控制器获取到数据 -->
	<c:if test="${isRequset != 1 }">
		<script>location.href="user_right.admin";</script>
	</c:if>
	
	<h3 class="page-header">用户权限管理</h3>
	<p>
        <button type="button" class="btn btn-default" onclick="javascript:location.reload();">
        	<span class="glyphicon glyphicon-refresh"></span>
        	刷新
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
	 			<th>管理权限</th>
	 		</tr>
	 		<!-- 遍历展示用户信息 -->
	 		<c:forEach items="${userList }" var="u">
	 			<tr>
		 			<td><input type="checkbox" name="ids" value="${u.id }"></td>
		 			<td>${u.id }</td>
		 			<td><img class="img-circle" src="${pageContext.request.contextPath }/static/img/head_photo.jpg" width="50px"/></td>
		 			<td>${u.userName }</td>
		 			<td>${u.telephone }</td>
		 			<td>${u.address }</td>
		 			<td><input id="u_status${u.id}" class="${u.status==1?'u_true':''} ${u.ident==1?'read':''} user_status" type="checkbox" value="${u.id}"/></td>
		 			<td><input id="a_status${u.id}" class="${u.ident==1?'a_true':''} ${adminName==u.userName||u.status==0?'read':''} admin_status" type="checkbox" value="${u.id}"/></td>
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
				<li class="previous"><a href="user_right.admin?type=${type }&page=${page-1}">
				<span aria-hidden="true">&larr;</span> 上一页</a></li>
			</c:otherwise>
			</c:choose>
			
			<!-- 下一页分页按钮 -->
			<c:choose>
			<c:when test="${page == sumPage}">
				<li class="next disabled"><a>下一页 <span aria-hidden="true">&rarr;</span></a></li>
			</c:when>
			<c:otherwise>
				<li class="next"><a href="user_right.admin?type=${type}&page=${page+1}">
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
					<li><a href="user_right.admin?type=${type }&page=${n }">${n }</a></li>
				</c:if>
			</c:forEach>
		</ul>
	</nav>
	
	<script>
		// 每页显示的数据条数下拉菜单
		var num = ${num }
		$(function(){
			$("select").val(num );// 设置下拉菜单显示数字
			// 当下拉菜单内容改变时
			$("select").change(function(){
				// 将改变的数据显示数值传给后台做处理
				location.href = "user_right.admin?num="+$(this).val();
			})
		})
		
		
		/* 	-	-	-	-	-	用户状态开关按钮	-	-	-	-	-	 */
		$(".user_status").each(function(){
			var status = "#u_status"+$(this).val();// 拼接每行用户状态开关的唯一id
			user_switch(status);// 调用封装的用户状态控件初始化函数
		})
		/* 	-	-	-	-	封装"状态"开关初始化样式及事件	-	-	-	-	*/
		function user_switch(status){
			$(status).bootstrapSwitch({  
	            onText : "正常",      // 设置ON文本  
	            offText : "禁止",    // 设置OFF文本  
	            onColor : "success",// 设置ON文本颜色     (info/success/warning/danger/primary)  
	            offColor : "danger",  // 设置OFF文本颜色        (info/success/warning/danger/primary)  
	            size : "mini",    // 设置控件大小,从小到大  (mini/small/normal/large)  
	            handleWidth:"28",//设置控件宽度
	            // 当开关状态改变时触发  
	            onSwitchChange : function(event, state) {
					var userid = $(this).val();// 获取用户id
	                if (state == true) {
						// 打开按钮时触发事件
						var status = "1";
	                  	if(!isUserRightExist("userStartUsing",userid,status)){
							$(this).bootstrapSwitch('state', false);// 如果失败 重新设置状态开关为关闭
						}else{
							// 若启用用户成功
							$("#a_status"+userid).bootstrapSwitch('readonly', false);// 设置当前用户权限开关为可改
						}
	                } else {
						// 关闭按钮时触发事件
						var status = "0";
	                  	if(!isUserRightExist("userStartUsing",userid,status)){
							$(this).bootstrapSwitch('state', true);// 如果失败 重新设置状态开关为开启
						}else{
							// 若停用用户成功
							$("#a_status"+userid).bootstrapSwitch('readonly', true);// 设置当前用户权限开关为只读
						}
	                }  
	            } 
			})
		}
		
		
		/* 	-	-	-	-	-	用户管理权限状态开关按钮	-	-	-	-	-	 */
		$(".admin_status").each(function(){
			var status = "#a_status"+$(this).val()
			admin_switch(status);
		})
		/* 	-	-	-	-	封装"权限"开关初始化样式及事件	-	-	-	-	*/
		function admin_switch(status){
			$(status).bootstrapSwitch({  
	            onText : "开启",      // 设置ON文本  
	            offText : "关闭",    // 设置OFF文本  
	            onColor : "success",// 设置ON文本颜色     (info/success/warning/danger/primary)  
	            offColor : "danger",  // 设置OFF文本颜色        (info/success/warning/danger/primary)  
	            size : "mini",    // 设置控件大小,从小到大  (mini/small/normal/large)  
	            handleWidth:"28",//设置控件宽度
	            // 当开关状态改变时触发  
	            onSwitchChange : function(event, state) {
					var userid = $(this).val();// 获取用户id
	                if (state == true) {
	                  	// 打开按钮时触发事件
						var status = "1";
					    if(!isUserRightExist("userAdmin",userid,status)){
							// 若管理员权限授予失败
							$(this).bootstrapSwitch('state', false);// 重新设置状态开关为关闭
						}else{
							// 若管理员权限授予成功
							$("#u_status"+userid).bootstrapSwitch('readonly', true);// 设置当前用户状态开关为只读
						}
	                } else {
	                    // 打开按钮时触发事件
						var status = "0";
					    if(!isUserRightExist("userAdmin",userid,status)){
							// 若解除管理员权限失败
							$(this).bootstrapSwitch('state', true);// 如果失败 重新设置状态开关为开启
						}else{
							// 若解除管理员权限成功
							$("#u_status"+userid).bootstrapSwitch('readonly', false);// 设置当前用户状态开关为可改
						}
	                }  
	            } 
			})
		}

		/*	-	-	-	重置开关状态(必须放在最后)	-	-	-	*/
		$('.u_true').bootstrapSwitch('state', true);// 设置状态开关为启用
		$('.a_true').bootstrapSwitch('state', true);// 设置状态开关为启用
		$('.read').bootstrapSwitch('readonly', true);// 设置当前管理员状态开关为只读
		
		
		/* 	-	-	-	-	-	封装ajax请求	-	-	-	-	-	*/
		// action : 请求servlet中对应的接口函数名
		// userid : 用户id
		// status : 状态标识('0'或'1')
		function isUserRightExist(action,userid,status)
		{
			//同步请求验证用户密码
			$.ajax({
				type : "POST",
				async : false, //此处设置为同步，防止ajax还未执行完毕，就已经返回
				dataType : "json",
				data : {
					action : action,
					userid : userid,
					status : status
				},
				url : "<%=request.getContextPath()%>/userapi",
				success : function(data) {
					//获取数据库验证结果
					isExist = data["isExist"];
				}
			});
			return isExist;
		}
	</script>
	
</body>
</html>