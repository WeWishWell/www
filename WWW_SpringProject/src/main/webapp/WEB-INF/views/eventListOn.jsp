<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event.jsp</title>
</head>
<body>
	<!-- event nav -->
	<div class="container">
	<br>
	<nav class="navbar" style="margin-left: 30px;">
	  <div class="container">
	    <span class="navbar-brand" style="font-size: 2rem;"><b>진행중인 이벤트</b></span>
	    <%@include file="include/eventHeader.jsp"%>
	  </div>
	</nav>
	<hr>
	
	<!-- event on list -->
	<div class="row">
	<c:forEach var="event" items="${data}">
	<div class="card" style="width: 47%; margin: 0 1.5% 10px 1.5%; padding: 0;">
		<%double s = Math.random();%>
		<a href="eventDetail?seq=${event.seq}"><img src="resources/images/event_${event.seq}.png?a=<%=s%>" class="card-img-top" alt="..."></a>
		<div class="card-body">
			<a href="eventDetail?seq=${event.seq}" class="card-title" style="font-size: 1.25rem; text-decoration: none; color: black;"><b>${event.title}</b></a>
			<p class="card-text">${event.content}</p>
		</div>
	</div>
	<br>
	</c:forEach>
	</div>
	
	 <!-- 검색결과 없는 경우 -->
    	<div class="text-center" id="searchnone" style="display: none; margin-top: 5%">
			<img src="resources/images/not_search.png" class="rounded" alt="" style="max-width: 10%;">
			<h4 style="margin-top: 35;">진행중인 이벤트가 없습니다.</h4>					
		</div>
        <script type="text/javascript">
        	if('${data}'== '[]'){
        		document.querySelector('#searchnone').style.display = "";
        	}
        </script>
	
	</div>

</body>
</html>