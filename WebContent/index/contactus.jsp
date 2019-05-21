<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>联系我们-${companyname}</title>
    <!-- head -->
    <%@include file="head.jsp" %>
    <link href="${pageContext.request.contextPath}/index/css/page.css" rel="stylesheet">
    <style>
        .info, .markdown {
            Opacity: 0;
        }
    </style>
</head>
<body>
<!-- 导航条 -->
<%@include file="navigationBar.jsp" %>

<!-- section -->
<section>
    <div class="box clearfix">
        <div class="box-left">
            <div class="title">
                <h3>联系我们</h3>
            </div>
            <ul>
                <li><a href="#">${companyname}</a></li>
            </ul>
        </div>
        <div class="box-right">
            <div class="box-right-top">
                <ul>
                    <li>当前位置&nbsp></li>
                    <li>联系我们&nbsp</li>
                </ul>
            </div>
            <div class="box-right-mid">
                <!-- 第四段 -->
                <h4>${companyname}</h4>
                <h5>${pdesp}</h5>
            </div>
            <!--评论显示区，请插入合适的位置-->
            <div class="comment valine" style="margin-top: 30px;"></div>
        </div>
    </div>
</section>

<!-- footer -->
<%@include file="footer.jsp" %>

<!--载入js，在</body>之前插入即可-->
<!--Leancloud 操作库:-->
<script src="${pageContext.request.contextPath}/index/js/av-min.js"></script>
<!--Valine 的核心代码库-->
<script src="${pageContext.request.contextPath}/index/js/Valine.min.js"></script>
<script>
    new Valine({
        // AV 对象来自上面引入av-min.js
        av: AV,
        el: '.comment',
        notify: false,
        verify: true,
        avatar: 'mp',
        meta: ['nick', 'mail'],
        pageSize: 20,
        visitor: true,
        recordIP: true,
        app_id: 'k8LPqtENcTxnGhjVsqPtM5Bi-gzGzoHsz',
        app_key: '3Lg3WmfcovFDeo6HYcUtqqBF',
        placeholder: '写下评论吧'
    });
</script>
</body>
</html>