<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- head -->
<%@include file="head.jsp" %>
<title>轮播图-${companyname}</title>
<link href="${pageContext.request.contextPath}/manage/css/plugins/blueimp/css/blueimp-gallery.min.css" rel="stylesheet">
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>编辑轮播图</h2>
    </div>
    <div class="col-lg-2"></div>
</div>
<style>
    .lightBoxGallery a img {
        width: 200px;
        height: 75px;
        float: left;
    }

    .ibox-content {
        overflow: hidden;
    }

    .del {
        background: #0007;
        color: #FFF;
        width: 40px;
        height: 75px;
        float: left;
        line-height: 75px;
        padding: 5px;
        margin: 5px 5px 5px -45px;
    }
    .del a:hover{
        color: #F00;
    }
</style>
<div class="ibox-content">

    <div class="lightBoxGallery clearfloat">

        <c:forEach items="${images}" var="item" varStatus="status">
            <div>
                <a href="${pageContext.request.contextPath}${item.value}" title="轮播图${status.index+1}" data-gallery="">
                    <img src="${pageContext.request.contextPath}${item.value}">
                </a>
                <a href="manage?action=bannerdel&id=${item.key}" class="del"><i class="fa fa-recycle"></i></a>
            </div>
        </c:forEach>

        <!-- The Gallery as lightbox dialog, should be a child element of the document body -->
        <div id="blueimp-gallery" class="blueimp-gallery">
            <div class="slides"></div>
            <h3 class="title"></h3>
            <a class="prev">‹</a>
            <a class="next">›</a>
            <a class="close">×</a>
            <a class="play-pause"></a>
            <ol class="indicator"></ol>
        </div>

    </div>

</div>

<div class="row">
    <div class="col-lg-12">
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="ibox">
                <div class="ibox-content">
                    <%--					<form action="other?action=mutiFileUpload" class="dropzone" id="dropzoneForm" enctype="multipart/form-data">--%>
                    <%--						--%>
                    <%--					</form>--%>


                    <form name="uploadform" method="POST" action="other?action=mutiFileUpload"
                          ENCTYPE="multipart/form-data">
                        <input name="x" size="40" type="file" accept="image/*" style="float: left"/>
                        <input name="upload" type="submit" value="开始上传" style="float: left"/>
                    </form>


                </div>
            </div>
        </div>
    </div>
</div>
<!-- footer -->
<%@include file="footer.jsp" %>
<script src="${pageContext.request.contextPath}/manage/js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>