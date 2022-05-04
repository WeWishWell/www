<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%@include file="ajaxLoginCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
</head>
<body>
<div id="maindiv" class="bgColor">
	<div style="width: 310px; height: 500px; margin: auto; padding-top: 160px;">
		<div style="width: 310px; height: 200px; background-color: #ffffff; border-radius: 10px;" class="border border-1 border-light shadow-lg p-3 mb-5 bg-body">
			<form name="form" method="post" onsubmit="return false;" style="height: 200px; background-clip: content-box; padding: 10px 10px 0 10px; display: block;" >
				<div class="form-group">
					<h2 style="text-align: center;"><label for="inputID">비밀번호 확인</label></h2>
				</div>
				<div class="form-group">
					<input type="password" name="pw" class="form-control" id="inputPw" placeholder="Password" style="margin: 20px 0">
					<nav style="float: right;">
						<a href="javascript:window.history.back();" class="btn btn-secondary">Back</a>
						<button onclick="pwTrue();" class="btn btn-primary">확인</button>
					</nav>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>