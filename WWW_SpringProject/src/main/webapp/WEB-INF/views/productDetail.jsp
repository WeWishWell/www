<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<%@ include file="include/ajaxCheck.jsp"%>
<%@ include file="include/ajaxReview.jsp"%>
<%@ include file="include/productdetail_review_css.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productDetail.jsp</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script type="text/javascript">
	function changesort(){
		var langSelect = document.getElementById("selectbox"); 
		var selectValue = langSelect.options[langSelect.selectedIndex].value;
		if(selectValue === '별점순'){
			document.querySelector("#reviews_by_date").hidden = true;
			document.querySelector("#reviews_by_star").hidden = false;
		}else if(selectValue === '최신순'){
			document.querySelector("#reviews_by_date").hidden = false;
			document.querySelector("#reviews_by_star").hidden = true;
		}
			
	}
	function cntCheck() {
		const cnt = document.querySelector('#out_cnt').innerText;
		
		if(cnt == '' || cnt == '선택') {
			alert('수량을 입력하세요.');
			return 0;
		}
	}
	
	function buyBtn() {
		const check = cntCheck();
		if(check != 0) {
			location.href = 'purchaseOne?user_id=${sessionScope.data}&prod_id=${data.id}&prod_name=${data.name}&p_p=${data.price}&p_c='+document.querySelector('#out_cnt').innerText;
		}
		
	}
	
	function modal() {
		const check = cntCheck();
		if(check != 0) {
				basketCheck();
		}
	}
	
	function like() {
		if(!isNaN('${sessionScope.data}')) {
			if (window.confirm("로그인 회원만 찜 기능을 사용할 수 있습니다. 로그인 페이지로 이동하시겠습니까?")) {
				  location.href = "logIn";
			}
		} else {
			if(document.querySelector('#jjim').className == 'btn btn-danger') {
				likeDelete();
			} else {
				likeInsert();
			}
		}
	}
	
	var get_recent_items = getCookie("recent_view_items");
	if(get_recent_items == null){
	var set_recent_items = setCookie("recent_view_items",${data.id},1);
	}else{
	const getarr_recent_items =getCookie("recent_view_items").split(',');
	var check_recent_items = getarr_recent_items.indexOf('${data.id}');
		if(check_recent_items == -1){
		var update_recent_items = get_recent_items+","+${data.id};
		setCookie("recent_view_items",update_recent_items,1);
		}else{
		getarr_recent_items.splice(check_recent_items,1);
		var update_recent_items = getarr_recent_items+","+${data.id};
		setCookie("recent_view_items",update_recent_items,1);
		} 
	}
	

	
	function checklikecntvalue(number) {
		var checkreviewvo = getcntlike(number);
		var checkreviewvo_num = checkreviewvo.num;
		var checkreviewvo_like = checkreviewvo.like;
		
		<c:forEach var="review" items="${review}" varStatus="status">
		if(${review.num}==checkreviewvo_num){
			document.querySelector('#cntlike${status.index}').innerText = checkreviewvo_like;
		}
		</c:forEach>
		
		<c:forEach var="review" items="${reviewlist_by_star}" varStatus="status">
		if(${review.num}==checkreviewvo_num){
			document.querySelector('#cntlike_by_star${status.index}').innerText = checkreviewvo_like;
		}
		</c:forEach>
		
		
	}
	
	function checklikecntvalue_by_star(number) {
		var checkreviewvo = getcntlike_by_star(number);
		var checkreviewvo_num = checkreviewvo.num;
		var checkreviewvo_like = checkreviewvo.like;
		
		<c:forEach var="review" items="${review}" varStatus="status">
		if(${review.num}==checkreviewvo_num){
			document.querySelector('#cntlike${status.index}').innerText = checkreviewvo_like;
		}
		</c:forEach>
		
		<c:forEach var="review" items="${reviewlist_by_star}" varStatus="status">
		if(${review.num}==checkreviewvo_num){
			document.querySelector('#cntlike_by_star${status.index}').innerText = checkreviewvo_like;
		}
		</c:forEach>
		
		
	}
	function unclickevent(number){
		var reviewlike_num =document.querySelector('#reviewnum'+number).innerText;
		<c:forEach var="review" items="${review}" varStatus="status">
		if(${review.num}==reviewlike_num){
				document.querySelector('#thumb_up${status.index}').className = 'thumbs';
				document.querySelector('#thumb_down${status.index}').className = 'thumbs';	
			}
		</c:forEach>
		
		<c:forEach var="review" items="${reviewlist_by_star}" varStatus="status">
		if(${review.num}==reviewlike_num){
				document.querySelector('#thumb_up_by_star${status.index}').className = 'thumbs';
				document.querySelector('#thumb_down_by_star${status.index}').className = 'thumbs';	
			}
		</c:forEach>
	}
	
	function unclickevent_by_star(number){
		var reviewlike_num =document.querySelector('#reviewnum_by_star'+number).innerText;
		<c:forEach var="review" items="${review}" varStatus="status">
		if(${review.num}==reviewlike_num){
				document.querySelector('#thumb_up${status.index}').className = 'thumbs';
				document.querySelector('#thumb_down${status.index}').className = 'thumbs';	
			}
		</c:forEach>
		
		<c:forEach var="review" items="${reviewlist_by_star}" varStatus="status">
		if(${review.num}==reviewlike_num){
				document.querySelector('#thumb_up_by_star${status.index}').className = 'thumbs';
				document.querySelector('#thumb_down_by_star${status.index}').className = 'thumbs';	
			}
		</c:forEach>
	}
	function clickevent(number){
		var reviewlike = getreviewlike(number);
		var reviewlike_num =document.querySelector('#reviewnum'+number).innerText;
		if(reviewlike != null){
			var reviewlike_like =reviewlike.like;
			
			<c:forEach var="review" items="${review}" varStatus="status">
			if(${review.num}==reviewlike_num){
				if(reviewlike_like == 1){
					document.querySelector('#thumb_up${status.index}').className = 'btn-btn-secondary';
					document.querySelector('#thumb_down${status.index}').className = 'thumbs';	
				}else if(reviewlike_like == -1){
					document.querySelector('#thumb_up${status.index}').className = 'thumbs';
					document.querySelector('#thumb_down${status.index}').className = 'btn-btn-secondary';	
				}
			}
			</c:forEach>
		
			<c:forEach var="review" items="${reviewlist_by_star}" varStatus="status">
			if(${review.num}==reviewlike_num){
				if(reviewlike_like == 1){
					document.querySelector('#thumb_up_by_star${status.index}').className = 'btn-btn-secondary';
					document.querySelector('#thumb_down_by_star${status.index}').className = 'thumbs';	
				}else if(reviewlike_like == -1){
					document.querySelector('#thumb_up_by_star${status.index}').className = 'thumbs';
					document.querySelector('#thumb_down_by_star${status.index}').className = 'btn-btn-secondary';	
				}
			}
			</c:forEach>
		};

	}
	function clickevent_by_star(number){
		var reviewlike = getreviewlike_by_star(number);
		var reviewlike_num =document.querySelector('#reviewnum_by_star'+number).innerText;
		if(reviewlike == null){
			<c:forEach var="review" items="${review}" varStatus="status">
			if(${review.num}==reviewlike_num){
					document.querySelector('#thumb_up${status.index}').className = 'thumbs';
					document.querySelector('#thumb_down${status.index}').className = 'thumbs';	
				}
			</c:forEach>
		
			<c:forEach var="review" items="${reviewlist_by_star}" varStatus="status">
			if(${review.num}==reviewlike_num){
					document.querySelector('#thumb_up_by_star${status.index}').className = 'thumbs';
					document.querySelector('#thumb_down_by_star${status.index}').className = 'thumbs';	
				}
			</c:forEach>
		}else{
			var reviewlike_like =reviewlike.like;
			
			<c:forEach var="review" items="${review}" varStatus="status">
			if(${review.num}==reviewlike_num){
				if(reviewlike_like == 1){
					document.querySelector('#thumb_up${status.index}').className = 'btn-btn-secondary';
					document.querySelector('#thumb_down${status.index}').className = 'thumbs';	
				}else if(reviewlike_like == -1){
					document.querySelector('#thumb_up${status.index}').className = 'thumbs';
					document.querySelector('#thumb_down${status.index}').className = 'btn-btn-secondary';	
				}
			}
			</c:forEach>
		
			<c:forEach var="review" items="${reviewlist_by_star}" varStatus="status">
			if(${review.num}==reviewlike_num){
				if(reviewlike_like == 1){
					document.querySelector('#thumb_up_by_star${status.index}').className = 'btn-btn-secondary';
					document.querySelector('#thumb_down_by_star${status.index}').className = 'thumbs';	
				}else if(reviewlike_like == -1){
					document.querySelector('#thumb_up_by_star${status.index}').className = 'thumbs';
					document.querySelector('#thumb_down_by_star${status.index}').className = 'btn-btn-secondary';	
				}
			}
			</c:forEach>
		}

	}
	function check_member_likereview(number){
		var chklikecnt = checkreviewcnt(number);
		if(chklikecnt == 1){
			var chkrs = check_reviewLike(number);
			if(chkrs ==1){
				//이미 좋아요를 눌렀을 때
				delete_reviewlike(number);
				Decrease_likeCNT(number);
				
			}else if(chkrs == -1){
				//좋아요를 눌렀는데 싫어요가 이미 눌러져 있을 때
				modify_unlike2like(number);
				Modify_un2likeCNT(number);
			}
		}else{
			//처음 좋아요를 누를 때
			//좋아요 누른걸 넣어주고 review의 like 값을 올려줘야한다.
			insert_reviewlike(number);
			Increase_likeCNT(number);
			
		}
	}
	function check_member_Unlikereview(number){
		var chklikecnt = checkreviewcnt(number);
		if(chklikecnt == 1){
			var chkrs = check_review_unLike(number);
			if(chkrs ==-1){
				//이미 싫어요를 눌렀을 때
				Increase_likeCNT(number);
				delete_reviewlike(number);
			}else if(chkrs == 1){
				//싫어요를 눌렀는데 좋아요가 이미 눌러져 있을 때
				modify_like2unlike(number);
				Modify_li2unlikeCNT(number);
			}	
		}else{
			//처음 싫어요를 누를 때
			//싫어요 누른걸 넣어주고 review의 like 값을 내려줘야한다.
			insert_unlikereview(number);
			Decrease_likeCNT(number);
		}
	}
	function check_member_likereview_by_star(number){
		var chklikecnt = checkreviewcnt_by_star(number);
		if(chklikecnt == 1){
			var chkrs = check_reviewLike_by_star(number);
			if(chkrs ==1){
				//이미 좋아요를 눌렀을 때
				delete_reviewlike_by_star(number);
				Decrease_likeCNT_by_star(number);
			}else if(chkrs == -1){
				//좋아요를 눌렀는데 싫어요가 이미 눌러져 있을 때
				modify_unlike2like_by_star(number);
				Modify_un2likeCNT_by_star(number);
			}
		}else{
			//처음 좋아요를 누를 때
			//좋아요 누른걸 넣어주고 review의 like 값을 올려줘야한다.
			insert_reviewlike_by_star(number);
			Increase_likeCNT_by_star(number);
		}
	}
	function check_member_Unlikereview_by_star(number){
		var chklikecnt = checkreviewcnt_by_star(number);
		if(chklikecnt == 1){
			var chkrs = check_review_unLike_by_star(number);
			if(chkrs ==-1){
				//이미 싫어요를 눌렀을 때
				Increase_likeCNT_by_star(number);
				delete_reviewlike_by_star(number);
			}else if(chkrs == 1){
				//싫어요를 눌렀는데 좋아요가 이미 눌러져 있을 때
				modify_like2unlike_by_star(number);
				Modify_li2unlikeCNT_by_star(number);
			}	
		}else{
			//처음 싫어요를 누를 때
			//싫어요 누른걸 넣어주고 review의 like 값을 내려줘야한다.
			insert_unlikereview_by_star(number);
			Decrease_likeCNT_by_star(number);
		}
	}

