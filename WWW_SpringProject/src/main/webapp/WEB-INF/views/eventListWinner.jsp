<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eventListWinner.jsp</title>
</head>
<body>
	<!-- event nav -->
	<div class="container">
	<br>
	<nav class="navbar" style="margin-left: 30px;">
	  <div class="container">
	    <span class="navbar-brand" style="font-size: 2rem;"><b>당첨자 발표</b></span>
	    <%@include file="include/eventHeader.jsp"%>
	  </div>
	</nav>
	<hr>
	
	<!-- event winner list -->
	<table class="table" style="margin: auto; width: 95%;">
	    <tr class="table-secondary">
	      <th scope="col">번호</th>
	      <th scope="col">카테고리</th>
	      <th scope="col">제목</th>
	      <th scope="col">날짜</th>
	    </tr>
	  <tbody>
    	<c:forEach var="event" items="${data}">
			<tr>
				<td>${event.seq}</td>
				<td>${event.category}</td>
				<td><a href="eventDetailWinner?seq=${event.seq}" style="text-decoration: none; color: black;">${event.title}</a></td>
				<td>${event.regdate}</td>
			</tr>
		</c:forEach>
	  </tbody>
	</table>
	
	<!-- search -->
	<form method="get" style="margin-left: 48px; margin-top: 5px;">
		<div class="input-group mb-3" style="width: 300px; position: absolute; margin-left: 85px;">
			<input type="text" class="form-control" name="keyword" placeholder="검색어를 입력하세요">
			<input type="submit" class="btn btn-secondary" value="검색">
		</div>
		<select class="form-select" name="searchType" style="width: 80px;">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
	</form>
</div>
</body>
</html>