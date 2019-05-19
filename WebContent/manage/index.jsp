<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- head -->
<%@include file="head.jsp"%>
<title>后台管理-${companyname}</title>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>基本信息</h2>
    </div>
    <div class="col-lg-2">
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <form method="POST" class="form-horizontal" action="${pageContext.request.contextPath}/manage?action=index">
						<c:forEach items="${dics}" var="item">
							<div class="form-group"><label class="col-sm-2 control-label">${item.name }</label>
							    <div class="col-sm-10"><input type="text" class="form-control" name="${item.tag}" value="${item.value}"></div>
							</div>
							<div class="hr-line-dashed"></div>
						</c:forEach>
						<input type="hidden" name="submit" value="1">
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                               <!--  <button class="btn btn-white" type="submit">Cancel</button> -->
                                <button class="btn btn-primary" type="submit">确定</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
   
<!-- footer	 -->
<%@include file="footer.jsp"%>