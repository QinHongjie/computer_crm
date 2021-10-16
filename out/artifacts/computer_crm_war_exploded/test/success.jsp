<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table,tr,th,td{
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <p>用户信息</p>
    <table>
        <tr>
            <th>编号</th>
            <th>用户名</th>
            <th>密码</th>
            <th>电话</th>
            <th>地址</th>
        </tr>
        <tr>
            <td>${USER_SESSION.id}</td>
            <td>${USER_SESSION.userName}</td>
            <td>${USER_SESSION.password}</td>
            <td>${USER_SESSION.telephone}</td>
            <td>${USER_SESSION.address}</td>
            <td><a href="${pageContext.request.contextPath }/logout.do">注销</a> </td>
        </tr>
    </table>
</body>
</html>
