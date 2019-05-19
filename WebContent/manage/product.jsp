<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- head -->
<%@include file="head.jsp"%>
<title>${title}-${companyname}</title>
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
		<h2>${title}</h2>
	</div>
	<div class="col-lg-2"></div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="wrapper wrapper-content animated fadeInUp">
			<div class="ibox">
				<div class="ibox-content">
					<form method="POST" class="form-horizontal" action="${action}"
						id="form" onsubmit="return check()">
						<div class="form-group">
							<label class="col-sm-2 control-label">${typename}名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="pname"
									value="${pro.pname}">
							</div>
						</div>
						<div class="hr-line-dashed"></div>

						<div class="form-group">
							<label class="col-sm-2 control-label">${typename}简介</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="pcontent"
									value="${pro.pcontent}">
							</div>
						</div>
						<div class="hr-line-dashed"></div>

						<div class="form-group">
							<label class="col-sm-2 control-label">${typename}详情</label>
							<div class="col-sm-10">
								<div id="summernote" class="summernote">${pro.pdesc}</div>
							</div>
						</div>
						<div class="hr-line-dashed"></div>

						<input type="hidden" name="submit" value="1"> <input
							type="hidden" name="pid" value="${pro.pid}">
						<div class="form-group">
							<div class="col-sm-4 col-sm-offset-2">
								<!--  <button class="btn btn-white" type="submit">Cancel</button> -->
								<button class="btn btn-primary" type="submit">确定</button>
							</div>
						</div>
					</form>
					<div style="display: none;" class="note-editable2">${pro.pdesp}</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/manage/js/form.js"></script>
<!-- footer	 -->
<%@include file="footer.jsp"%>