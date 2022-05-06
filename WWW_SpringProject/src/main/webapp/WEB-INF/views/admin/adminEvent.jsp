<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트관리(ADMIN)</title>
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
	<div class="container" style="margin-top: 15px;">
		<h2>&emsp;&emsp;이벤트 관리</h2>
		<hr>
		<div class="row">
			
			<!-- 신규 이벤트 등록 버튼-->
			<br>
			<div class="row justify-content-end" style="margin: auto;">
			<button type="button" class="btn btn-outline-secondary" style="width: 200px; margin-right: 75px;" onclick="insert(); return false;" >새로운 이벤트 등록</button>
				<script type="text/javascript">
					function insert() {
						location.href="adminEventInsert";
					} 
				</script>
			<br>
	
			<!-- 이벤트 전체 목록 -->
			<div class="row-lg-12 p-5 bg-white rounded mb-5">
				<div class="table-responsive">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col" style=" text-align: center;">카테고리</th>
								<th scope="col" style=" text-align: center;">제목</th>
								<th scope="col" style=" text-align: center;">등록일</th>
								<th scope="col" style=" text-align: center;">관리</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="event" items="${data}">
							<tr>
								<td style=" text-align: center;">${event.category}</td>
								<td style=" text-align: center;">${event.title}</td>
								<td style=" text-align: center;">${event.regdate}</td>
								<td style=" text-align: center;">
									<button type="button" class="btn btn-outline-primary" onclick="location.href='adminEventUpdate?seq=${event.seq}'">수정</button>			
									<button type="button" class="btn btn-outline-danger" onclick="location.href='deleteEvent?seq=${event.seq}'">삭제</button>
								</td>			
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>