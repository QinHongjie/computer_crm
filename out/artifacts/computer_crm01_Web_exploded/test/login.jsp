<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath }/login.action" method="post" >
        <input type="text" name="userName"><br>
        <input type="password" name="password"><br>
        <input type="submit" value="登录">
    </form>
    <p><font color="red">${msg}</font></p>
</body>
</html>
