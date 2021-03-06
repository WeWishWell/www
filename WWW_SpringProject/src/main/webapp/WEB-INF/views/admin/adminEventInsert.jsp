<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@include file="../include/ajaxEventAdmin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css"
    />

<script type="text/javascript">
	function eventTextCheck() {
		const form = document.form;
		const cat = form.category;
		const title = form.title;
		const content = form.content;
		
		if(cat.value == '') {
			alert('이벤트 카테고리를 선택하세요.');
			return;
		} else if(title.value == '') {
			alert('이벤트 제목을 입력하세요.');
			title.focus();
			return;
		} else if(content.value == '') {
			alert('이벤트 내용을 입력하세요.');
			content.focus();
			return;
		}
		eventImgCreate1();
	}
</script>
</head>
<body>

<div style="display: flex;">

<!-- sidebar -->
<%@ include file="../include/adminSidebar.jsp"%>

<!-- 본문 -->
<div class="pb-5">
	<div class="container" style="margin-top: 15px; width: 700px;">
		<h2>&emsp;&emsp;이벤트 등록</h2>
		<hr>
		<div class="row">
			
			<!-- 신규 이벤트 등록 폼-->
			<br>
			<form name="form" action="adminEventInsert" class="form-horizontal" method="post" enctype="multipart/form-data">
			
			<div class="form-group row" style="margin-top: 10px;">
				<label class="col-sm-2 col-xs-12 col-form-label" for="category" style="padding-top: 0;">카테고리</label>
				<div class="col-sm-10 col-xs-12">
					<input type="radio" name="category" value="[진행이벤트]"/> 진행이벤트&emsp;
					<input type="radio" name="category" value="[종료이벤트]"/> 종료이벤트&emsp;
					<input type="radio" name="category" value="[당첨자발표]"/> 당첨자발표&emsp;
				</div>
			</div>	
			
			<div class="form-group row" style="margin-top: 10px;">
				<label class="col-sm-2 col-xs-12 col-form-label" for="title">제목</label>
				<div class="col-sm-10 col-xs-12">
					<input class="form-control" id="title" name="title" placeholder="제목" type="text" value="" />
				</div>
			</div>
	
			<div class="form-group row" style="margin-top: 10px;">
				<label class="col-sm-2 col-xs-12 col-form-label" for="content">내용</label>
				<div class="col-sm-10 col-xs-12">
					<textarea rows="15" class="form-control" id="content" name="content" placeholder="내용"></textarea>
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
					<button type="button" class="btn btn-success" onclick="eventTextCheck();" role="button" title="저장"><i class="fa fa-save"></i> 저장</button>
					<a class="btn btn-secondary" href="adminEvent" role="button" title="목록"><i class="fa fa-list-ul"></i>목록</a>
				</div>
			</div>
	
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		function eventIn(){
			form.submit();
		}
	</script>

</div>
</div>
</body>
</html>