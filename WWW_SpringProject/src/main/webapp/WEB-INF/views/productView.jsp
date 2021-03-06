<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>productView.jsp</title>
<style type="text/css">
ul li {
	list-style-type: none;
}

.goods_list_item {
	position: relative;
	max-width: 1620px;
	margin: 0 auto;
	padding: 0 30px;
}

.goods_list_item .addition_zone img {
	max-width: 100%
}

.goods_list_item_tit {
	position: relative;
	margin: 0 0 20px 0;
	padding: 0 0 10px 0;
	text-align: center;
}

.goods_list_item_tit h2 {
	font-size: 34px;
	font-weight: 700;
}

.goods_list_item_tit+.list_item_category { /* margin-top:-21px; */
	
}

.list_item_category { /* padding:40px 0 35px;  */
	
}

.list_item_category ul {
	display: flex;
	justify-content: space-between;
}

.list_item_category li {
	flex: 1;
	border: 1px solid #ededed;
	margin: 0 0 0 -1px;
	font-size: 18px;
	text-align: center;
	vertical-align: middle;
}

.list_item_category li a {
	position: relative;
	display: block; /* padding:50px 0 45px;  */
	color: #c4c4c4;
	text-align: center;
	height: 150px;
	padding: 50px 0 45px;
}

.list_item_category li a:hover {
	
}

.list_item_category li a span {
	display: block;
}

.list_item_category li a span:first-child {
	min-height: 46px;
	padding-bottom: 12px;
}
/* .list_item_category li:nth-child(2) a span{min-height:auto; padding-bottom:12px; height:43px;} */
.list_item_category li a.gz span img {
	padding-top: 4px;
}

.list_item_category li a span.none+span {
	margin-top: -30px;
}

.list_item_category li a img { /* max-width:100%; max-height:20px; */
	
}

.list_item_category li a:hover {
	
}

.list_item_category li em {
	color: #777;
	display: none;
}

.list_item_category li.on, .list_item_category li.on a {
	color: #000;
}

.list_item_category li.on a:before {
	content: '';
	position: absolute;
	left: -1px;
	right: -1px;
	top: -1px;
	bottom: -1px;
	border: 2px solid #000;
}

.list_item_category li a.gz img {
	position: relative;
	top: 8px;
}

.list_item_category li a.bs img {
	/*  position: relative;    top: -5px; */
	
}

@font-face {
	font-family: 'SeoulHangangM';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YiSunShinDotumM.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>

<script type="text/javascript">
	function doScroll(value) {
		const textWidth = document.querySelector('#' + value).offsetWidth;
		const scrollWidth = textWidth - 241;
		if (scrollWidth > 0) {
			document.querySelector('#' + value).style.cssFloat = 'right';
		}
	}

	function resetScroll(value) {
		document.querySelector('#' + value).style.cssFloat = '';
	}
	//?????? ?????? ?????????
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = window.location.href.split('page')[0];
		if (url.includes('?')) {
			url = url + "page=" + page;
		} else {
			url = url + "?page=" + page;
		}
		url = url + "&range=" + range;

		location.href = url;
	}

	//????????? ?????? ??????
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = window.location.href.split('page')[0];
		if (url.includes('?')) {
			url = url + "&page=" + page;
		} else {
			url = url + "?page=" + page;
		}
		url = url + "&range=" + range;

		url = url.replace('&&', '&');

		location.href = url;
	}

	//?????? ?????? ?????????
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = window.location.href.split('page')[0];
		if (url.includes('?')) {
			url = url + "page=" + page;
		} else {
			url = url + "?page=" + page;
		}
		url = url + "&range=" + range;

		location.href = url;
	}
</script>

</head>
<body>
	<div class="goods_list_item">
		<div class="goods_list_item_tit">
			<h2>?????????</h2>

		</div>
		<div class="list_item_category">
			<ul>
				<li id="category1" class=""><a href="?category=all"
					data-label="??????"> <span><img id="category1_image"
							src="resources/images/icon_cate015001.png" alt=""></span> <span>??????</span>
				</a></li>

				<li id="category2" class=""><a href="?category=??????,?????????" class=""
					data-label="?????????????????"> <span><img id="category2_image"
							src="resources/images/icon_cate015001001.png" alt=""></span><span>?????????????????
							<em>(4)</em>
					</span>
				</a></li>

				<li id="category3" class=""><a href="?category=??????,?????????" class=""
					data-label="?????????????????"> <span><img id="category3_image"
							src="resources/images/icon_cate015001002.png" alt=""></span><span>?????????????????
							<em>(4)</em>
					</span>
				</a></li>

				<li id="category4" class=""><a href="?category=??????,??????" class=""
					data-label="??????????????"> <span><img id="category4_image"
							src="resources/images/icon_cate015001003.png" alt=""></span><span>??????????????
							<em>(6)</em>
					</span>
				</a>
				<li id="category5" class=""><a href="?category=?????????,??????,?????????"
					class="" data-label="????????????????????????????"> <span><img
							id="category5_image"
							src="resources/images/icon_cate015001004.png" alt=""></span><span>????????????????????????????
							<em>(4)</em>
					</span>
				</a>
				<li id="category6" class=""><a href="?category=?????????" class=""
					data-label="?????????"> <span><img id="category6_image"
							src="resources/images/icon_cate015001005.png" alt=""></span><span>?????????
							<em>(4)</em>
					</span>
				</a></li>


				<li id="category7" class=""><a href="?category=?????????" class=""
					data-label="?????????"> <span><img id="category7_image"
							src="resources/images/icon_cate015001007.png" alt=""></span><span>?????????
							<em>(4)</em>
					</span>
				</a></li>


			</ul>
		</div>
	</div>
	<div>
		<div class="row" style="width: 1200px; margin: auto; margin-top: 80">
