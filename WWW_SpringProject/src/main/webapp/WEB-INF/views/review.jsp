<%@page import="com.wewishwell.shop.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="include/header.jsp"%>
<%
@SuppressWarnings("unchecked")
List<ReviewVO> reviews = (List<ReviewVO>)request.getAttribute("reviews");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reviews</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style type="text/css">
	p {max-height: 50px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; white-space: normal; word-wrap: break-word;}
	.inner-star::before{color: #FF9600;}
	.outer-star {position: relative;display: inline-block;color: #CCCCCC;}
	.inner-star {position: absolute;left: 0;top: 0;width: 0%;overflow: hidden;white-space: nowrap;}
	.outer-star::before, .inner-star::before {content: '\f005 \f005 \f005 \f005 \f005';font-family: 'Font Awesome 5 free';font-weight: 900;}
</style>
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
<div style="width: 1160px; margin: auto;">
	<h2>&emsp;&emsp;리뷰</h2>
	<hr>
	<div class="row" style="margin-left: 40px;">
		<%
		for(int i=reviews.size()-1; i>=0; i--) { 
			%>
			<div class="card rounded-0" style="width: 240px; padding: 0; margin: 0 40px 20px 0;">
				<%double s = Math.random();%>
			  <img src="resources/images/pro_<%=reviews.get(i).getProd_id()%>.png?a=<%=s%>" alt="img">
			  <div class="card-body">
			    <h5 class="card-title"><b><%=reviews.get(i).getTitle()%></b></h5>
			    <p><b><%=reviews.get(i).getProd_name()%></b></p>
			    <hr>
			    <p class="card-text"><%=reviews.get(i).getContent()%></p>
			    <a href="javascript:return false;" data-bs-toggle="modal" data-bs-target="#modal<%=reviews.get(i).getNum()%>" style="text-decoration: none;">자세히</a>
			  </div>
			</div>
			
			<div class="modal fade" id="modal<%=reviews.get(i).getNum()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel"><%=reviews.get(i).getUser_id()%>님의 리뷰</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      	<div style="position: absolute; margin-left: 190px;">
				      	<h5 class="card-title"><b><%=reviews.get(i).getTitle()%></b></h5>
				   		<p><b><%=reviews.get(i).getProd_name()%></b></p>
						<div class='RatingStar' id='rating<%=i%>'>
						  <div class='RatingScore'>
						    <div class='outer-star'><div class='inner-star' id='star<%=i%>'></div></div>
						    ( <%=reviews.get(i).getStar()%> )
						  </div>
						</div>
						<script type="text/javascript">
							ratings = {RatingScore: <%=reviews.get(i).getStar()%>}
							totalRating = 5;
							table = document.querySelector('#rating<%=i%>');
							function rateIt() {
								for (rating in ratings) {
									ratingPercentage = ratings[rating] / totalRating * 100;
									ratingRounded = ratingPercentage + '%';
									star = table.querySelector('#star<%=i%>');
									star.style.width = ratingRounded;
									}
								}
							rateIt();
						</script>
			   		</div>
			        <img src="resources/images/pro_<%=reviews.get(i).getProd_id()%>.png" style="width: 180px;" alt="img">
			        <hr>
			        <span><%=reviews.get(i).getContent()%></span>
			      </div>
			    </div>
			  </div>
			</div>
		<% } %>
		
	</div>
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
</body>
</html>