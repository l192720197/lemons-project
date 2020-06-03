<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/3
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>柠檬日记</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/layui/css/layui.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/static/css/mian.css">
</head>

<body class="lay-blog">
<!--头部-->
<div class="header">
    <div class="header-wrap">
        <h1 class="logo pull-left">
            <a href="diary_list.jsp">
                <img src="${pageContext.request.contextPath}/res/static/images/logo1.png" alt="" class="logo-img">
                <h10 style="color: #F9F9F9;font-size: 30px;">柠檬日记</h10>
            </a>
        </h1>
        <form class="layui-form blog-seach pull-left" action="">
            <div class="layui-form-item blog-sewrap">
                <div class="layui-input-block blog-sebox">
                    <i class="layui-icon layui-icon-search"></i>
                    <input type="text" name="title" lay-verify="title" autocomplete="off"  class="layui-input">
                </div>
            </div>
        </form>
        <div class="blog-nav pull-right">
            <ul class="layui-nav pull-left">
                <li class="layui-nav-item layui-this"><a href="#">首页</a></li>
                <li class="layui-nav-item"><a href="#">写日记</a></li>
                <li class="layui-nav-item"><a href="#">我的</a></li>
            </ul>

            <!--登录&&我的信息-->
            <a href="#" class="personal pull-left">
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
        <li><a href="diary_list.jsp">首页</a></li>
        <li><a href="">写日记</a></li>
        <li><a href="mine.jsp">我的</a></li>
    </ul>
</div>
<!--头部结尾-->

<!--内容部分-->
<div class="container-wrap">
    <div class="container">
        <div class="contar-wrap">
            <h4 class="item-title">
                <p><i class="layui-icon layui-icon-speaker"></i>您好：
                    <span>欢迎来到柠檬日记</span></p>
            </h4>
            <div class="item">
                <div class="item-box  layer-photos-demo1 layer-photos-demo">
                    <c:forEach items="${diares}" var="diary">
                    <h3><a href="diary_details.jsp">${diary.diaryName}</a></h3>
                    <h5>时间：<span>${diary.diaryTime}</span></h5>
                        <h5>天气：<span>${diary.diaryWeather}</span></h5>
                    <p>${diary.diaryContent}</p>
                    <img src="${pageContext.request.contextPath}/res/static/images/item.png" alt="">
                    </c:forEach>
                </div>
                <div class="comment count">
                    <a href="details.html#comment">修改</a>
                    <a href="" class="like">删除</a>
                </div>
            </div>

            <div class="item-btn">
                <button class="layui-btn layui-btn-normal">下一页</button>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>
            <span>@221-214</span>
        </p>
        <p><span>浮生若梦，皆为云烟</span></p>
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
