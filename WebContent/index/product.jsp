<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <title>${pagename}-${companyname}</title>
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
          <h3>${pagename}</h3>
        </div>
        <ul>   
	       	<c:forEach items="${pros}" var="item">
	         		<li><a href="${pageContext.request.contextPath}/index?action=${p}&id=${item.pid}" ${pro.pid==item.pid?"style=\"color: #ffbe5b;\"":""} }>${item.pname}</a></li>
			</c:forEach>
        </ul>
      </div>
      <div class="box-right">
        <div class="box-right-top">
          <ul>
            <li>当前位置&nbsp></li>
            <li>${pagename}&nbsp</li>
          </ul>
        </div>
        <div class="box-right-mid">
            <h4 style="margin-top: 0;">${pro.pname}</h4>
            <h5>${pro.pdesp}</h5>
        </div>
      </div>
    </div>
    </section>
    
    <!-- footer -->
    <%@include file="footer.jsp"%>
  </body>
</html>
