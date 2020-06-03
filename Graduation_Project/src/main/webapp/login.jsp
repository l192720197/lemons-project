<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/29
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/L_R.css"/>
</head>
<body>
<form class="box" action="${pageContext.request.contextPath}/login.do" method="post">
    <h1>登录</h1>
    <input type="text" name="username" placeholder="账号" />
    <input type="password" name="password" placeholder="密码" />
    <input type="submit" value="登录" />
    <a href="register.jsp"><input type="button" value="注册" /></a>
</form>
</body>
</html>
