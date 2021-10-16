<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath }/login.do" method="post" >
        <input type="text" name="userName"><br>
        <input type="password" name="password"><br>
        <input type="submit" value="登录">
    </form>
    <p><font color="red">${msg}</font></p>
    <p>当前登录：${USER_SESSION.userName}</p>
</body>
</html>
