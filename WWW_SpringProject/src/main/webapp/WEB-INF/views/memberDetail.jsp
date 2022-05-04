<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>

<style type="text/css">
	.mb-3 {width: 500px; margin: 15px 0 0 50px;}
	.input-group-text {width: 90px; display: inline;}
</style>

</head>

<body>
	<div id="maindiv" class="bgColor">
		<div class="input-group mb-3">
			<h3>내 정보</h3>
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="id-form">
				아이디
			</span>
			<span class="form-control" aria-describedby="id-form">${sessionScope.data}</span>
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="name-form">
				이름
			</span>
			<span class="form-control" aria-describedby="name-form">${requestScope.data.name}</span>
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="birth-form">
				생일
			</span>
			<span class="form-control" aria-describedby="birth-form">${requestScope.data.birthday}</span>
		</div>
		<div class="input-group mb-3">
			<span class="input-group-text" id="addr-form">
				주소
			</span>
			<span class="form-control" aria-describedby="addr-form">${requestScope.data.address}</span>
		</div>
		<div class="input-group mb-3">
			<a type="button" href="pwTrue?ref=go" class="btn btn-outline-primary">정보 수정</a>
		</div>
	</div>
</body>
</html>