<!-- 			<h2>&emsp;&emsp;????????????</h2> -->
<!-- 			<hr> -->
			<c:forEach var="b" items="${data}">
				<!-- card 1 -->
				<div
					style="margin-bottom: 20px; width: 300px; font-family: SeoulHangangM;">
					<div class="card" style="height: 430.58">
						<!--             <div class="card-header"> -->
						<%--               <h4><b>${b.name}</b></h4> <h6>${b.price }</h6> --%>
						<!--             </div> -->
						<a href="productDetail?id=${b.id}"
							style="width: 100%; text-align: center;"> <%
 double s = Math.random();
 %> <img src="resources/images/pro_${b.id}.png?a=<%=s%>" alt="Image"
							style="max-width: 100%;" />
						</a>
						<div class="card-body"
							style="overflow: hidden; white-space: nowrap; padding: 0; margin: 16px;">
							<a href="productDetail?id=${b.id}"
								style="color: black; text-decoration: none;"> <b
								onmouseover="doScroll(this.id);"
								onmouseout="resetScroll(this.id);" id="prodName_${b.id}"
								class="prodNameClass"
								style="display: inline-block; font-size: calc(1.275rem + .3vw);">${b.name}</b>
							</a>
							<h5 style="clear: both;"><fmt:formatNumber value="${b.price}" pattern="#,###"/>???</h5>
							<%--               <p class="card-text">${b.disc}</p> --%>
							<%--               <a href="productDetail?id=${b.id}" class="btn btn-primary">More</a> --%>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		 <!-- ???????????? ?????? ?????? -->
       	<div class="text-center" id="searchnone" style="display: none; margin-top: 3%">
			<img src="resources/images/not_search.png" class="rounded" alt="" style="max-width: 10%;">
			<h4 style="margin-top: 35;">????????? ????????? ????????????.</h4>					
		</div>
        <script type="text/javascript">
        	if('${data}'== '[]'){
        		document.querySelector('#searchnone').style.display = "";
        	}
        </script>
		
		<div id="paginationBox">
			<ul class="pagination justify-content-center">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
				</c:if>

				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li
						class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
						class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
							${idx} </a></li>
				</c:forEach>

				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
		var category = '${category}'
		if (category == 'all' || category == '') {
			document.querySelector('#category1').className = 'on'
			document.querySelector('#category1_image').src = 'resources/images/icon_cate015001_on.png'
		} else if (category == '??????,?????????') {
			document.querySelector('#category2').className = 'on'
			document.querySelector('#category2_image').src = 'resources/images/icon_cate015001001_on.png'
		} else if (category == '??????,?????????') {
			document.querySelector('#category3').className = 'on'
			document.querySelector('#category3_image').src = 'resources/images/icon_cate015001002_on.png'

		} else if (category == '??????,??????') {
			document.querySelector('#category4').className = 'on'
			document.querySelector('#category4_image').src = 'resources/images/icon_cate015001003_on.png'
		} else if (category == '?????????,??????,?????????') {
			document.querySelector('#category5').className = 'on'
			document.querySelector('#category5_image').src = 'resources/images/icon_cate015001004_on.png'
		} else if (category == '?????????') {
			document.querySelector('#category6').className = 'on'
			document.querySelector('#category6_image').src = 'resources/images/icon_cate015001005_on.png'
		} else if (category == '?????????') {
			document.querySelector('#category7').className = 'on'
			document.querySelector('#category7_image').src = 'resources/images/icon_cate015001007_on.png'
		} else {
			document.querySelector('#category1').className = 'on'
			document.querySelector('#category1_image').src = 'resources/images/icon_cate015001_on.png'
		}
	</script>

</body>
</html>