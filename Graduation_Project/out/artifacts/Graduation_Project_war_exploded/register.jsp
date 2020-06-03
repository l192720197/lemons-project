<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/30
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户注册</title>
    <link rel="stylesheet" href="css/L_R.css" />
</head>
<body>
<form class="box" action="${pageContext.request.contextPath}/user/register.do" method="post">
    <h1>注册</h1>
    <input type="text" name="username" placeholder="账号" />
    <input type="password" name="password" placeholder="密码" />
    <input type="text" name="uname" placeholder="姓名" />
    <input type="text" name="email" placeholder="邮箱" />
    <input type="submit" value="点击注册" />
</form>
</body>
</html>