</script>
</head>



<body>
	<!-- <table border="1"> -->
	<%-- <tr><th>상품설명</th><td>${data.disc }</td></tr> --%>
	<%-- <tr><th>가격</th><td>${data.price }</td></tr> --%>
	<!-- </table> -->


	<button id="modalBtn" hidden="true" type="button"
		class="btn btn-secondary" data-bs-toggle="modal"
		data-bs-target="#basketModal"></button>
	<!-- Modal -->
	<div class="modal fade" id="basketModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">${data.name}</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">상품이 장바구니에 담겼습니다. 확인하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<a href="basketList?id=${sessionScope.data}"
						class="btn btn-primary">확인</a>
				</div>
			</div>
		</div>
	</div>


	<div class="container" style="padding-top: 30px;">
		<div class="row">
			<div class="col">
				<img src="resources/images/pro_${data.id}.png" alt="Image"
					style="max-width: 80%;" />
			</div>
			<div class="col">
				<h3>${data.name}</h3>
				<h5>${data.price}원</h5>
				<hr>
				${data.disc } <br> <br>
				<div class="col" align="right">
					<select class="form-select form-select-lg mb-3" name="cnt"
						aria-label=".form-select-lg example" style="width: 100">
						<option selected>선택</option>
						<%
						for (int i = 0; i < 10; i++) {
						%>
						<option value="<%=i + 1%>"><%=i + 1%></option>
						<%
						}
						%>
					</select>

					<table class="table" style="width: 50%">
						<thead>
							<tr align="center">
								<th scope="col">금액</th>
								<th scope="col">수량</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td>${data.price}원</td>
								<td id="out_cnt"><script type="text/javascript">
			                    $("select[name=cnt]").change(function(){
			                    	document.querySelector('#out_cnt').innerText = $(this).val(); //value값 가져오기
			                    	});
			                    </script></td>
							</tr>
						</tbody>
						<thead>
							<tr align="center">
								<th scope="col">합계</th>
								<td scope="col" id="out_sum"><script type="text/javascript">
			                    	$("select[name=cnt]").change(function(){
			                    		sum = $(this).val()*${data.price }
			                    		if(document.querySelector('#out_cnt').innerText != '선택') {
			                    			document.querySelector('#out_sum').innerText = sum; //value값 가져오기
			                    		} else {
			                    			document.querySelector('#out_sum').innerText = '';
			                    		}
			                    	});
			                    </script></td>
							</tr>
						</thead>
					</table>


					<div class="container">
						<div class="row">
							<div class="col-12">
								<div>
									<button id="jjim" style="padding: 6px;" onclick="like();"
										type="button" class="btn btn-outline-danger">
										<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22"
											fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
									<path
												d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
									</svg>
									</button>
									<button id="modalBtn" hidden="true" type="button"
										class="btn btn-secondary" data-bs-toggle="modal"
										data-bs-target="#heartModal"></button>
									<script type="text/javascript">
										if('${requestScope.likeCheck}' == 1) {
											document.querySelector('#jjim').className = 'btn btn-danger';
										} else {
											document.querySelector('#jjim').className = 'btn btn-outline-danger';
										}
									</script>


									<button id="basketBtn" onclick="modal();" type="button"
										class="btn btn-secondary">장바구니</button>
									<button type="button" onclick="buyBtn();"
										class="btn btn-primary">구매하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div id="reviews" class="review-section">
			<div class="d-flex align-items-center justify-content-between mb-4">
				<h4 class="m-0">REVIEW | 악의적인 비방글은 무통보 삭제되는 점 유의 부탁드립니다.
					(${cntreview})</h4>
				<select id="selectbox"
					class="custom-select custom-select-sm border-0 shadow-sm ml-2 select2-hidden-accessible" onchange="changesort()"
					data-select2-id="1" tabindex="-1" aria-hidden="true">
					<option data-select2-id="3" value="최신순">최신순</option>
					<option value="별점순">별점순</option>
				</select>
			</div>
			<div class="row">
				<div class="col-md-6">
					<table class="stars-counters">
						<tbody>
							<tr class="">
								<td><span>
										<button
											class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">매우
											만족</button>
								</span></td>
								<td class="progress-bar-container">
									<div
										class="fit-progressbar fit-progressbar-bar star-progress-bar">
										<div class="fit-progressbar-background">
											<span class="progress-fill" id="progress-fill_5"
												style="width: progressbar(${cnt5star});"></span>
										</div>
									</div>
								</td>
								<td class="star-num">(${cnt5star})</td>
							</tr>
							<tr class="">
								<td><span>
										<button
											class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">만족</button>
								</span></td>
								<td class="progress-bar-container">
									<div
										class="fit-progressbar fit-progressbar-bar star-progress-bar">
										<div class="fit-progressbar-background">
											<span class="progress-fill" id="progress-fill_4"
												style="width: 2.2973%;"></span>
										</div>
									</div>
								</td>
								<td class="star-num">(${cnt4star})</td>
							</tr>
							<tr class="">
								<td><span>
										<button
											class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">보통</button>
								</span></td>
								<td class="progress-bar-container">
									<div
										class="fit-progressbar fit-progressbar-bar star-progress-bar">
										<div class="fit-progressbar-background">
											<span class="progress-fill" id="progress-fill_3"
												style="width: 0;"></span>
										</div>
									</div>
								</td>
								<td class="star-num">(${cnt3star})</td>
							</tr>
							<tr class="">
								<td><span>
										<button
											class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">불만족</button>
								</span></td>
								<td class="progress-bar-container">
									<div
										class="fit-progressbar fit-progressbar-bar star-progress-bar">
										<div class="fit-progressbar-background">
											<span class="progress-fill" id="progress-fill_2"
												style="width: 0;"></span>
										</div>
									</div>
								</td>
								<td class="star-num">(${cnt2star})</td>
							</tr>
							<tr class="">
								<td><span>
										<button
											class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">매우
											불만족</button>
								</span></td>
								<td class="progress-bar-container">
									<div
										class="fit-progressbar fit-progressbar-bar star-progress-bar">
										<div class="fit-progressbar-background">
											<span class="progress-fill" id="progress-fill_1"
												style="width: 0;"></span>
										</div>
									</div>
								</td>
								<td class="star-num">(${cnt1star})</td>
							</tr>
						</tbody>
					</table>
				</div>
				<script type="text/javascript">
            function progressbar(number){
            	var totalcnt = ${cntreview}
            	var ratings = number / totalcnt * 100;
            	ratingPercentage = ratings +'%'
            	return ratingPercentage
            }
            document.querySelector('#progress-fill_5').style.width=progressbar(${cnt5star});
            document.querySelector('#progress-fill_4').style.width=progressbar(${cnt4star});
            document.querySelector('#progress-fill_3').style.width=progressbar(${cnt3star});
            document.querySelector('#progress-fill_2').style.width=progressbar(${cnt2star});
            document.querySelector('#progress-fill_1').style.width=progressbar(${cnt1star});
            </script>
				<div class="col-md-6">
					<div class="products_reviews_summary_v2__lcontent"
						style="padding: 20px 0 0 50px;">
						<div class="products_reviews_summary_v2__score">
							<span class="products_reviews_summary_v2__score_icon"> <svg
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink" width="120"
									height="120" viewBox="0 0 20 20" style="fill: #FF9600">
   										<defs>
       										 <path id="star-full"
										d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    									</defs>
    										<use xlink:href="#star-full"></use>
									</svg>
							</span> <span class="products_reviews_summary_v2__score_icon_avg"
								style="font-size: 50; line-height: 1.0em">${avgreview}</span>
						</div>
						<b id="likeratio"></b><span id="reviewSatisfy">의 구매자가 이 상품에
							만족합니다.</span>
						<script type="text/javascript">
								if('${review}' == '[]') {
									$('#reviewSatisfy').text('리뷰가 없습니다.');
									document.querySelector('#progress-fill_4').style.width='0';
								}
							</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="reviews_by_date" class="container" >
		<c:forEach var="review" items="${review}" varStatus="status">
			<!-- review 1 -->
			<div class="review-list" style="margin-bottom: 20px;">
				<div class="d-flex">
					<div class="right">
						<span id='reviewnum${status.index}' hidden="true">${review.num}</span>
						<h4>${review.user_id}님의리뷰</h4>
						<div class='RatingStar' id='rating${status.index}'
							style="font-size: calc(1.275rem + .3vw);">
							<div class='RatingScore'>
								<div class='outer-star'>
									<div class='inner-star' id='star${status.index}'></div>
								</div>
							</div>
						</div>
						<script type="text/javascript">
							var ratings = {RatingScore: ${review.star}}
							totalRating = 5;
							table = document.querySelector('#rating${status.index}');
							
							function rateIt() {
								for (rating in ratings) {
									ratingPercentage = ratings[rating] / totalRating * 100;
									ratingRounded = ratingPercentage + '%';
									star = table.querySelector('#star${status.index}');
									star.style.width = ratingRounded;
									}
								}
							rateIt();
							
							function likeratio(){
								var likeratio = (${cnt5star}+${cnt4star})/${cntreview} * 100 +'%';
								document.querySelector('#likeratio').innerText = likeratio;
							}
							likeratio();
						</script>


						<div class="review-description">
							<p>${review.content}</p>
						</div>
						<span class="publish d-inline-block w-100"
							id="review_regdate${status.index}">getRegdate()</span>
						<div class="helpful-thumbs">
							<button id="thumb_up${status.index}" class="thumbs"
								onclick="check_member_likereview(${status.index})" value="1">
								<div class="helpful-thumb text-body-2">
									<span class="fit-icon thumbs-icon"> <svg width="14"
											height="14" viewBox="0 0 14 14"
											xmlns="http://www.w3.org/2000/svg">
                                        		<path
												d="M13.5804 7.81165C13.8519 7.45962 14 7 14 6.43858C14 5.40843 13.123 4.45422 12.0114 4.45422H10.0932C10.3316 3.97931 10.6591 3.39024 10.6591 2.54516C10.6591 0.948063 10.022 0 8.39207 0C7.57189 0 7.26753 1.03682 7.11159 1.83827C7.01843 2.31708 6.93041 2.76938 6.65973 3.04005C6.01524 3.68457 5.03125 5.25 4.44013 5.56787C4.38028 5.59308 4.3038 5.61293 4.22051 5.62866C4.06265 5.39995 3.79889 5.25 3.5 5.25H0.875C0.391754 5.25 0 5.64175 0 6.125V13.125C0 13.6082 0.391754 14 0.875 14H3.5C3.98325 14 4.375 13.6082 4.375 13.125V12.886C5.26354 12.886 7.12816 14.0002 9.22728 13.9996C9.37781 13.9997 10.2568 14.0004 10.3487 13.9996C11.9697 14 12.8713 13.0183 12.8188 11.5443C13.2325 11.0596 13.4351 10.3593 13.3172 9.70944C13.6578 9.17552 13.7308 8.42237 13.5804 7.81165ZM0.875 13.125V6.125H3.5V13.125H0.875ZM12.4692 7.5565C12.9062 7.875 12.9062 9.1875 12.3159 9.48875C12.6856 10.1111 12.3529 10.9439 11.9053 11.1839C12.1321 12.6206 11.3869 13.1146 10.3409 13.1246C10.2504 13.1255 9.32247 13.1246 9.22731 13.1246C7.23316 13.1246 5.54296 12.011 4.37503 12.011V6.44287C5.40611 6.44287 6.35212 4.58516 7.27847 3.65879C8.11368 2.82357 7.83527 1.43153 8.3921 0.874727C9.78414 0.874727 9.78414 1.84589 9.78414 2.54518C9.78414 3.69879 8.94893 4.21561 8.94893 5.32924H12.0114C12.6329 5.32924 13.1223 5.88607 13.125 6.44287C13.1277 6.99967 12.9062 7.4375 12.4692 7.5565ZM2.84375 11.8125C2.84375 12.1749 2.54994 12.4688 2.1875 12.4688C1.82506 12.4688 1.53125 12.1749 1.53125 11.8125C1.53125 11.4501 1.82506 11.1562 2.1875 11.1562C2.54994 11.1562 2.84375 11.4501 2.84375 11.8125Z"></path>
                                    		</svg>
									</span> <span class="thumb-title">좋아요</span>
								</div>
							</button>
							<span id="cntlike${status.index}">${review.like}</span>
							<button id="thumb_down${status.index}" class="thumbs"
								onclick="check_member_Unlikereview(${status.index})" value="-1">
								<div class="helpful-thumb text-body-2 ml-3">
									<span class="fit-icon thumbs-icon"> <svg width="14"
											height="14" viewBox="0 0 14 14"
											xmlns="http://www.w3.org/2000/svg">
                                        <path
												d="M0.419563 6.18835C0.148122 6.54038 6.11959e-07 7 5.62878e-07 7.56142C2.81294e-05 8.59157 0.876996 9.54578 1.98863 9.54578L3.90679 9.54578C3.66836 10.0207 3.34091 10.6098 3.34091 11.4548C3.34089 13.0519 3.97802 14 5.60793 14C6.42811 14 6.73247 12.9632 6.88841 12.1617C6.98157 11.6829 7.06959 11.2306 7.34027 10.9599C7.98476 10.3154 8.96875 8.75 9.55987 8.43213C9.61972 8.40692 9.6962 8.38707 9.77949 8.37134C9.93735 8.60005 10.2011 8.75 10.5 8.75L13.125 8.75C13.6082 8.75 14 8.35825 14 7.875L14 0.875C14 0.391754 13.6082 -3.42482e-08 13.125 -7.64949e-08L10.5 -3.0598e-07C10.0168 -3.48226e-07 9.625 0.391754 9.625 0.875L9.625 1.11398C8.73647 1.11398 6.87184 -0.000191358 4.77272 0.00038257C4.62219 0.000300541 3.74322 -0.000438633 3.65127 0.000382472C2.03027 -1.04643e-06 1.12867 0.981667 1.18117 2.45566C0.76754 2.94038 0.564868 3.64065 0.682829 4.29056C0.342234 4.82448 0.269227 5.57763 0.419563 6.18835ZM13.125 0.875L13.125 7.875L10.5 7.875L10.5 0.875L13.125 0.875ZM1.53079 6.4435C1.09375 6.125 1.09375 4.8125 1.6841 4.51125C1.31436 3.88891 1.64713 3.05613 2.09467 2.81605C1.86791 1.37941 2.61313 0.885417 3.65906 0.875355C3.74962 0.874535 4.67753 0.875355 4.77269 0.875355C6.76684 0.875355 8.45704 1.98898 9.62497 1.98898L9.62497 7.55713C8.5939 7.55713 7.64788 9.41484 6.72153 10.3412C5.88632 11.1764 6.16473 12.5685 5.6079 13.1253C4.21586 13.1253 4.21586 12.1541 4.21586 11.4548C4.21586 10.3012 5.05107 9.78439 5.05107 8.67076L1.9886 8.67076C1.36708 8.67076 0.877707 8.11393 0.874973 7.55713C0.872266 7.00033 1.09375 6.5625 1.53079 6.4435ZM11.1563 2.1875C11.1563 1.82506 11.4501 1.53125 11.8125 1.53125C12.1749 1.53125 12.4688 1.82506 12.4688 2.1875C12.4688 2.54994 12.1749 2.84375 11.8125 2.84375C11.4501 2.84375 11.1563 2.54994 11.1563 2.1875Z"></path>
                                   		</svg>
									</span> <span class="thumb-title">싫어요</span>
								</div>
							</button>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
		
		function getRegdate(){
		var date = new Date('${review.regdate}');
		var regdate = date.getFullYear() + "-" + ((date.getMonth() + 1) > 9 ? (date.getMonth() + 1).toString() : "0" + (date.getMonth() + 1)) + "-" + (date.getDate() > 9 ? date.getDate().toString() : "0" + date.getDate().toString());
		return regdate
		}
		var review = document.querySelector('#review_regdate${status.index}');
		review.innerHTML = getRegdate();
		
		
		</script>
		</c:forEach>
		<script type="text/javascript">
		<c:forEach var="checkreviewnum" items="${checkreviewnum}">
		<c:forEach var="review" items="${review}" varStatus="status">
			if(${review.num}==${checkreviewnum.num}){
				if(${checkreviewnum.like} == 1){
				document.querySelector('#thumb_up${status.index}').className = 'btn-btn-secondary';
				}else if(${checkreviewnum.like} == -1)
				document.querySelector('#thumb_down${status.index}').className = 'btn-btn-secondary';	
			}
		</c:forEach>
		</c:forEach>
		</script>
	</div>
	<div id="reviews_by_star" class="container" hidden="">
		<c:forEach var="review" items="${reviewlist_by_star}"
			varStatus="status">
			<!-- 별점 순 정렬 -->
			<div class="review-list" style="margin-bottom: 20px;">
				<div class="d-flex">
					<div class="right">
						<span id='reviewnum_by_star${status.index}' hidden="true">${review.num}</span>
						<h4>${review.user_id}님의리뷰</h4>
						<div class='RatingStar' id='rating_by_star${status.index}'
							style="font-size: calc(1.275rem + .3vw);">
							<div class='RatingScore'>
								<div class='outer-star'>
									<div class='inner-star' id='star_by_star${status.index}'></div>
								</div>
							</div>
						</div>
						<script type="text/javascript">
							var ratings = {RatingScore: ${review.star}}
							totalRating = 5;
							table = document.querySelector('#rating_by_star${status.index}');
							
							function rateIt() {
								for (rating in ratings) {
									ratingPercentage = ratings[rating] / totalRating * 100;
									ratingRounded = ratingPercentage + '%';
									star = table.querySelector('#star_by_star${status.index}');
									star.style.width = ratingRounded;
									}
								}
							rateIt();
							
						</script>


						<div class="review-description">
							<p>${review.content}</p>
						</div>
						<span class="publish d-inline-block w-100"
							id="review_regdate_by_star${status.index}">getRegdate()</span>
						<div class="helpful-thumbs">
							<button id="thumb_up_by_star${status.index}" class="thumbs"
								onclick="check_member_likereview_by_star(${status.index})" value="1">
								<div class="helpful-thumb text-body-2">
									<span class="fit-icon thumbs-icon"> <svg width="14"
											height="14" viewBox="0 0 14 14"
											xmlns="http://www.w3.org/2000/svg">
                                        		<path
												d="M13.5804 7.81165C13.8519 7.45962 14 7 14 6.43858C14 5.40843 13.123 4.45422 12.0114 4.45422H10.0932C10.3316 3.97931 10.6591 3.39024 10.6591 2.54516C10.6591 0.948063 10.022 0 8.39207 0C7.57189 0 7.26753 1.03682 7.11159 1.83827C7.01843 2.31708 6.93041 2.76938 6.65973 3.04005C6.01524 3.68457 5.03125 5.25 4.44013 5.56787C4.38028 5.59308 4.3038 5.61293 4.22051 5.62866C4.06265 5.39995 3.79889 5.25 3.5 5.25H0.875C0.391754 5.25 0 5.64175 0 6.125V13.125C0 13.6082 0.391754 14 0.875 14H3.5C3.98325 14 4.375 13.6082 4.375 13.125V12.886C5.26354 12.886 7.12816 14.0002 9.22728 13.9996C9.37781 13.9997 10.2568 14.0004 10.3487 13.9996C11.9697 14 12.8713 13.0183 12.8188 11.5443C13.2325 11.0596 13.4351 10.3593 13.3172 9.70944C13.6578 9.17552 13.7308 8.42237 13.5804 7.81165ZM0.875 13.125V6.125H3.5V13.125H0.875ZM12.4692 7.5565C12.9062 7.875 12.9062 9.1875 12.3159 9.48875C12.6856 10.1111 12.3529 10.9439 11.9053 11.1839C12.1321 12.6206 11.3869 13.1146 10.3409 13.1246C10.2504 13.1255 9.32247 13.1246 9.22731 13.1246C7.23316 13.1246 5.54296 12.011 4.37503 12.011V6.44287C5.40611 6.44287 6.35212 4.58516 7.27847 3.65879C8.11368 2.82357 7.83527 1.43153 8.3921 0.874727C9.78414 0.874727 9.78414 1.84589 9.78414 2.54518C9.78414 3.69879 8.94893 4.21561 8.94893 5.32924H12.0114C12.6329 5.32924 13.1223 5.88607 13.125 6.44287C13.1277 6.99967 12.9062 7.4375 12.4692 7.5565ZM2.84375 11.8125C2.84375 12.1749 2.54994 12.4688 2.1875 12.4688C1.82506 12.4688 1.53125 12.1749 1.53125 11.8125C1.53125 11.4501 1.82506 11.1562 2.1875 11.1562C2.54994 11.1562 2.84375 11.4501 2.84375 11.8125Z"></path>
                                    		</svg>
									</span> <span class="thumb-title">좋아요</span>
								</div>
							</button>
							<span id="cntlike_by_star${status.index}">${review.like}</span>
							<button id="thumb_down_by_star${status.index}" class="thumbs"
								onclick="check_member_Unlikereview_by_star(${status.index})"
								value="-1">
								<div class="helpful-thumb text-body-2 ml-3">
									<span class="fit-icon thumbs-icon"> <svg width="14"
											height="14" viewBox="0 0 14 14"
											xmlns="http://www.w3.org/2000/svg">
                                        <path
												d="M0.419563 6.18835C0.148122 6.54038 6.11959e-07 7 5.62878e-07 7.56142C2.81294e-05 8.59157 0.876996 9.54578 1.98863 9.54578L3.90679 9.54578C3.66836 10.0207 3.34091 10.6098 3.34091 11.4548C3.34089 13.0519 3.97802 14 5.60793 14C6.42811 14 6.73247 12.9632 6.88841 12.1617C6.98157 11.6829 7.06959 11.2306 7.34027 10.9599C7.98476 10.3154 8.96875 8.75 9.55987 8.43213C9.61972 8.40692 9.6962 8.38707 9.77949 8.37134C9.93735 8.60005 10.2011 8.75 10.5 8.75L13.125 8.75C13.6082 8.75 14 8.35825 14 7.875L14 0.875C14 0.391754 13.6082 -3.42482e-08 13.125 -7.64949e-08L10.5 -3.0598e-07C10.0168 -3.48226e-07 9.625 0.391754 9.625 0.875L9.625 1.11398C8.73647 1.11398 6.87184 -0.000191358 4.77272 0.00038257C4.62219 0.000300541 3.74322 -0.000438633 3.65127 0.000382472C2.03027 -1.04643e-06 1.12867 0.981667 1.18117 2.45566C0.76754 2.94038 0.564868 3.64065 0.682829 4.29056C0.342234 4.82448 0.269227 5.57763 0.419563 6.18835ZM13.125 0.875L13.125 7.875L10.5 7.875L10.5 0.875L13.125 0.875ZM1.53079 6.4435C1.09375 6.125 1.09375 4.8125 1.6841 4.51125C1.31436 3.88891 1.64713 3.05613 2.09467 2.81605C1.86791 1.37941 2.61313 0.885417 3.65906 0.875355C3.74962 0.874535 4.67753 0.875355 4.77269 0.875355C6.76684 0.875355 8.45704 1.98898 9.62497 1.98898L9.62497 7.55713C8.5939 7.55713 7.64788 9.41484 6.72153 10.3412C5.88632 11.1764 6.16473 12.5685 5.6079 13.1253C4.21586 13.1253 4.21586 12.1541 4.21586 11.4548C4.21586 10.3012 5.05107 9.78439 5.05107 8.67076L1.9886 8.67076C1.36708 8.67076 0.877707 8.11393 0.874973 7.55713C0.872266 7.00033 1.09375 6.5625 1.53079 6.4435ZM11.1563 2.1875C11.1563 1.82506 11.4501 1.53125 11.8125 1.53125C12.1749 1.53125 12.4688 1.82506 12.4688 2.1875C12.4688 2.54994 12.1749 2.84375 11.8125 2.84375C11.4501 2.84375 11.1563 2.54994 11.1563 2.1875Z"></path>
                                   		</svg>
									</span> <span class="thumb-title">싫어요</span>
								</div>
							</button>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
		
		function getRegdate(){
		var date = new Date('${review.regdate}');
		var regdate = date.getFullYear() + "-" + ((date.getMonth() + 1) > 9 ? (date.getMonth() + 1).toString() : "0" + (date.getMonth() + 1)) + "-" + (date.getDate() > 9 ? date.getDate().toString() : "0" + date.getDate().toString());
		return regdate
		}
		var review = document.querySelector('#review_regdate_by_star${status.index}');
		review.innerHTML = getRegdate();
		
		
		</script>
		</c:forEach>
		<script type="text/javascript">
		<c:forEach var="checkreviewnum" items="${checkreviewnum}">
		<c:forEach var="review" items="${reviewlist_by_star}" varStatus="status">
			if(${review.num}==${checkreviewnum.num}){
				if(${checkreviewnum.like} == 1){
				document.querySelector('#thumb_up_by_star${status.index}').className = 'btn-btn-secondary';
				}else if(${checkreviewnum.like} == -1)
				document.querySelector('#thumb_down_by_star${status.index}').className = 'btn-btn-secondary';	
			}
		</c:forEach>
		</c:forEach>
		</script>
	</div>
</body>
</html>