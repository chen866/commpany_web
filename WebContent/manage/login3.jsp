<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录后台</title>
    <link href="${pageContext.request.contextPath}/manage/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/manage/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/manage/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/manage/css/style.css" rel="stylesheet">
</head>
<body class="gray-bg" >
<div id="login">
     <div class="text-center loginscreen animated fadeInDown">
            <!-- <div>	
                <h2 class="">后台管理</h2>
            </div> -->
            <div>
                <h1 class="logo-name">
	                <font style="vertical-align: inherit;">
	                <font style="vertical-align: inherit;">HuaShen</font>
	                </font>
                </h1>
            </div>
            <h3>后台管理</h3>
            <!--<p>Perfectly designed and precisely prepared admin theme with over 50 pages with extra new web app views.
                Continually expanded and constantly improved Inspinia Admin Them (IN+)
            </p>-->
            <!-- <p>Login in. To see it in action.</p> -->
            <form class="col-md-6 center" style="margin:0 auto;float:none" role="form" method="POST" action="${pageContext.request.contextPath}/manage?action=login" onsubmit="return check()">
                <div class="form-group col-md-12">
                    <input type="text" class="form-control" name="uname" placeholder="用户名" required="" value="${uname}">
                </div>
                <div class="form-group col-md-12">
                    <input type="password" class="form-control" name="pwd" placeholder="密码" required="">
                </div>
                <div class="form-group col-md-12">
                    <input style="width:75%;" type="text" class="form-control col-md-9" name="vcode" placeholder="验证码" required="" >
                    <img style="height:34px;" src="${pageContext.request.contextPath}/other?action=codeImage" class="col-md-3" alt="点击更换" id="safecode">
                </div>
                <div class="form-group col-md-12">
                <input type="hidden" value="1" name="submit"/>
                <button type="submit" class="btn btn-primary block col-md-12">登录</button>
                </div>

                <!-- <a href="login.html#"><small>忘记密码</small></a>
                <p class="text-muted text-center"><small>Do not have an account?</small></p>
                <a class="btn btn-sm btn-white btn-block" href="register.html">Create an account</a> -->
            </form>
           <!--  <p class="m-t"> <small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small> </p> -->
    </div>
    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/manage/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/manage/js/bootstrap.min.js"></script>
    <script type="text/javascript">
	function check(){
        var time = new Date().getTime();
		//$("#safecode").attr('src','${pageContext.request.contextPath}/other?action=codeImage&d='+time);
/* 		var r=$("input[name=vcode]");
		r.attr('title','action=codeImage&d='); */
		return true;
	};
    $(function(){
	$("#safecode").click(function(){
        var time = new Date().getTime();
		$(this).attr('src','${pageContext.request.contextPath}/other?action=codeImage&d='+time);
	});	
/* 	$(".btn-primary").click(function(){
        var time = new Date().getTime();
		$(this).attr('src','${pageContext.request.contextPath}/other?action=codeImage&d='+time);
	}); */
    });
	</script>
</body>
</html>
