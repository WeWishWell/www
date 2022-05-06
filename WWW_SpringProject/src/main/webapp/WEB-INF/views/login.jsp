<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/main_header.jsp"%>
<%@include file="include/ajaxLoginCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>

<body>
<div style="width: 100%; height: auto;">
	<img alt="organic" style="z-index: -1; opacity: 0.5; width: 100%; position: absolute; margin: auto;" src="resources/images/index_bg2.jpg">
	<div style="width: 310px; height: 500px; margin: auto; padding-top: 160px;">
		<div style="width: 310px; height: 300px; background-color: #ffffff; border-radius: 10px;" class="border border-1 border-light shadow-lg p-3 mb-5 bg-body">
			<form name="form" method="post" onsubmit="return false;" style="height: 300px; background-clip: content-box; padding: 20px 10px 0 10px; display: block;" >
				<div class="form-group">
					<h2 style="text-align: center;"><label for="inputID">로그인</label></h2><br>
					<input type="text" name="id" autofocus="autofocus" class="form-control" id="inputID" aria-describedby="idHelp" placeholder="ID">
				</div>
				<div class="form-group">
					<input type="password" name="pw" class="form-control" id="inputPw" placeholder="Password" style="margin: 20px 0">
					<a href="memberInsert" class="btn btn-outline-success">회원가입</a>
					<nav style="float: right;">
						<a href="javascript:window.history.back();" class="btn btn-secondary">Back</a>
						<button onclick="check();" class="btn btn-primary">로그인</button>
					</nav>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>