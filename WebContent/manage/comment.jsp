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
    function del(id){
        // 执行 CQL 语句实现删除一个 Todo 对象
        AV.Query.doCloudQuery('delete from Comment where objectId="'+id+'"').then(function () {
            // 删除成功
            window.location.href='manage?action=comment';
        }, function (error) {
            // 异常处理
        });
    }
    AV.init("k8LPqtENcTxnGhjVsqPtM5Bi-gzGzoHsz", "3Lg3WmfcovFDeo6HYcUtqqBF");
    var cql = 'select * from Comment';
    AV.Query.doCloudQuery(cql).then(function (data) {
        // results 即为查询结果，它是一个 AV.Object 数组
        var base = $("#template").clone();
        $("#template").remove();
        $.each(data.results, function (i, n) {
            let row = base.clone();
            let parsedate = n.createdAt.getFullYear() + '-'
                + (n.createdAt.getMonth() + 1 < 10 ? '0' + (n.createdAt.getMonth() + 1) : n.createdAt.getMonth() + 1)
                + '-' + (n.createdAt.getDate() < 10 ? '0' + (n.createdAt.getDate()) : n.createdAt.getDate()) +
                ' ' + (n.createdAt.getHours() < 10 ? '0' + (n.createdAt.getHours()) : n.createdAt.getHours()) +
                ':' + (n.createdAt.getMinutes() < 10 ? '0' + (n.createdAt.getMinutes()) : n.createdAt.getMinutes());
            row.find("#pname").html(n.attributes.comment);
            row.find("#pcontent").text(n.attributes.mail);
            row.find("#other").text(parsedate);
            row.find("#dela").click(function(){
                del(n.id);
            });
            row.appendTo("#datas");//添加到模板的容器中
        });
    }, function (error) {
    });
</script>
