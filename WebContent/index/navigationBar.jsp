<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 移动端导航 -->
<div class="mask"></div>
<div class="sidebar">
	<ul>
		<li ${p=="index"?" style=\"background-color:#930000;\"":""}><a
			href="${pageContext.request.contextPath}/index?action=index">首页</a></li>
		<li ${p=="product"?" style=\"background-color:#930000;\"":""}><a
			href="${pageContext.request.contextPath}/index?action=product">产品中心</a>
		</li>
		<li ${p=="solution"?" style=\"background-color:#930000;\"":""}><a
			href="${pageContext.request.contextPath}/index?action=solution">解决方案</a>
		</li>
		<li ${p=="success"?" style=\"background-color:#930000;\"":""}><a
			href="${pageContext.request.contextPath}/index?action=success">成功案例</a>
		</li>
		<li ${p=="contactus"?" style=\"background-color:#930000;\"":""}>
			<a href="${pageContext.request.contextPath}/index?action=contactus">联系我们</a>
		</li>
		<li ${p=="contactus"?" style=\"background-color:#930000;\"":""}>
			<a href="${pageContext.request.contextPath}/index?action=vote">投票</a>
		</li>
	</ul>
</div>
<c:choose>
	<c:when test='${p=="product"}'>
		<div class='main-wrapper main-wrapper-1'>
	</c:when>
	<c:when test='${p=="solution"}'>
		<div class='main-wrapper main-wrapper-2'>
	</c:when>
	<c:when test='${p=="success"}'>
		<div class='main-wrapper main-wrapper-3'>
	</c:when>
	<c:when test='${p=="contactus"}'>
		<div class='main-wrapper main-wrapper-4'>
	</c:when>
</c:choose>
<!-- header顶部导航 -->
<header>
	<div class="header-container">
		<div class="nav-box">
			<!-- logo -->
			<div class="nav-left">
				<a id="logo_top" href="#"></a>
			</div>
			<!-- memu选项 -->
			<div class="nav-mid">
				<ul class="navbar-nav">
					<li><a ${p=="index"?" class=\"active\"":""}
						href="${pageContext.request.contextPath}/index?action=index">首页</a>
					</li>
					<li><a ${p=="product"?" class=\"active\"":""}
						href="${pageContext.request.contextPath}/index?action=product">产品中心</a>
					</li>
					<li><a ${p=="solution"?" class=\"active\"":""}
						href="${pageContext.request.contextPath}/index?action=solution">解决方案</a>
					</li>
					<li><a ${p=="success"?" class=\"active\"":""}
						href="${pageContext.request.contextPath}/index?action=success">成功案例</a>
					</li>
					<li><a ${p=="contactus"?" class=\"active\"":""}
						href="${pageContext.request.contextPath}/index?action=contactus">联系我们</a>
					</li>
					<li>
						<a ${p=="vote"?" class=\"active\"":""}
						href="${pageContext.request.contextPath}/index?action=vote">投票</a>
					</li>
				</ul>
			</div>
			<!-- 响应式菜单 -->
			<div class="nav-mobile-menu">
				<span class="sidebar_trigger"></span>
			</div>
		</div>
	</div>
</header>
<!-- advert组件 -->
${p!="index"?"<div class='advert'><h1></h1><h2></h2></div></div>":""}
