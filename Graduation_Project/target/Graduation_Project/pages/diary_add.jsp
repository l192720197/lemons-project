<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/19
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>柠檬日记</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../res/layui/css/layui.css">
    <link rel="stylesheet" href="../res/static/css/mian.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
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
        <form class="layui-form blog-seach pull-left" action="" method="post">
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
                <li class="layui-nav-item"><a href="diary_add.jsp">写日记</a></li>
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
    <div class="container container-message">
        <div class="contar-wrap" id="contar-wrap">

            <form class="layui-form" enctype="multipart/form-data" action="${pageContext.request.contextPath}/diary/diaryAdd.do" method="post">

                <input name="diaryUser" value="${sessionScope.username}" type="hidden">
                <div class="layui-form-item layui-form-text">
                    <textarea name="diaryName" placeholder="请输入日记标题" class="layui-textarea" style="resize: none"></textarea>
                </div>

                <div class="layui-inline">
                    <h5>日 期：<span id="time"></span></h5>

                    <label class="checkbox-move">天 气：</label>
                    <input type="checkbox" name="diaryWeather" value="晴" title="晴" lay-skin="primary" checked>
                    <input type="checkbox" name="diaryWeather" value="阴" title="阴" lay-skin="primary">
                    <input type="checkbox" name="diaryWeather" value="雨" title="雨" lay-skin="primary">
                    <input type="checkbox" name="diaryWeather" value="雪" title="雪" lay-skin="primary">
                    <input type="checkbox" name="diaryWeather" value="多云" title="多云" lay-skin="primary">

                </div>

                <div class="layui-form-item layui-form-text">
                    <textarea name="diaryContent" placeholder="请输入日记内容" class="layui-textarea" style="height: 300px"></textarea>
                </div>

                <label for="testFile" style="color: #0f0f0f;width: 20px;height: 20px">上传图片</label>
                <input id="testFile" name="D_file" type="file">

                <div class="item-btn">
                    <button type="submit" class="layui-btn layui-btn-normal">提交</button>
                </div>
            </form>





        </div>
    </div>
</div>
<div class="footer">
    <p>
        <span>@221-214</span>
    </p>
    <p><span>浮生若梦，皆为云烟</span></p>
</div>
</div>
<script src="../res/layui/layui.js">

</script>
<script>
    layui.config({
        base: '../res/static/js/'
    }).use('blog');

    function mytime(){
        var a = new Date();
        var c = a.toLocaleDateString();
        document.getElementById("time").innerHTML = c;
    }
    setInterval(function() {mytime()},1000);
</script>

<script type="text/javascript">
    var diaryTime = document.getElementById("time").innerHTML;
</script>


</body>
</html>
