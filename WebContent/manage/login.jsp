<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录</title>
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
            margin-top: 10px;
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
    <h2 class="title-text">用户登录</h2>
    <%--<h3>后台管理</h3>--%>
    <%--<p>Perfectly designed and precisely prepared admin theme with over 50 pages with extra new web app views.
        Continually expanded and constantly improved Inspinia Admin Them (IN+)
    </p>--%>
    <p class="title-text">登录后台进行后台操作</p>
    <form role="form" method="POST"
          action="${pageContext.request.contextPath}/manage" onsubmit="return check()">
        <input type="text" class="form-control" name="uname" placeholder="用户名" required="" value="${uname}">
        <div style="min-height: 23.182px;">
            <label id="uname-error" class="error" for="uname" style="color: #FFF;"></label>
            <label id="name2" style="color: #FFF;"></label>
        </div>

        <input type="password" class="form-control" name="pwd" placeholder="密码" required="">
        <div style="min-height: 23.182px;">
            <label id="pwd-error" class="error" for="pwd" style="color: #FFF;"></label>
            <label id="pwd2" style="color: #FFF;"></label>
        </div>

        <input style="width:75%;" type="text" class="form-control col-md-8 valid" name="vcode"
               placeholder="验证码"
               required="">
        <img style="height:34px;" src="${pageContext.request.contextPath}/other?action=codeImage"
             class="col-md-3" alt="点击更换" id="safecode">
        <div style="min-height: 23.182px;">
            <label id="vcode-error" class="error" for="vcode" style="color: #FFF;"></label>
            <label id="vcode2" style="color: #FFF;"></label>
        </div>

        <%--<input type="hidden" value="1" name="submit"/>--%>
        <button type="submit" class="btn btn-primary block col-md-12 marginTop">登录</button>

    </form>
    <div class="link"><a href="#"></a></div>
<%--    <div class="link marginTop">--%>
<%--        <a href="${pageContext.request.contextPath}/login?action=lost"> 忘记密码 </a>--%>
<%--        <a href="${pageContext.request.contextPath}/login?action=register" class="link marginTop"> 注册 </a>--%>
<%--    </div>--%>
    <div class="link marginTop"><a href="${pageContext.request.contextPath}/index" class="link marginTop text-left">
        ←返回首页 </a></div>
    <!--  <p class="m-t"> <small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small> </p> -->

    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/manage/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/manage/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/manage/js/plugins/validate/jquery.validate.min.js"></script>
    <script type="text/javascript">
        function check() {
            //登录
            let inputuname = $("input[name=\"uname\"]");
            let inputpwd = $("input[name=\"pwd\"]");
            let inputvcode = $("input[name=\"vcode\"]");
            let imgvcode = $("#safecode");
            let result = $.ajax({
                type: "POST",
                url: "service?f=login",
                data: {uname: inputuname.val(), pwd: inputpwd.val(), vcode: inputvcode.val()},
                async: false,
                dataType: "json"
            }).responseJSON;
            let flag = true;
            if (result.state && result.state === 1) {
                //正常
                inputuname.removeClass('error');
                $('#name2').hide();
                inputpwd.removeClass('error');
                $('#pwd2').hide();
                return true;
            } else {
                let labelname2 = $('#name2');
                let labelpwd2 = $('#pwd2');
                let labelvcode2 = $('#vcode2');
                if (result.data === 1) {
                    //警告
                    inputuname.addClass('error');
                    labelname2.text("用户名或密码错误");
                    labelname2.show();
                    inputpwd.addClass('error');
                    labelpwd2.text("用户名或密码错误");
                    labelpwd2.show();
                    inputvcode.removeClass('error');
                    labelvcode2.hide();
                    imgvcode.click();
                    return false;
                } else if (result.data === 2) {
                    //警告
                    inputvcode.addClass('error');
                    labelvcode2.text("验证码错误");
                    labelvcode2.show();
                    inputuname.removeClass('error');
                    labelname2.hide();
                    inputpwd.removeClass('error');
                    labelpwd2.hide();
                    imgvcode.click();
                    return false;
                }
            }
            return false;
        }

        $(document).ready(function () {
            //验证码
            $("#safecode").click(function () {
                var time = new Date().getTime();
                $(this).attr('src', '${pageContext.request.contextPath}/other?action=codeImage&d=' + time);
            });

            //自定义一个验证方法
            $.validator.addMethod(
                //验证方法名称
                "formula",
                //验证规则
                function (value, element, param) {
                    return value.length === 4;
                },
                //验证提示信息
                '请输入4位的验证码'
            );

            //表单验证
            $("form").validate({
                rules: {
                    pwd: {
                        required: true,
                        minlength: 4,
                        maxlength: 20
                    },
                    uname: {
                        required: true,
                        minlength: 4,
                        maxlength: 20
                    },
                    vcode: {
                        required: true,
                        formula: true
                    }
                }
            });
        })
    </script>
</body>
</html>
