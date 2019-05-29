<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>投票-${companyname}</title>
<!-- head -->
<%@include file="head.jsp"%>
<link href="${pageContext.request.contextPath}/index/css/page.css"
	rel="stylesheet">
<style>
.info, .markdown {
	Opacity: 0;
}
</style>
</head>
<body onload="vote();">
	<!-- 导航条 -->
	<%@include file="navigationBar.jsp"%>

	<!-- section -->
	<section>
		<div class="box clearfix">
			<div class="box-left">
				<div class="title">
					<h3>投票</h3>
				</div>
				<ul>
					<li><a href="#">${companyname}</a></li>
				</ul>
			</div>
			<div class="box-right">
				<div class="box-right-top">
					<ul>
						<li>当前位置&nbsp></li>
						<li>投票&nbsp</li>
					</ul>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span
						class="c-red"></span>问题:</label>
					<ins id="vote"></ins>
					<!-- <div class="formControls col-xs-3 col-sm-4">
						<input type="text" class="input-text radius size-S" value=""
							readonly="true" placeholder="" id="vote_quest" name="vote_quest"> -->
					<input type="hidden" class="input-text radius size-S" value=""
						readonly="true" placeholder="" id="vote_id" name="vote_quest">
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span
						class="c-red"></span>满意程度:</label> <label><input type="radio"
						name="state" value="1">非常满意</label> <label><input
						type="radio" name="state" value="2">一般满意</label> <label><input
						type="radio" name="state" value="3">不满意</label>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-2"><span
						class="c-red"></span></label>
					<button onclick="sendvote();">确认投票</button>

				</div>
               <div class="row cl" id=sumtotal>

				</div>
			</div>

		</div>
		</div>
	</section>


	<!-- footer -->
	<%@include file="footer.jsp"%>

	<!--载入js，在</body>之前插入即可-->
	<!--Leancloud 操作库:-->
	<script src="${pageContext.request.contextPath}/index/js/av-min.js"></script>
	<!--Valine 的核心代码库-->
	<script src="${pageContext.request.contextPath}/index/js/Valine.min.js"></script>
	<script>
function  vote(){
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/service?f=survey_list",
		async:false,
		success:function(data) {
			if(data.code=="0"){
				var jsar = data.surveyList
				 $.each(jsar,function(j,val){
					var a=val.content; 
					// document.getElementById('vote_quest').value=val.content; 
					   document.getElementById('vote').innerText = a;
					 document.getElementById('vote_id').value=val.id; 
                });
			}
		},
		error : function(res) {
			confirm("获取投票问题失败");
		}
	});
	}
function  sendvote(){
	var id= document.getElementById('vote_id').value;
	var agree=$('input:radio:checked').val();
	var form ={"surveyId":id,"isAgree":agree}
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/service?f=survey_submit",
		data:JSON.stringify(form),
		dataType : "json",
		contentType : "application/json;charset=UTF-8", //设置请求头信息{"surveyId":id,"isAgree":agree}
		async:false,
		success:function(data) {
			if(data.code=="0"){
				confirm("投票成功！");
				gettotal(1);
				gettotal2(2);
				gettotal3(3);
			}
			if(data.code!="0"){
				confirm("投票失败！");
			}
		},
		error : function(res) {
			confirm("投票失败");
		}
	});
	}
function  gettotal(ag){
	var form1 ={"isAgree":ag}
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/service?f=survey_total",
		data:JSON.stringify(form1),
		dataType : "json",
		contentType : "application/json;charset=UTF-8", //设置请求头信息{"surveyId":id,"isAgree":agree}
		async:false,
		success:function(data) {
			if(data.code=="0"){
				$("#sumtotal").empty();
				 $("#sumtotal").append("<div class='row cl'> <label class='form-label col-xs-3 col-sm-2'>"
			   				+ "<span class='c-red'>*</span>非常满意：</label>"
			   				+ "<div class='formControls col-xs-4 col-sm-2'>"
			   				+data.total 
			   				+ "</div>");
			}
			if(data.code!="0"){
			}
		}
	});
	}
function  gettotal2(ag){
	var form1 ={"isAgree":ag}
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/service?f=survey_total",
		data:JSON.stringify(form1),
		dataType : "json",
		contentType : "application/json;charset=UTF-8", //设置请求头信息{"surveyId":id,"isAgree":agree}
		async:false,
		success:function(data) {
			if(data.code=="0"){
				
				 $("#sumtotal").append("<div class='row cl'> <label class='form-label col-xs-3 col-sm-2'>"
			   				+ "<span class='c-red'>*</span>一般满意：</label>"
			   				+ "<div class='formControls col-xs-4 col-sm-2'>"
			   				+data.total
			   				+ "</div>");
			}
			if(data.code!="0"){
			}
		}
	});
	}
function  gettotal3(ag){
	var form1 ={"isAgree":ag}
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/service?f=survey_total",
		data:JSON.stringify(form1),
		dataType : "json",
		contentType : "application/json;charset=UTF-8", //设置请求头信息{"surveyId":id,"isAgree":agree}
		async:false,
		success:function(data) {
			if(data.code=="0"){
				 $("#sumtotal").append("<div class='row cl'> <label class='form-label col-xs-3 col-sm-2'>"
			   				+ "<span class='c-red'>*</span>不满意：</label>"
			   				+ "<div class='formControls col-xs-4 col-sm-2'>"
			   				+data.total
			   				+ "</div>");
			}
			if(data.code!="0"){
			}
		}
	});
	}
</script>
</body>
</html>