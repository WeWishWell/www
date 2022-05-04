<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include  file="include/ajaxFile.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실험실</title>
</head>
<body>
<input type="file" id="file" name="file"> <br><br>
<button is="submitBtn" onclick="fn_submit();">전송</button>
<img id="img"/>
</body>
</html>