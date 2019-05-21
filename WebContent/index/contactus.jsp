<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>联系我们-${companyname}</title>
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
			</div>
		</div>
	</section>

	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>