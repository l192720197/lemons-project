<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/20
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>柠檬日记</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../res/layui/css/layui.css">
    <link rel="stylesheet" href="../res/static/css/mian.css">
</head>
<body class="lay-blog">
<!--头部-->
<div class="header">
    <div class="header-wrap">
        <h1 class="logo pull-left">
            <a href="index.html">
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
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/diary/findByUsername.do?username=${sessionScope.username}&page=1&size=4">我的日记</a></li>
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
        <li><a href="#">首页</a></li>
        <li><a href="#">写日记</a></li>
        <li><a href="#">我的</a></li>
    </ul>
</div>
<!--头部结尾-->
<div class="container-wrap">
    <div class="container">

        <form class="layui-form" action="${pageContext.request.contextPath}/diary/updateUser.do?username=${sessionScope.username}" method="post">
            <c:forEach items="${userInfo}" var="user">
            <div class="layui-form-item">
                <label class="layui-form-label">账号</label>
                <div class="layui-input-block">
                    <input type="text" name="username" readonly="readonly" lay-verify="required" placeholder="${user.username}" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password"  readonly="readonly" lay-verify="required" placeholder="*************" autocomplete="off" class="layui-input">

                </div>
                <div class="layui-form-mid layui-word-aux">
                    <a href="">修改密码</a></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="uname" placeholder="${user.uname}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">生日</label>
                <div class="layui-input-inline">
                    <input id="test1" type="text" name="brithday" placeholder="${user.brithdayStr}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="男" title="男">
                    <input type="radio" name="sex" value="女" title="女">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" name="email" placeholder="${user.email}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">地址</label>
                <div class="layui-input-block">
                    <input type="text" name="address" placeholder="${user.address}" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn" >确定</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    <a href="${pageContext.request.contextPath}/logout.do" class="layui-btn" >退出登录</a>
                </div>
            </div>
            </c:forEach>
        </form>

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
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
        });
    });
</script>
<script>
    layui.config({
        base: '../res/static/js/'
    }).use('blog');
</script>
</body>
</html>