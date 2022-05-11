<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<%@include file="../include/ajaxProdAdmin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리(ADMIN)</title>

<script type="text/javascript">

	function prodModify(id) {
		prodModifyDo(id);
	}
	
	function prodDelete(id) {
		if(confirm("상품을 삭제하면 복구할 수 없습니다. 정말 삭제하시겠습니까?")) {
			adminProdDel(id);
		}
	}
	
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
	<%@include file="../include/adminSidebar.jsp"%>
	<div class="container" id="adminProdDiv" style="margin-top: 15px;">
		<h2>&emsp;&emsp;상품관리</h2>
		<hr>
		<div style="margin-bottom: 20px;">
		<form method="get" name="form">
			<div class="row">
				<div class="col-7">
					<button type="button" class="btn btn-success" onclick="prodCreateDo();">상품 등록</button>
				</div>
				<div class="input-group col">
					<select class="form-select" name="sel" id="PSsel" aria-label="Default select example">
						<option value="1">상품이름</option>
						<option value="2">상품분류</option>
					</select>
					<input type="text" name="val" id="PSval" class="form-control" onfocus="this.select();" style="width: 40%;" placeholder="상품명을 입력하세요">
					<input type="submit" class="btn btn-primary" value="검색">
				</div>
			</div>
		</form>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col" style="min-width: 400px;">상품 이름</th>
					<th scope="col" style="min-width: 80px; text-align: center;">가격</th>
					<th scope="col" style="min-width: 200px; text-align: center;">분류</th>
					<th scope="col" style="min-width: 200px;"></th>
				</tr>
			</thead>
			<tbody>
		<c:forEach var="prod" items="${requestScope.data}">
			<tr>
				<td>${prod.name}</td>
				<td style="text-align: center;">${prod.price}</td>
				<td style="text-align: center;">${prod.category}</td>
				<td style="text-align: center;">
					<button type="button" onclick="prodModify(${prod.id})" class="btn btn-outline-primary btn-sm">상품 수정</button>
					<button type="button" onclick="prodDelete(${prod.id})" class="btn btn-outline-danger btn-sm">상품 삭제</button>
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
<script type="text/javascript">
	if('${requestScope.search.sel}' != '') {
		$('#PSsel').val('${requestScope.search.sel}');
	}
	if('${requestScope.search.val}' != '') {
		$('#PSval').val('${requestScope.search.val}');
	}
</script>
</div>
</body>
</html>