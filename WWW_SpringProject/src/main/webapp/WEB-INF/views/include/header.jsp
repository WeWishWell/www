<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="bootstrap.jsp"%>
<%@include file="jquery.jsp"%>
<%@include file="setCookie.jsp"%>
<%@include file="ajaxheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	if('${sessionScope.data}' == '') {
		alert('비정상적인 접근입니다.');
		window.location.href = 'index';
	}
	
	window.onload = function() {
		const color = document.querySelector('#color');
		const action2 = document.querySelector('#action2');
		const action3 = document.querySelector('#action3');
		const action4 = document.querySelector('#action4');
		
		document.querySelector('#searchText').addEventListener('blur', () => {
			document.querySelector('#searchBtn2').style.opacity = 0;
		});
		
		color.addEventListener('mouseover', () => {
			color.style.backgroundColor = 'rgba(255,255,255,0.5)';
		});
		
		color.addEventListener('mouseout', () => {
			ScrollCheck();
		});
		
		action2.addEventListener("mouseover", () =>{
			const cookie = getCookie('recent_view_items');
			if(cookie != null){
				if(cookie == '') {
					deleteCookie('recent_view_items');
					return;
				}
				var arr = []; 
				reversearr = [];
				arr = cookie.split(",");
				for(let i = arr.length-1; i>=0;i--){
					reversearr.push(arr[i]);
				}
				html = '<li style="padding-left: 16px;"><b>최근본목록</b></li><li><hr class="dropdown-divider"></li>';
				for(var i = 0; i<4;i++ ){
					html += ajaxRecentList(reversearr[i]);
				}
				document.querySelector('#recent').innerHTML = html;
			}
		});
		
		action3.addEventListener("mouseover", () => {
			ajaxBasketList();
		});
		
		action4.addEventListener("mouseover", () => {
			ajaxLikeList();
		});
		
		if('${sessionScope.roleCheck}' != '') {
			document.querySelector('#myInfo').innerHTML += '<li><a class="dropdown-item" href="adminProd" style="color: red;">관리자</a></li><li><a class="dropdown-item" href="logout">로그아웃</a></li>';
		} else {
			document.querySelector('#myInfo').innerHTML += '<li><a class="dropdown-item" href="logout">로그아웃</a></li>';
		}
		
	}
	
	window.addEventListener('scroll', () => {
		ScrollCheck();
	});
	
	function ScrollCheck() {
		if(!window.scrollY == true) {
			  color.style.backgroundColor = 'rgba(255,255,255,0)';
		} else {
			  color.style.backgroundColor = 'rgba(255,255,255,0.5)';
		}
	}

	function searchBtn() {
		const s = document.querySelector('#searchBtn2').style;
		const t = document.querySelector('#searchText');
		if(s.opacity == 0) {
			s.opacity = 1;
			t.focus();
		}
	}
