<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/20
  Time: 22:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <title>柠檬日记</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../res/layui/css/layui.css">
    <link rel="stylesheet" href="../res/static/css/d_index.css" />
    <link rel="stylesheet" href="../res/static/css/mian.css">
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
                <li class="layui-nav-item layui-this"><a href="#">首页</a></li>
                <li class="layui-nav-item"><a href="diary_add.jsp">写日记</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/diary/findByUsername.do?username=${sessionScope.username}&page=1&size=4">我的日记</a></li>
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
        <li><a href="diary_add.jsp">写日记</a></li>
        <li><a href="${pageContext.request.contextPath}/diary/findByUsername.do?username=${sessionScope.username}">我的</a></li>
    </ul>
</div>
<!--头部结尾-->

<div class="container-wrap">
    <div class="container">
        <div class="contar-wrap">
            <h4 class="item-title">
                <p><i class="layui-icon layui-icon-speaker"></i>您好：
                    <span>欢迎来到柠檬日记</span></p>
            </h4>

            <ul class="main">
                <li>
                    <img src="../res/static/images/image1.jpg" alt="" />
                    <div class="flag">一</div>
                </li>
                <li>
                    <img src="../res/static/images/image2.jpg" alt="" />
                    <div class="flag">二</div>
                </li>
                <li>
                    <img src="../res/static/images/image3.jpg" alt="" />
                    <div class="flag">三</div>
                </li>
                <li>
                    <img src="../res/static/images/image4.jpg" alt="" />
                    <div class="flag">四</div>
                </li>
                <li>
                    <img src="../res/static/images/image5.jpg" alt="" />
                    <div class="flag">五</div>
                </li>
            </ul>

        </div>
    </div>
</div>

<div class="footer">
    <p>
        <span>@221-214</span>
    </p>
    <p><span>浮生若梦，皆为云烟</span></p>
</div>
<script src="../res/layui/layui.js"></script>
<script>
    layui.config({
        base: './res/static/js/'
    }).use('blog');
</script>
<script>
    layui.use('laypage', function(){
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: 50 ,  //数据总数，从服务端得到
            limit: 5,
        });
    });
</script>
</div>
</body>
</html>

