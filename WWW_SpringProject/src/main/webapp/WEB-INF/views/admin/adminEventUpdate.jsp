<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@include file="../include/ajaxEventAdmin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 수정</title>
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css"
    />
</head>
<body>
<div style="display: flex;">

<!-- sidebar -->
<%@ include file="../include/adminSidebar.jsp"%>

<!-- 본문 -->
<div class="pb-5">
	<div class="container">
		<div class="row" style="margin-top: 22">
			<h2>&emsp;&emsp;이벤트 수정</h2>
			<hr>
			
			<!-- 이벤트 수정 폼-->
			<br>
			<form name="form" action="adminEventUpdate" class="form-horizontal" method="post" enctype="multipart/form-data">
			
			<div class="form-group row" style="margin-top: 10px;">
				<label class="col-sm-2 col-xs-12 col-form-label" for="category">카테고리</label>
				<div class="col-sm-10 col-xs-12">
					<input type="radio" name="category" id="event1" value="[진행이벤트]"> 진행이벤트
					<input type="radio" name="category" id="event2" value="[종료이벤트]"> 종료이벤트
					<input type="radio" name="category" id="event3" value="[당첨자발표]"> 당첨자발표
					<script type="text/javascript">
						if('${requestScope.data.category}' == '[진행이벤트]') {
							document.querySelector('#event1').checked = true;
						} else if('${requestScope.data.category}' == '[종료이벤트]') {
							document.querySelector('#event2').checked = true;
						} else {
							document.querySelector('#event3').checked = true;
						}
					</script>
				</div>
			</div>	
			
			<div class="form-group row" style="margin-top: 10px;">
				<label class="col-sm-2 col-xs-12 col-form-label" for="title">제목</label>
				<div class="col-sm-10 col-xs-12">
					<input class="form-control" id="title" name="title" type="text" value="${data.title}" />
				</div>
			</div>
	
			<div class="form-group row" style="margin-top: 10px;">
				<div class="col-sm-10 col-xs-12">
					<input type="hidden" name="seq" value="${data.seq}"/>		
				</div>
			</div>
	
			<div class="form-group row" style="margin-top: 10px;">
				<label class="col-sm-2 col-xs-12 col-form-label" for="content">내용</label>
				<div class="col-sm-10 col-xs-12">
					<textarea rows="15" class="form-control" id="content" name="content">${data.content}</textarea>
				</div>
			</div>
			
			<div class="form-group row" style="margin-top: 10px;">
				<label class="col-sm-2 col-xs-12 col-form-label" for="eventfile">이미지</label>
				<div class="col-sm-10 col-xs-12">
					<input class="form-control" id="file1" name="file[0]" type="file"/>
					<input class="form-control" id="file2" name="file[1]" type="file" style="margin-top: 10px;"/>
				</div>
			</div>
	
			<div class="form-group row" style="margin-top: 10px;">
				<div class="col-sm-12" align="right">
					<button type="button" class="btn btn-success" onclick="eventImgModify1('${data.seq}');" role="button" title="수정"><i class="fa fa-save"></i>수정 완료</button>
					<a class="btn btn-secondary" href="adminEvent" role="button" title="목록"><i class="fa fa-list-ul"></i>목록</a>
				</div>
			</div>
	
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		function eventModify(){
			form.submit();
		}
	</script>

</div>
</div>
</body>
</html>