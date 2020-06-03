<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/28
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>柠檬日记</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/static/css/mian.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/static/css/style.css" />
</head>

<body class="lay-blog">
<!--头部-->
<div class="header">
    <div class="header-wrap">
        <h1 class="logo pull-left">
            <a href="#">
                <img src="${pageContext.request.contextPath}/res/static/images/logo1.png" alt="" class="logo-img">
                <h10 style="color: #F9F9F9;font-size: 30px;">柠檬日记</h10>
            </a>
        </h1>

        <div class="blog-nav pull-right">
            <ul class="layui-nav pull-left">
                <li class="layui-nav-item layui-this"><a href="">首页</a></li>
                <security:authorize access="hasRole('ADMIN')">
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/pages/admin.jsp">管理员</a></li>
                </security:authorize>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/pages/diary_index.jsp">用户</a></li>
            </ul>

            <!--登录&&我的信息-->
            <a href="${pageContext.request.contextPath}/diary/findOneUser.do?username=${sessionScope.username}" class="personal pull-left">
                <i class="layui-icon layui-icon-username"></i>
            </a>
        </div>

        <div class="mobile-nav pull-right" id="mobile-nav">
            <a href="javascript:;">
                <i class="layui-icon layui-icon-more"></i>
            </a>
        </div>
    </div>
    <ul class="pop-nav" id="pop-nav">
        <li><a href="#">首页</a></li>
        <li><a href="#">管理员</a></li>
        <li><a href="#">用户</a></li>
    </ul>
</div>
<!--头部结尾-->



<!--内容部分-->
<div class="container-wrap">
    <div class="container">
        <h4 class="item-title">
            <p>您好：<span>
                <security:authentication property="principal.username"/>：欢迎来到柠檬日记
            </span></p>
        </h4>
        <div class="box">
            <div class="loading">
                <span>Loading...</span>
            </div>

        </div>
    </div>

    <div class="footer">
        <p>
            <span>@221-214</span>
        </p>
        <p><span>浮生若梦，皆为云烟${sessionScope.username}</span></p>
    </div>
    <script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
    <script>
        layui.config({
            base: '${pageContext.request.contextPath}/res/static/js/'
        }).use('blog');
    </script>
</div>
</body>
</html>