</script>
<style type="text/css">
	@import url("resources/css/search.css");
	#searchBtn2 {transition-duration: 0.5s}

	.bgColor {background-color: #ffffff;}
	.active {font-size: x-large; text-decoration:none; color: #000000; margin-left: 20px;}
	.active:hover {color: #000000;}
	#headLogin:hover ~ #NotLoginInfo {display: block;}
	#action1:hover ~ #myInfo {display: block;}
	#action2:hover ~ #recent {display: block;}
	#action3:hover ~ #basket {display: block;}
	#action4:hover ~ #heart {display: block;}
	.dropdown-menu {margin-top: 40px;}
	.dropdown-menu:hover {display: block;}
	
	@font-face {
    font-family: 'S-CoreDream-6Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
</style>
</head>
<body style="font-family: S-CoreDream-6Bold">
<header>
<div style="width: 100%; height: 150px; display: inline-block;">
	<div id="color" style="width: 100%; height: 110px; position: fixed; z-index: 900">
		<div style="width: 1280px; margin: auto;">
		<form action="product" method="post" id="searchBtn2" class="search-box" style="position: absolute; margin: 120px 0 0 920px; opacity: 0;">
			<input type="text" id="searchText" name= "keyword" placeholder=" " onkeyup=""/><button type="reset"></button>
			<button hidden="true" type="submit"></button>
		</form>
		<a href="/shop/"><img alt="www" style="height: 110px; margin: 0 0 0 50px;" src="resources/images/logo.png"></a>
			<div class="btn-group" style="position: absolute; margin: 32px 0 0 500px;">
			
				<!-- Action메뉴 -->
				<a href="product?category=all" id="goods" class="active" style="position: absolute;">상품</a>
				
				<!-- 리뷰 -->
				<a href="review" class="active" style="position: absolute; margin-left: 100px;">리뷰</a>
				
				<!-- 이벤트 -->
				<a href="eventListOn?check=do" class="active" style="position: absolute; margin-left: 180px;">이벤트</a>
				
				<!-- 검색 -->
				<a href="#" id="searchBtn" onclick="searchBtn();" class="active" style="margin: 6px 0 0 332px;"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
				<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg></a>
				
				<!-- 로그인 -->
				<a href="logIn" id="headLogin" hidden="true" class="active" style="margin-top: 5px; padding-bottom: 30px;"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-unlock" viewBox="0 0 16 16">
				<path d="M11 1a2 2 0 0 0-2 2v4a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V9a2 2 0 0 1 2-2h5V3a3 3 0 0 1 6 0v4a.5.5 0 0 1-1 0V3a2 2 0 0 0-2-2zM3 8a1 1 0 0 0-1 1v5a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1H3z"/>
				</svg></a>
				
				<ul id="NotLoginInfo" class="dropdown-menu" style="margin-left: 252px;">
					<li><a class="dropdown-item" href="buyListNonmem">비회원 구매내역</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item" href="logIn">로그인</a></li>
				</ul>
				
				<!-- 내정보 -->
				<a href="memberDetail?id=${sessionScope.data}" id="action1" hidden="true" class="active action"  style="margin-top: 3px; padding-bottom: 30px; display: block;"><svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
				<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
				</svg></a>
				
				<ul id="myInfo" class="dropdown-menu" style="margin-left: 252px;">
					<li><a class="dropdown-item" href="memberDetail?id=${sessionScope.data}">내 정보</a></li>
					<li><a class="dropdown-item" href="buyList?id=${sessionScope.data}">구매내역</a></li>
				    <li><hr class="dropdown-divider"></li>
				</ul>
				
				<script type="text/javascript">
					if(!isNaN('${sessionScope.data}')) {
						if(${sessionScope.data} > 0 && ${sessionScope.data} < 1) {
							document.querySelector('#headLogin').hidden = false;
						} else {
							document.querySelector('#action1').hidden = false;
						}
					} else {
						document.querySelector('#action1').hidden = false;
					}
				</script>
				
				<!-- 최근본상품 -->
				<a href="#" id="action2" class="active"><img alt="" src="resources/images/header_history.png" style="width: 24px; margin-top: 5px; padding-bottom: 20px;"></a>
				
				<ul id="recent" class="dropdown-menu" style="margin-left: 80px; width: 400px;">
					<li style="padding-left: 16px;"><b>최근본상품</b></li>
				    <li><hr class="dropdown-divider"></li>
				    <li style="text-align: center;">최근 본 상품이 없습니다.</li>
				</ul>
				
				<!-- 장바구니 -->
				<a href="basketList?id=${sessionScope.data}" id="action3" class="active"><img alt="" src="resources/images/header_shopping-cart.png" style="width: 24px; margin-top: 5px; padding-bottom: 20px;"></a>
				<ul id="basket" class="dropdown-menu" style="margin-left: 122px; width: 400px;"></ul>
				
				<!-- 찜 -->
				<a href="likeList?id=${sessionScope.data}" id="action4" class="active"><img alt="" src="resources/images/header_heart.png" style="width: 24px; margin-top: 5px; padding-bottom: 20px;"></a>
				<ul id="heart" class="dropdown-menu" style="margin-left: 166px; width: 400px;"></ul>
			</div>
		</div>
	</div>
</div>
</header>
</body>
</html>