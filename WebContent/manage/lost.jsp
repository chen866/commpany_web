<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>找回密码</title>
    <link href="${pageContext.request.contextPath}/manage/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/manage/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/manage/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/manage/css/style.css" rel="stylesheet">
    <style>
        body {
            background: url('${pageContext.request.contextPath}/manage/img/gallery/13.jpg') no-repeat;
            background-size: cover;
            width: 100%;
            height: 100%;
        }

        #login2 {
            width: 420px;
            padding: 8% 0 0;
            margin: auto;
        }

        .marginTop {
            margin-top: 20px;
        }

        .title-text {
            color: #FFF;
        }

        .link a {
            color: #FFF;
            padding: 5px;
        }

        .link a:hover {
            color: #FFF;
        }
    </style>
</head>
<body>
<div id="login2">
    <h2 class="title-text">找回密码</h2>
    <%--<h3>后台管理</h3>--%>
    <%--<p>Perfectly designed and precisely prepared admin theme with over 50 pages with extra new web app views.
        Continually expanded and constantly improved Inspinia Admin Them (IN+)
    </p>--%>
    <%--<p>Login in. To see it in action.</p>--%>
    <form role="form" method="POST"
          action="${pageContext.request.contextPath}/login" onsubmit="return check()">
        <input type="text" class="form-control marginTop" name="uname" placeholder="用户名" required="" value="${uname}">

        <input type="password" class="form-control marginTop" name="pwd" placeholder="密码" required="">

        <input style="width:75%;" type="text" class="form-control col-md-8 marginTop" name="vcode" placeholder="验证码"
               required="">
        <img style="height:34px;" src="${pageContext.request.contextPath}/other?action=codeImage"
             class="col-md-3 marginTop" alt="点击更换" id="safecode">

        <input type="hidden" value="1" name="submit"/>
        <button type="submit" class="btn btn-primary block col-md-12 marginTop">登录</button>

    </form>

    <div class="link"><a href="#"></a></div>
    <div class="link marginTop">
        <a href="${pageContext.request.contextPath}/login?action=lost"> 忘记密码 </a>
        <a href="${pageContext.request.contextPath}/login?action=register" class="link marginTop"> 注册 </a>
    </div>
    <div class="link marginTop"><a href="${pageContext.request.contextPath}/index" class="link marginTop text-left">
        ←返回首页 </a></div>
    <!--  <p class="m-t"> <small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small> </p> -->

    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/manage/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/manage/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function check() {
            var time = new Date().getTime();
            /*$("#safecode").attr('src','





            ${pageContext.request.contextPath}/other?action=codeImage&d='+time);*/
            /* 		var r=$("input[name=vcode]");
                    r.attr('title','action=codeImage&d='); */
            return true;
        };
        $(function () {
            $("#safecode").click(function () {
                var time = new Date().getTime();
                $(this).attr('src', '${pageContext.request.contextPath}/other?action=codeImage&d=' + time);
            });
            /* 	$(".btn-primary").click(function(){
                    var time = new Date().getTime();
                    $(this).attr('src','







            ${pageContext.request.contextPath}/other?action=codeImage&d='+time);
	}); */
        });
    </script>
</body>
</html>
