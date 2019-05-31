<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- head -->
<%@include file="head.jsp"%>
<title>评论列表</title>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>评论列表</h2>
    </div>
    <div class="col-lg-2">
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="ibox">
                <div class="ibox-content">
                    <div class="project-list">
                        <table class="table table-hover">
                            <tbody id="datas">
                                <tr id="template">
                                    <td class="project-title" style="width:50%;">
                                        <a href="#">
                                            <font style="vertical-align: inherit;">
                                                <font style="vertical-align: inherit;">
                                                    <font style="vertical-align: inherit;">
                                                        <font style="vertical-align: inherit;" id="pname"></font>
                                                    </font>
                                                </font>
                                            </font>
                                        </a>
                                        <br>
                                        <small>
                                            <font style="vertical-align: inherit;">
                                                <font style="vertical-align: inherit;">
                                                    <font style="vertical-align: inherit;">
                                                        <font style=" width:30px;vertical-align: inherit;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" id="pcontent"></font>
                                                    </font>
                                                </font>
                                            </font>
                                        </small>
                                    </td>
                                    <td class="" id="other"></td><td class=""></td>
                                    <td class="project-actions">
                                        <a href='javascript:void(0);' class="btn btn-danger btn-sm" id="dela"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><i class="fa fa-pencil"></i> 删除</font></font></font></font></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- footer	 -->
<%@include file="footer.jsp"%>

<!--Leancloud 操作库:-->
<script src="${pageContext.request.contextPath}/index/js/av-min.js"></script>
<script>
    //删除方法定义
    function del(id){
        // 执行 CQL 语句实现删除一个评论对象
        AV.Query.doCloudQuery('delete from Comment where objectId="'+id+'"').then(function () {
            // 删除成功
            window.location.href='manage?action=comment';
        }, function (error) {
            // 异常处理
        });
    }
    //初始化环境
    AV.init("k8LPqtENcTxnGhjVsqPtM5Bi-gzGzoHsz", "3Lg3WmfcovFDeo6HYcUtqqBF");
    //查询语句
    var cql = 'select * from Comment';
    //查询操作
    AV.Query.doCloudQuery(cql).then(function (data) {
        //then 执行后的回调函数

        //复制 jquery筛选出来的id为template的html对象，复制并赋给base变量
        var base = $("#template").clone();
        //移除 jquery筛选出来的id为template的html对象
        $("#template").remove();
        // results 即为查询结果，它是一个 AV.Object 数组
        $.each(data.results, function (i, n) {
            //复制base变量，赋值给row变量
            let row = base.clone();
            //格式化时间对象，赋值给parsedate
            let parsedate = n.createdAt.getFullYear() + '-'
                + (n.createdAt.getMonth() + 1 < 10 ? '0' + (n.createdAt.getMonth() + 1) : n.createdAt.getMonth() + 1)
                + '-' + (n.createdAt.getDate() < 10 ? '0' + (n.createdAt.getDate()) : n.createdAt.getDate()) +
                ' ' + (n.createdAt.getHours() < 10 ? '0' + (n.createdAt.getHours()) : n.createdAt.getHours()) +
                ':' + (n.createdAt.getMinutes() < 10 ? '0' + (n.createdAt.getMinutes()) : n.createdAt.getMinutes());
            //将data.results的子项n的attributes属性中的comment属性添加到   在row变量中找到id为pname的html对象的开始和结束标签之间的 HTML
            row.find("#pname").html(n.attributes.comment);
            //将data.results的子项n的attributes属性中的mail属性添加到   在row变量中找到id为pcontent的html对象的开始和结束标签之间的 文本
            row.find("#pcontent").text(n.attributes.mail);
            row.find("#other").text(parsedate);
            row.find("#dela").click(function(){
                del(n.id);
            });
            //将row对象添加到 id为datas的html子项中
            row.appendTo("#datas");
        });
    }, function (error) {
    });
</script>
