<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eventWinnerDetail.jsp</title>
</head>
<body>
	<div class="container">
		<!-- event nav -->
		<br>
		<nav class="navbar" style="margin-left: 30px;">
		  <div class="container">
		    <span class="navbar-brand" style="font-size: 2rem;"><b>당첨자 발표</b></span>
		    <%@include file="include/eventHeader.jsp"%>
		  </div>
		</nav>
		<hr>
		<!-- event winner detail -->
		<table class="table" style="margin: auto; width: 95%;">
		  <thead>
		    <tr class="table-secondary">
		      <th scope="col">${data.category} ${data.title}</th>
		    </tr>
		  </thead>
		  <tbody>
				<tr>
					<td><b>${data.writer}</b> | ${data.regdate}</td>
				</tr>
				<tr>
					<td>${data.content}</td>
				</tr>
		  </tbody>
		</table>
		
		<!-- event winner list btn -->
		<div align="center" style="margin-top: 10px;">
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='eventListWinner'">목록</button>
		</div>
	</div>
</body>
</html>