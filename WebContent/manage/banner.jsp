<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- head -->
<%@include file="head.jsp"%>
<title>轮播图片-${companyname}</title>
<link href="${pageContext.request.contextPath}/manage/css/plugins/dropzone/basic.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/manage/css/plugins/dropzone/dropzone.css" rel="stylesheet">
<style>
.note-editor {
	border: 1px solid #e5e6e7;
}
/* .note-editor:focus{
	border: 1px solid #1BB394;
} */
.note-editable {
	min-height: 200px;
}
</style>
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-10">
		<h2>编辑轮播图片</h2>
	</div>
	<div class="col-lg-2"></div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="wrapper wrapper-content animated fadeInUp">
			<div class="ibox">
				<div class="ibox-content">
						<form id="my-awesome-dropzone" class="dropzone dz-clickable" action="other?f=mutiFileUpload">
							<div class="dropzone-previews"></div>
							<button type="submit" class="btn btn-primary pull-right">Submit this form!</button>
							<div class="dz-default dz-message"><span>Drop files here to upload</span></div></form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- footer	 -->
<%@include file="footer.jsp"%>
<script src="${pageContext.request.contextPath}/manage/js/plugins/dropzone/dropzone.js"></script>