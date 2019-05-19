<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- head -->
<%@include file="head.jsp"%>
<title>${title}-${companyname}</title>
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>${title}</h2>
    </div>
    <div class="col-lg-2">
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="ibox">
                <div class="ibox-title">
                	<a href="${pageContext.request.contextPath}/manage?action=${p}" class="btn btn-default btn-xs"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><i class="fa fa-refresh"></i></font></font></a>
                	<a href="${pageContext.request.contextPath}/manage?action=${newp}" class="btn btn-primary btn-xs"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">创建</font></font></a>
                </div>
                <div class="ibox-content">
                    <div class="project-list">
                        <table class="table table-hover">
                            <tbody>
                            <c:forEach items="${pros}" var="item">
								<tr>
									<td class="project-title" style="width:50%;">
									    <a href="${pageContext.request.contextPath}/index?action=${newp}&id=${item.pid}">
										    <font style="vertical-align: inherit;">
											    <font style="vertical-align: inherit;">
												    <font style="vertical-align: inherit;">
												    	<font style="vertical-align: inherit;">${item.pname}</font>
												    </font>
											    </font>
										    </font>
									    </a>
									    <br>
									    <small>
										    <font style="vertical-align: inherit;">
											    <font style="vertical-align: inherit;">
												    <font style="vertical-align: inherit;">
												    	<font style=" width:30px;vertical-align: inherit;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${item.pcontent}</font>
												    </font>
											    </font>
										    </font>
									    </small>
									</td>
								    <td class="">${item.other}</td><td class=""></td>
								    <td class="project-actions">
								        <a href='${pageContext.request.contextPath}/index?action=${newp}&id=${item.pid}' class="btn btn-info btn-sm"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><i class="fa fa-folder"></i> 查看</font></font></font></font></a>
								        <a href='${pageContext.request.contextPath}/manage?action=${newp}&func=edit&id=${item.pid}' class="btn btn-primary btn-sm"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><i class="fa fa-pencil"></i> 编辑</font></font></font></font></a>
								        <a href='${pageContext.request.contextPath}/manage?action=${newp}s&func=del&submit=1&pid=${item.pid}' class="btn btn-danger btn-sm"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><i class="fa fa-pencil"></i> 删除</font></font></font></font></a>
								    </td>
								</tr>
							</c:forEach>
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
