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
			document.querySelector('#myInfo').innerHTML += '<li><a class="dropdown-item" href="#" style="color: red;">관리자</a></li><li><a class="dropdown-item" href="logout">로그아웃</a></li>';
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
</style>
</head>
<body>
<header>
	<div id="color" style="width: 100%; height: 110px; position: fixed; z-index: 900">
		<div style="width: 1280px; margin: auto;">
		<form action="product" method="post" id="searchBtn2" class="search-box" style="position: absolute; margin: 120px 0 0 920px; opacity: 0;">
			<input type="text" id="searchText" name= "keyword" placeholder="검색어를 입력하세요"/><button type="reset"></button>
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
				<a href="#" id="action2" class="active" style="margin-top: 6px"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-clock-history" viewBox="0 0 16 16">
				<path d="M8.515 1.019A7 7 0 0 0 8 1V0a8 8 0 0 1 .589.022l-.074.997zm2.004.45a7.003 7.003 0 0 0-.985-.299l.219-.976c.383.086.76.2 1.126.342l-.36.933zm1.37.71a7.01 7.01 0 0 0-.439-.27l.493-.87a8.025 8.025 0 0 1 .979.654l-.615.789a6.996 6.996 0 0 0-.418-.302zm1.834 1.79a6.99 6.99 0 0 0-.653-.796l.724-.69c.27.285.52.59.747.91l-.818.576zm.744 1.352a7.08 7.08 0 0 0-.214-.468l.893-.45a7.976 7.976 0 0 1 .45 1.088l-.95.313a7.023 7.023 0 0 0-.179-.483zm.53 2.507a6.991 6.991 0 0 0-.1-1.025l.985-.17c.067.386.106.778.116 1.17l-1 .025zm-.131 1.538c.033-.17.06-.339.081-.51l.993.123a7.957 7.957 0 0 1-.23 1.155l-.964-.267c.046-.165.086-.332.12-.501zm-.952 2.379c.184-.29.346-.594.486-.908l.914.405c-.16.36-.345.706-.555 1.038l-.845-.535zm-.964 1.205c.122-.122.239-.248.35-.378l.758.653a8.073 8.073 0 0 1-.401.432l-.707-.707z"/>
				<path d="M8 1a7 7 0 1 0 4.95 11.95l.707.707A8.001 8.001 0 1 1 8 0v1z"/>
				<path d="M7.5 3a.5.5 0 0 1 .5.5v5.21l3.248 1.856a.5.5 0 0 1-.496.868l-3.5-2A.5.5 0 0 1 7 9V3.5a.5.5 0 0 1 .5-.5z"/>
				</svg></a>
				
				<ul id="recent" class="dropdown-menu" style="margin-left: 80px; width: 400px;">
					<li style="padding-left: 16px;"><b>최근본상품</b></li>
				    <li><hr class="dropdown-divider"></li>
				    <li style="text-align: center;">최근 본 상품이 없습니다.</li>
				</ul>
				
				<!-- 장바구니 -->
				<a href="basketList?id=${sessionScope.data}" id="action3" class="active" style="margin-top: 4px"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
				<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
				</svg></a>
				<ul id="basket" class="dropdown-menu" style="margin-left: 122px; width: 400px;"></ul>
				
				<!-- 찜 -->
				<a href="likeList?id=${sessionScope.data}" id="action4" class="active" style="margin-top: 7px"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
				<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
				</svg></a>
				<ul id="heart" class="dropdown-menu" style="margin-left: 166px; width: 400px;"></ul>
			</div>
		</div>
	</div>
</header>
</body>
</html>