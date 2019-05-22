<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>首页-${companyname}</title>
    <!-- head -->
    <%@include file="head.jsp" %>
    <!-- 首页样式 -->
    <link href="${pageContext.request.contextPath}/index/css/index.css"
          rel="stylesheet">
    <style>
        .carousel-inner {
            height: 414px;
        }
    </style>
</head>
<body>
<!-- 导航条 -->
<%@include file="navigationBar.jsp" %>

<!-- banner轮播组件 -->
<div class="banner">
    <div id="carousel-example-generic" class="carousel slide"
         data-ride="carousel" data-interval="5000">
        <!-- 序号组件 -->
        <ol class="carousel-indicators">
            <c:forEach items="${images}" var="item" varStatus="status">
                <li data-target="#carousel-example-generic" data-slide-to="${status.index}" class="${status.index==0?"active":""}"></li>
            </c:forEach>
        </ol>
        <!-- 图片组件 -->
        <div class="carousel-inner" role="listbox">
            <c:forEach items="${images}" var="item" varStatus="status">
                <%--                    <div class="item"${status.index==0?" active":""}>--%>
                <%--                        <img src="${pageContext.request.contextPath}${item}" alt="${status.index+1} slide">--%>
                <%--                    </div>--%>

                <div class="item${status.index==0?" active":""}">
                    <img src="${pageContext.request.contextPath}${item}"
                         alt="${status.index+1} slide">
                    <div class="carousel-caption">
                        <h1></h1>
                        <h1></h1>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- 进退按钮 -->
        <a class="left carousel-control" href="#carousel-example-generic"
           role="button" data-slide="prev"> <span
                class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a> <a class="right carousel-control" href="#carousel-example-generic"
                role="button" data-slide="next"> <span
            class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
    </div>
</div>


<div class="org-container" style="margin:40px 0 30px 0;background-color: #0000;">
    <h3 style="text-align: center; font-size: 20px;background-color: #0000;">- 产品中心 -</h3>
</div>
<!-- feature1内容 -->
<div class="feature clearfix">
    <c:forEach items="${pros0}" var="item" varStatus="status" begin="0" end="1">
        <div class="feature-content">
            <div class="feature-text">
                <div class="feature-text-top">
                    <a class="feature-title">${item.pname}</a>
                </div>
                <p>${item.pcontent}</p>
            </div>
            <a class="feature-more" href="index?action=product&id=${item.pid}">更多 &gt;&gt;</a>
        </div>
    </c:forEach>
</div>
<!-- feature2内容 -->
<div class="feature clearfix">
    <c:forEach items="${pros0}" var="item" varStatus="status" begin="2" end="3">
        <div class="feature-content">
            <div class="feature-text">
                <div class="feature-text-top">
                    <a class="feature-title">${item.pname}</a>
                </div>
                <p>${item.pcontent}</p>
            </div>
            <a class="feature-more" href="index?action=product&id=${item.pid}">更多 &gt;&gt;</a>
        </div>
    </c:forEach>
</div>



<div class="org-container" style="margin:40px 0 30px 0;background-color: #0000;">
    <h3 style="text-align: center; font-size: 20px;background-color: #0000;">- 解决方案 -</h3>
</div>
<!-- feature1内容 -->
<div class="feature clearfix">
    <c:forEach items="${pros1}" var="item" varStatus="status" begin="0" end="1">
        <div class="feature-content">
            <div class="feature-text">
                <div class="feature-text-top">
                    <a class="feature-title">${item.pname}</a>
                </div>
                <p>${item.pcontent}</p>
            </div>
            <a class="feature-more" href="index?action=solution&id=${item.pid}">更多 &gt;&gt;</a>
        </div>
    </c:forEach>
</div>
<!-- feature2内容 -->
<div class="feature clearfix">
    <c:forEach items="${pros1}" var="item" varStatus="status" begin="2" end="3">
        <div class="feature-content">
            <div class="feature-text">
                <div class="feature-text-top">
                    <a class="feature-title">${item.pname}</a>
                </div>
                <p>${item.pcontent}</p>
            </div>
            <a class="feature-more" href="index?action=solution&id=${item.pid}">更多 &gt;&gt;</a>
        </div>
    </c:forEach>
</div>


<!-- 合作机构专区 -->
<%--<div class="org-container">
    <h3 style="text-align: center; font-size: 20px;">- 合作机构 -</h3>
    <div class="org-group" class="banner">
        <div id="carousel-example-generic2" class="carousel slide"
             data-ride="carousel" data-interval="3000">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic2" data-slide-to="0"
                    class="active"></li>
                <li data-target="#carousel-example-generic2" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic2" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img
                            src="${pageContext.request.contextPath}/index/img/logo-g1.png"
                            alt="1 slide">
                </div>
                <div class="item">
                    <img
                            src="${pageContext.request.contextPath}/index/img/logo-g2.png"
                            alt="2 slide">
                </div>
                <div class="item">
                    <img
                            src="${pageContext.request.contextPath}/index/img/logo-g3.png"
                            alt="3 slide">
                </div>
            </div>
            <a class="left carousel-control" href="#carousel-example-generic2"
               role="button" data-slide="prev"> <span class="sr-only">Previous</span>
            </a> <a class="right carousel-control" href="#carousel-example-generic2"
                    role="button" data-slide="next"> <span class="sr-only">Next</span>
        </a>
        </div>
    </div>
</div>--%>
<!-- 合作机构专区-2 -->
<%--<div id="org2" class="org-container">--%>
<%--  <h3 style="text-align: center;font-size: 20px;color:#c7161e">- 合作机构 -</h3>--%>
<%--  <div class="org-container-wap">--%>
<%--<!-- 动态插入img图片-->--%>
<%-- </div>--%>
<%--  <br>--%>
<%--</div>--%>

<!-- footer -->
<%@include file="footer.jsp" %>
</body>
</html>
