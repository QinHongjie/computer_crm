<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404</title>
<script src="${pageContext.request.contextPath}/static/bootstrap3.0/js/jquery.min.js"></script>
<style>
	.m_m{
		margin:0;
		font-size:200px;
	}
</style>
</head>
<body>
	<p class="m_m"> :(</p>
	<p> 哦豁，页面走丢了！</p>
	<p> <font class="time" color="red">3</font> 秒后自动跳转至主页。</p>
	<script type="text/javascript">
		$(function(){
			var index = 3;
			var time = setInterval(function(){
				index--;
				$(".time").text(index);
				if(index==0){
					clearInterval(time)
					location.href = "index.action";
				}
			},1000);
		})
	</script>
</body>
</html>