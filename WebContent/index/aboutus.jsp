<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <title>上海和逸金融信息服务有限公司-联系我们</title>
    <!-- head -->
    <%@include file="head.jsp"%>
	<link href="${pageContext.request.contextPath}/index/css/page.css"
	rel="stylesheet">
  </head>
  <body>
    <!-- 导航条 -->
    <%@include file="navigationBar.jsp"%>

    <!-- section -->
    <section>
    <div class="box clearfix">
      <div class="box-left">
        <div class="title">
          <h3>联系我们</h3>
        </div>
        <ul>
          <li><a href="${pageContext.request.contextPath}/index/product.html">和逸教育</a></li>
          <li><a href="${pageContext.request.contextPath}/index/product-2.html">和逸科技</a></li>
          <li><a href="${pageContext.request.contextPath}/index/product-3.html">和逸金服</a></li>
          <li><a href="${pageContext.request.contextPath}/index/product-4.html">和逸金融</a></li>
        </ul>
      </div>
      <div class="box-right">
        <div class="box-right-top">
          <ul>
            <li>当前位置&nbsp>></li>
            <li>联系我们&nbsp>></li>
            <li>和逸金融</li>
          </ul>
        </div>
        <div class="box-right-mid">
            <!-- 第四段 -->
            <h4>和逸金融</h4>
            <h5><b>和逸金融依托十余年国际结构金融市场的系统服务经验，衍生出Pre-ABS、交易撮合、FOF投资等多项服务，并为国内金融行业机构提供咨询服务。</b></h5>
        </div>
      </div>
    </div>
    </section>
    
    <!-- footer -->
    <%@include file="footer.jsp"%>
  </body>
</html>