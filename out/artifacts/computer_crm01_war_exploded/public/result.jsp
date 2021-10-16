<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="head.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			BootstrapDialog.show({
	            title: '提示信息',
	            message: '<%=request.getAttribute("msg") %>',
	            buttons: [{
	                label: '确定',
	                action: function(dialog) {
	                	location.replace('<%=request.getAttribute("href") %>');
	                }
	            }]
	        });
		});
	</script>
</head>
</html>