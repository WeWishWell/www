<%@page import="com.wewishwell.shop.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<div style="width: 1160px; margin: auto;">
	<h2>&emsp;&emsp;리뷰</h2>
	<hr>
	<div class="row" style="margin-left: 40px;">
		<%
		int i=0;
		for(ReviewVO rv : reviews) { 
			i++;%>
			<div class="card rounded-0" style="width: 240px; padding: 0; margin: 0 40px 20px 0;">
				<%double s = Math.random();%>
			  <img src="resources/images/pro_<%=rv.getProd_id()%>.png?a=<%=s%>" alt="img">
			  <div class="card-body">
			    <h5 class="card-title"><b><%=rv.getTitle()%></b></h5>
			    <p><b><%=rv.getProd_name()%></b></p>
			    <hr>
			    <p class="card-text"><%=rv.getContent()%></p>
			    <a href="javascript:return false;" data-bs-toggle="modal" data-bs-target="#modal<%=rv.getNum()%>" style="text-decoration: none;">자세히</a>
			  </div>
			</div>
			
			<div class="modal fade" id="modal<%=rv.getNum()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel"><%=rv.getUser_id()%>님의 리뷰</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      	<div style="position: absolute; margin-left: 190px;">
				      	<h5 class="card-title"><b><%=rv.getTitle()%></b></h5>
				   		<p><b><%=rv.getProd_name()%></b></p>
						<div class='RatingStar' id='rating<%=i%>'>
						  <div class='RatingScore'>
						    <div class='outer-star'><div class='inner-star' id='star<%=i%>'></div></div>
						    ( <%=rv.getStar()%> )
						  </div>
						</div>
						<script type="text/javascript">
							ratings = {RatingScore: <%=rv.getStar()%>}
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
			        <img src="resources/images/pro_<%=rv.getProd_id()%>.png" style="width: 180px;" alt="img">
			        <hr>
			        <span><%=rv.getContent()%></span>
			      </div>
			    </div>
			  </div>
			</div>
		<% } %>
	</div>
</div>
</body>
</html>