<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Test</title>
    <style>
        table,tr,th,td{
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <th>编号</th>
            <th>用户名</th>
            <th>密码</th>
            <th>电话</th>
            <th>地址</th>
            <th>状态</th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.id}</td>
                <td>${user.userName}</td>
                <td>${user.password}</td>
                <td>${user.telephone}</td>
                <td>${user.address}</td>
                <td>${user.status}</td>
            </tr>
        </c:forEach>
    </table>
    <%--<table>
        <tr>
            <th>编号</th>
            <th>名称</th>
            <th>介绍</th>
            <th>价格</th>
            <th>图片</th>
            <th>数量</th>
        </tr>
        <c:forEach var="sc" items="${scs}">
            <tr>
                <td>${sc.id}</td>
                <td>${sc.com.comName}</td>
                <td>${sc.com.intro}</td>
                <td>${sc.com.price}</td>
                <td><img src="${pageContext.request.contextPath}/static/${sc.com.picture}" width="30px"/></td>
                <td>${sc.sum}</td>
            </tr>
        </c:forEach>
    </table>--%>
    <%--<table>
        <tr>
            <th>编号</th>
            <th>名称</th>
            <th>介绍</th>
            <th>价格</th>
            <th>类型</th>
            <th>图片</th>
        </tr>
        <c:forEach var="com" items="${coms}">
        <tr>
            <td>${com.id}</td>
            <td>${com.comName}</td>
            <td>${com.intro}</td>
            <td>${com.price}</td>
            <td>${com.type.typeName}</td>
            <td><img src="${pageContext.request.contextPath}/static/${com.picture}" width="30px"/></td>
        </tr>
        </c:forEach>
    </table>--%>
</body>
</html>
