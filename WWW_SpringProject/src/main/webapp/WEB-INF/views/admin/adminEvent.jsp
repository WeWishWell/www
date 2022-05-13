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

<script type="text/javascript">
//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	var url = window.location.href.split('page')[0];
	if(url.includes('?')){ url = url + "page=" + page;} else{url = url + "?page=" + page;}
	url = url + "&range=" + range;

	location.href = url;
}

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var url = window.location.href.split('page')[0];
	if(url.includes('?')){
		url = url + "&page=" + page;
	} else {
		url = url + "?page=" + page;
	}
	url = url + "&range=" + range;

	url = url.replace('&&', '&');
	
	location.href = url;	
}

//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	var url = window.location.href.split('page')[0];
	if(url.includes('?')){ url = url + "page=" + page;} else{url = url + "?page=" + page;}
	url = url + "&range=" + range;

	location.href = url;
}
</script>
</head>
<body>

<div style="display: flex;">

<!-- sidebar -->
<%@ include file="../include/adminSidebar.jsp"%>

<!-- 본문 -->
	<div class="container" style="margin-top: 15px;">
		<h2>&emsp;&emsp;이벤트 관리</h2>
		<hr>
		<div style="margin-bottom: 20px;">
		<form method="get" name="form">
			<div class="row">
				<div class="col-7">
					<button type="button" class="btn btn-success" onclick="insert();">이벤트 등록</button>
				</div>
				<div class="input-group col">
					<select class="form-select" name="sel" id="PSsel" aria-label="Default select example">
						<option value="1">카테고리</option>
						<option value="2">제목</option>
					</select>
					<input type="text" name="val" id="PSval" class="form-control" onfocus="this.select();" style="width: 40%;" placeholder="검색어를 입력하세요">
					<input type="submit" class="btn btn-primary" value="검색">
				</div>
			</div>
		</form>
		<script type="text/javascript">
					function insert() {
						location.href="adminEventInsert"+window.location.href.split('adminEvent')[1];
					} 
		</script>
		</div>
		<div class="row">
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
									<button type="button" class="btn btn-outline-primary" onclick="location.href='adminEventUpdate?seq=${event.seq}'+window.location.href.split('adminEvent?')[1];">수정</button>			
									<button type="button" class="btn btn-outline-danger" onclick="eventDelete('${event.seq}')">삭제</button>
									<script type="text/javascript">
										function eventDelete(id) {
											if(confirm("이벤트를 삭제하면 복구할 수 없습니다. 정말 삭제하시겠습니까?")) {
												location.href='deleteEvent?seq='+id;
											}
										}
									</script>
								</td>			
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div id="paginationBox">
						<ul class="pagination justify-content-center">
							<c:if test="${pagination.prev}">
								<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
							</c:if>
				
							<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
								<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
							</c:forEach>
				
							<c:if test="${pagination.next}">
								<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
			</div>
	</div>
</div>
<script type="text/javascript">
	if('${requestScope.search.sel}' != '') {
		$('#PSsel').val('${requestScope.search.sel}');
	}
	if('${requestScope.search.val}' != '') {
		$('#PSval').val('${requestScope.search.val}');
	}
</script>
</body>
</html>