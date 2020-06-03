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
<%--    <script src="${pageContext.request.contextPath}/res/js/jquery-3.5.0.js"></script>--%>
    <script src="../res/js/jquery-3.5.0.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/res/static/css/mian.css">
</head>

<body class="lay-blog">
<!--头部-->
<div class="header">
    <div class="header-wrap">
        <h1 class="logo pull-left">
            <a href="${pageContext.request.contextPath}/index.jsp">
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
                <li class="layui-nav-item layui-this"><a href="${pageContext.request.contextPath}/pages/diary_index.jsp">首页</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/pages/diary_add.jsp">写日记</a></li>
                <li class="layui-nav-item"><a href="#">我的日记</a></li>
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

<!--内容部分-->
<div class="container-wrap">
    <div class="container">
        <div class="contar-wrap">
            <h4 class="item-title">
                <p><i class="layui-icon layui-icon-speaker"></i>您好：
                    <span>欢迎来到柠檬日记</span></p>
            </h4>
            <div class="item">
                <c:forEach items="${pageInfo.list}" var="diary">
                <div class="item-box  layer-photos-demo1 layer-photos-demo">

                    <h3><a href="${pageContext.request.contextPath}/diary/findByDiaryname.do?diaryName=${diary.diaryName}">${diary.diaryName}</a></h3>
                    <h5>时间：<span>${diary.diaryTimeStr}</span></h5>
                        <h5>天气：<span>${diary.diaryWeather}</span></h5>
                    <p>${diary.diaryContent}</p>
                    <img src="${pageContext.request.contextPath}${diary.diaryDoc}" alt="">

                </div>
                <div class="comment count">
                    <a href="${pageContext.request.contextPath}/diary/findByDiaryname.do?diaryName=${diary.diaryName}">修改</a>
                    <a href="${pageContext.request.contextPath}/diary/deleteDiary.do?id=${diary.id}" class="like">删除</a>
                </div>
                </c:forEach>
            </div>

            <div class="layui-laypage ">
                <ul class="page-p">
                    <li>
                        <a href="${pageContext.request.contextPath}/diary/findByUsername.do?username=${sessionScope.username}&page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/diary/findByUsername.do?username=${sessionScope.username}&page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>



                    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                        <li><a href="${pageContext.request.contextPath}/diary/findByUsername.do?username=${sessionScope.username}&page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                    </c:forEach>



                    <li><a href="${pageContext.request.contextPath}/diary/findByUsername.do?username=${sessionScope.username}&page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/diary/findByUsername.do?username=${sessionScope.username}&page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
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
 <script src="${pageContext.request.contextPath}/res/layui/layui.js"></script>
    <script>
        layui.config({
            base: '${pageContext.request.contextPath}/res/static/js/'
        }).use('blog');


        layui.use('laypage', function(){
            var laypage = layui.laypage;

            //执行一个laypage实例
            laypage.render({
                elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
                ,count: 50
                ,limit:20
                ,jump: function(obj, first){
                    if(!first){
                        $.post("/test/test1.do",
                            {test:obj.curr},
                        function (data) {
                            alert(data)
                        })
                        /*alert(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                        alert(obj.limit);*/
                    }
                }//数据总数，从服务端得到
            });
        });
    </script>

</div>
</body>
</html>
