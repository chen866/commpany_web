<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<footer>
		<div class="footer-box clearfix">
			<div class="footer-left">
				<span class="globle"></span>
			</div>
			<div class="footer-right">
				<div class="footer-laber">
					<ul>
						<li><a href="${pageContext.request.contextPath}/index?action=index">首页</a></li>
						<li><a href="${pageContext.request.contextPath}/index?action=product">产品中心</a></li>
						<li><a href="${pageContext.request.contextPath}/index?action=solution">解决方案</a></li>
					</ul>
					<ul>
						<li><a href="${pageContext.request.contextPath}/index?action=success">成功案例</a></li>
						<li><a href="${pageContext.request.contextPath}/index?action=contactus">联系我们</a></li>
						<li><a href="${pageContext.request.contextPath}/manage?action=index">后台管理</a></li>
						<!-- <li><a href="${pageContext.request.contextPath}/demo/index.html">后台管理</a></li>-->
					</ul>
					<ul>
						<li class="footer-contact">邮箱： ${email}</li>
						<li class="footer-contact">电话： ${phone}</li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!-- 版权信息 -->
	<div class="container copy">
		<div class="row">
			<div class="col-md-12 text-center">
				<p class="copyright">
					${footer}
				</p>
			</div>
		</div>
	</div>
	<!-- 返回顶部按钮 -->
	<button class="back-to-top" style="display: none;"></button>
	<!-- 框架库加载 -->
	<script src="${pageContext.request.contextPath}/index/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/index/js/bootstrap.min.js"></script>
	<!-- 脚本加载 -->
	<script src="${pageContext.request.contextPath}/index/js/main.js"></script>