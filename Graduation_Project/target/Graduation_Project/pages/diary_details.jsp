<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/19
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>柠檬日记</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../res/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/static/css/mian.css">
</head>
<body class="lay-blog">
<!--头部-->
<div class="header">
    <div class="header-wrap">
        <h1 class="logo pull-left">
            <a href="${pageContext.request.contextPath}/index.jsp">
                <img src="../res/static/images/logo1.png" alt="" class="logo-img">
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
                <li class="layui-nav-item layui-this"><a href="${pageContext.request.contextPath}/pages/diary_index.jsp">首页</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/pages/diary_add.jsp">写日记</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/diary/findByUsername.do?username=${sessionScope.username}">我的日记</a></li>
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
        <li><a href="#">写日记</a></li>
        <li><a href="#">我的</a></li>
    </ul>

</div>
<!--头部结尾-->
<div class="container-wrap">
    <div class="container container-message container-details container-comment">
        <div class="contar-wrap">
            <div class="item">

                <c:forEach items="${diares}" var="diary">
                    <div class="item-box  layer-photos-demo1 layer-photos-demo">

                        <h3><a href="diary_details.jsp">${diary.diaryName}</a></h3>
                        <h5>时间：<span>${diary.diaryTimeStr}</span></h5>
                        <h5>天气：<span>${diary.diaryWeather}</span></h5>
                        <p>${diary.diaryContent}</p>
                        <img src="${pageContext.request.contextPath}${diary.diaryDoc}" alt="">

                    </div>
                    <div class="comment count">
                        <a href="">修改</a>
                        <a href="" class="like">删除</a>
                    </div>

                <form class="layui-form" action="${pageContext.request.contextPath}/diary/diaryAddComment.do?diaryName=${diary.diaryName}" method="post">
                    <div class="layui-form-item layui-form-text">
                        <textarea name="diaryComment" class="layui-textarea"  style="resize:none" placeholder="${diary.diaryComment}"></textarea>
                    </div>
                    <div class="item-btn">
                        <button class="layui-btn layui-btn-normal" type="submit">确定</button>
                    </div>
                </form>
                </c:forEach>
        </div>
    </div>
</div>
</div>
<div class="footer">
    <p>
        <span>@221-214</span>
    </p>
    <p><span>浮生若梦，皆为云烟</span></p>
</div>
<script src="../res/layui/layui.js">

</script>
<script>
    layui.config({
        base: '../res/static/js/'
    }).use('blog');
</script>

<script id="LAY-msg-tpl" type="text/html">
    <div class="info-box">
        <div class="info-item">
            <img class="info-img" src="{{ d.avatar }}" alt="">
            <div class="info-text">
                <p class="title">
                    <span class="name">{{ d.username }}</span>
                    <span class="info-img">
					  	<i class="layui-icon layui-icon-praise"></i>
					  	{{ d.praise }}
					 	</span>
                </p>
                <p class="info-intr">
                    {{ d.content }}
                </p>
            </div>
        </div>
    </div>
</script>

</body>
</html>
