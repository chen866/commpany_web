<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户注册</title>
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
    <h2 class="title-text">用户注册</h2>
    <%--<h3>后台管理</h3>--%>
    <%--<p>Perfectly designed and precisely prepared admin theme with over 50 pages with extra new web app views.
        Continually expanded and constantly improved Inspinia Admin Them (IN+)
    </p>--%>
    <p class="title-text">在这个站点上进行注册</p>
    <form role="form" method="POST"
          action="${pageContext.request.contextPath}/login" onsubmit="return check()">

        <input type="text" class="form-control " name="uname" placeholder="用户名" required="" value="${uname}">
        <div style="min-height: 23.182px;">
            <label id="uname-error" class="error" for="uname" style="color: #FFF;"></label>
            <label id="name2" style="color: #FFF;"></label>
        </div>

        <input type="email" class="form-control " name="email" placeholder="您的邮箱" required="">
        <div style="min-height: 23.182px;">
            <label id="email-error" class="error" for="email" style="color: #FFF;"></label>
            <label id="email2" style="color: #FFF;"></label>
        </div>

        <input style="width:75%;" type="text" class="form-control col-md-8  valid" name="vcode"
               placeholder="验证码"
               required="">
        <img style="height:34px;" src="${pageContext.request.contextPath}/other?action=codeImage"
             class="col-md-3" alt="点击更换" id="safecode">
        <div style="min-height: 23.182px;"><label id="vcode-error" class="error" for="vcode"
                                                  style="color: #FFF;"></label></div>
        <input type="hidden" value="1" name="submit"/>
        <button type="submit" class="btn btn-primary block col-md-12 marginTop">注册</button>
    </form>

    <p class="title-text marginTop">注册确认信将会被寄给您。</p>

    <div class="link marginTop">
        <a href="${pageContext.request.contextPath}/login?action=lost"> 忘记密码 </a>
        <a href="${pageContext.request.contextPath}/login" class="link marginTop"> 已有账号?登录 </a>
    </div>
    <div class="link marginTop"><a href="${pageContext.request.contextPath}/index" class="link marginTop text-left">
        ←返回首页 </a></div>
    <!--  <p class="m-t"> <small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small> </p> -->

    <!-- Mainly scripts -->
    <script src="${pageContext.request.contextPath}/manage/js/jquery-2.1.1.js"></script>
    <script src="${pageContext.request.contextPath}/manage/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/manage/js/plugins/validate/jquery.validate.min.js"></script>
    <script type="text/javascript">
        function check() {
            let inputuname = $("input[name=\"uname\"]");
            let inputemail = $("input[name=\"email\"]");
            let inputvcode = $("input[name=\"vcode\"]");
            let imgvcode = $("#safecode");
            let labelname2 = $("#name2");
            let labelemail2 = $("#email2");
            //判断用户名
            var result = $.ajax({
                type: "POST",
                url: "service?f=execute",
                data: {field: 'username', table: 'user'},
                async: false,
                dataType: "json"
            }).responseJSON;
            let value = inputuname.val();
            let flag = true;
            if (result.state && result.state === 1 && result.data.length > 0) {
                for (let j = 0, len = result.data.length; j < len; j++) {
                    if (result.data[j].username === value) {
                        flag = false
                    }
                }
            }
            if (flag) {
                //正常
                inputuname.removeClass('error');
                labelname2.hide();
            } else {
                //警告
                inputuname.addClass('error');
                labelname2.text("此用户名已存在");
                labelname2.show();

                return false;
            }

            //判断邮箱
            result = $.ajax({
                type: "POST",
                url: "service?f=execute",
                data: {field: 'mail', table: 'user'},
                async: false,
                dataType: "json"
            }).responseJSON;
            value = inputemail.val();
            flag = true;
            if (result.state && result.state === 1 && result.data.length > 0) {
                for (let j = 0, len = result.data.length; j < len; j++) {
                    if (result.data[j].mail === value) {
                        flag = false
                    }
                }
            }
            if (flag) {
                //正常
                inputemail.removeClass('error')
                labelemail2.hide()
            } else {
                //警告
                inputemail.addClass('error')
                labelemail2.text("此邮箱已被使用，请更换或者找回密码")
                labelemail2.show()

                return false;
            }

            //注册
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

            return flag;
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
                    uname: {
                        required: true,
                        minlength: 4,
                        maxlength: 20
                    },
                    email: {
                        required: true,
                        email: true,
                        maxlength: 30
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
