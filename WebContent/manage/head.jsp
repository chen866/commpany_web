<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.request.contextPath}/manage/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/manage/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/manage/css/animate.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/manage/css/plugins/summernote/summernote.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/manage/css/plugins/summernote/summernote-bs3.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/manage/css/style.css"
	rel="stylesheet">
<style type="text/css">
.avatar {
	width: 70px;
	height: 70px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav metismenu" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span> <img alt="image" class="img-circle avatar"
								src="${pageContext.request.contextPath}/manage/img/user.png" />
							</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear"> <span class="block m-t-xs"> <strong
										class="font-bold">${user.username}</strong>
								</span> <span class="text-muted text-xs block">
										<!-- Art Director -->
								</span>
							</span>
							</a>
						</div>
						<div class="logo-element">Hua</div>
					</li>
					<li class='${p=="index"?"active":""}'><a
						href="${pageContext.request.contextPath}/manage?action=index"><i
							class="fa fa-file-text-o"></i><span class="nav-label">基本信息</span></a></li>
					<li class='${p=="banner"?"active":""}'><a
							href="${pageContext.request.contextPath}/manage?action=banner"><i
							class="fa fa-file-image-o"></i><span class="nav-label">轮播图</span></a></li>
					<li class='${p=="products"?"active":""}'><a
						href="${pageContext.request.contextPath}/manage?action=products"><i
							class="fa fa-tablet"></i><span class="nav-label">产品中心</span></a></li>
					<li class='${p=="solutions"?"active":""}'><a	
						href="${pageContext.request.contextPath}/manage?action=solutions"><i
							class="fa fa-archive"></i><span class="nav-label">解决方案</span></a></li>
					<li class='${p=="successs"?"active":""}'><a
							href="${pageContext.request.contextPath}/manage?action=successs"><i
							class="fa fa-star"></i><span class="nav-label">成功案例</span></a></li>
					<li class='${p=="contactus"?"active":""}'><a
							href="${pageContext.request.contextPath}/manage?action=contactus"><i
							class="fa fa-phone"></i><span class="nav-label">联系我们</span></a></li>
				</ul>
			</div>
		</nav>
		<div id="page-wrapper" class="gray-bg">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							href="#"><i class="fa fa-bars"></i> </a>
						<a class="btn btn-success minimalize-styl-2"
							href="${pageContext.request.contextPath}/index">门户首页</a>
						<!-- <form role="search" class="navbar-form-custom" action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..." class="form-control" name="top-search" id="top-search">
                </div>
            </form> -->
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li class="dropdown">
						<li><a
							href="${pageContext.request.contextPath}/manage?action=logout">
								<i class="fa fa-sign-out"></i> 注销
						</a></li>
					</ul>

				</nav>
			</div>