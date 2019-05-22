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
    <h3 style="text-align: center; font-size: 20px;background-color: #0000;">- 解决方案 -</h3>
</div>
<!-- feature1内容 -->
<div class="feature clearfix">
    <div class="feature-content">

        <div class="feature-text">
            <div class="feature-text-top">
                <a class="feature-title">和逸教育</a>
            </div>
            <p>和逸教育同中国资产证券化研究院、中国资产证券化论坛等研究教育机构打造ABS Elite
                Club，为从业人员提供教育和服务。同时，与监管部门合作推出投资者教育园地，致力于为投资者提供更加清晰透明的市场环境。</p>
        </div>
        <a class="feature-more" href="product.html">更多 &gt;&gt;</a>
    </div>
    <div class="feature-content">

        <div class="feature-text">
            <div class="feature-text-top">
                <a class="feature-title">和逸科技</a>
            </div>
            <p>和逸科技核心业务板块为中国资产证券化分析网（CNABS）和ABS Link。
                CNABS是专注于中国资产证券化市场的综合服务平台，建立在国际领先的金融科技基础上，CNABS在近两年来持续为中国所有市场参与者提供优质的服务和完整的解决方案。
                ABS Link作为国内唯一专业ABS数据、分析、社交应用，为行业内数万从业者提供全面、实时、精准的市场、产品数据和交易信息。</p>
        </div>
        <a class="feature-more" href="product-2.html">更多 &gt;&gt;</a>
    </div>
</div>
<!-- feature2内容 -->
<div class="feature clearfix">
    <div class="feature-content">

        <div class="feature-text">
            <div class="feature-text-top">
                <a class="feature-title">和逸金服</a>
            </div>
            <p>和逸金服核心业务板块为中国基金行政管理（Fund
                Admin），FA为中国私募基金行业量身定制，专注为私募基金、FOF、产业基金提供独立第三方行政管理（包括估值、份额登记）、中后台管理、风险管理、投资分析以及投资策略优化等服务。</p>
        </div>
        <a class="feature-more" href="product-3.html">更多 &gt;&gt;</a>
    </div>
    <div class="feature-content">

        <div class="feature-text">
            <div class="feature-text-top">
                <a class="feature-title">和逸金融</a>
            </div>
            <p>和逸金融依托十余年国际结构金融市场的系统服务经验，衍生出Pre-ABS、交易撮合、FOF投资等多项服务，并为国内金融行业机构提供咨询服务。</p>
        </div>
        <a class="feature-more" href="product-3.html">更多 &gt;&gt;</a>
    </div>
</div>


<div class="org-container" style="margin:40px 0 30px 0;background-color: #0000;">
    <h3 style="text-align: center; font-size: 20px;background-color: #0000;">- 产品中心 -</h3>
</div>
<!-- feature1内容 -->
<div class="feature clearfix">
    <div class="feature-content">

        <div class="feature-text">
            <div class="feature-text-top">
                <a class="feature-title">和逸教育</a>
            </div>
            <p>和逸教育同中国资产证券化研究院、中国资产证券化论坛等研究教育机构打造ABS Elite
                Club，为从业人员提供教育和服务。同时，与监管部门合作推出投资者教育园地，致力于为投资者提供更加清晰透明的市场环境。</p>
        </div>
        <a class="feature-more" href="product.html">更多 &gt;&gt;</a>
    </div>
    <div class="feature-content">

        <div class="feature-text">
            <div class="feature-text-top">
                <a class="feature-title">和逸科技</a>
            </div>
            <p>和逸科技核心业务板块为中国资产证券化分析网（CNABS）和ABS Link。
                CNABS是专注于中国资产证券化市场的综合服务平台，建立在国际领先的金融科技基础上，CNABS在近两年来持续为中国所有市场参与者提供优质的服务和完整的解决方案。
                ABS Link作为国内唯一专业ABS数据、分析、社交应用，为行业内数万从业者提供全面、实时、精准的市场、产品数据和交易信息。</p>
        </div>
        <a class="feature-more" href="product-2.html">更多 &gt;&gt;</a>
    </div>
</div>
<!-- feature2内容 -->
<div class="feature clearfix">
    <div class="feature-content">

        <div class="feature-text">
            <div class="feature-text-top">
                <a class="feature-title">和逸金服</a>
            </div>
            <p>和逸金服核心业务板块为中国基金行政管理（Fund
                Admin），FA为中国私募基金行业量身定制，专注为私募基金、FOF、产业基金提供独立第三方行政管理（包括估值、份额登记）、中后台管理、风险管理、投资分析以及投资策略优化等服务。</p>
        </div>
        <a class="feature-more" href="product-3.html">更多 &gt;&gt;</a>
    </div>
    <div class="feature-content">

        <div class="feature-text">
            <div class="feature-text-top">
                <a class="feature-title">和逸金融</a>
            </div>
            <p>和逸金融依托十余年国际结构金融市场的系统服务经验，衍生出Pre-ABS、交易撮合、FOF投资等多项服务，并为国内金融行业机构提供咨询服务。</p>
        </div>
        <a class="feature-more" href="product-3.html">更多 &gt;&gt;</a>
    </div>
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
