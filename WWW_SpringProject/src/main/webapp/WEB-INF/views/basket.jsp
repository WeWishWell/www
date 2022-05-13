<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<%@ include file="./include/ajaxBasket.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basket.jsp</title>
<script type="text/javascript">
var prodArr = [];
var prodNum = 0;

function basketBuyCheck() {
	if(document.querySelector('#ttl_sum').innerText == '0') {
		alert('장바구니에 물품이 없습니다.');
		return;
	}
	location.href = 'purchase?id=${sessionScope.data}';
}

function totalPrice(sum, prodid) {
	document.querySelector('#out_sum_'+prodid).innerText = sum.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+'원';
}

function AlltotalPrice() {
	let total = 0;
	for(let prodid of prodArr) {
		 total += parseInt($('#out_sum_'+prodid).text().replace(/[^0-9]/g,''));
	}
	document.querySelector('#ttl_sum').innerText = total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+'원';
}

function plus(prodid, cnt) {
	plusAJAX(prodid, cnt);
}

function minus(prodid, cnt) {
	if($('#innerProdCnt'+prodid).text() == '1') {
		alert('1개 미만은 선택할 수 없습니다.');
		return;
	}
	minusAJAX(prodid, cnt);
}
</script>
</head>
<body>
<div class="pb-5">
    <div class="container">
      <div class="row">
		<h2>&emsp;&emsp;장바구니</h2>
		<hr>
        <div class="row-lg-12 p-5 bg-white rounded shadow-sm mb-5">
          <!-- Shopping cart table -->
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">제품명</div>
                  </th>
                  <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                    <div class="py-2 text-uppercase">상품금액</div>
                  </th>
                  <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                    <div class="py-2 text-uppercase">수량</div>
                  </th>
                  <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                    <div class="py-2 text-uppercase">합계</div>
                  </th>
                  <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                    <div class="py-2 text-uppercase">비우기</div>
                  </th>
                </tr>
              </thead>
              <tbody>
              <!-- 장바구니 상품정보 -->
              <c:forEach var="b" items="${data}">
                <tr>
                  <th scope="row" class="border-0">
                    <div class="p-2">
                      <%double s = Math.random();%>
                      <img src="resources/images/pro_${b.prod_id}.png?a=<%=s%>" alt="" width="70" class="img-fluid rounded shadow-sm">
                      <div class="ml-3 d-inline-block align-middle" style="padding-left: 20">
                        <h5 class="mb-0"> <a href="productDetail?id=${b.prod_id}" class="text-dark d-inline-block align-middle">${b.name}</a></h5><span class="text-muted font-weight-normal font-italic d-block">Category: ${b.category}</span>
                      </div>
                    </div>
                  </th>
                  <td class="border-0 align-middle" id="prodPrice${b.prod_id}" style=" text-align: center;"><fmt:formatNumber value="${b.price}" pattern="#,###"/>원</td>
                  <td class="border-0 align-middle" id="prodCnt${b.prod_id}" style=" text-align: center;">
                  	<button type="button" class="btn btn-light" onclick="minus('${b.prod_id}', $('#innerProdCnt${b.prod_id}').text());">-</button>
                  	&emsp;<span id="innerProdCnt${b.prod_id}">${b.cnt}</span>&emsp;
                  	<button type="button" class="btn btn-light" onclick="plus('${b.prod_id}', $('#innerProdCnt${b.prod_id}').text());">+</button>
                  </td>
                  <td class="border-0 align-middle" style=" text-align: center;" id="out_sum_${b.prod_id}"></td>
                  <td class="border-0 align-middle" align="center">
                  	<a href="basketDelete?prod_id=${b.prod_id}&user_id=${b.user_id}" > 
						<img src="resources/images/bin.png" alt="Image" style="width: 23" />
					</a>
                  </td>
                </tr>
                <script type="text/javascript">
                	prodArr[prodNum] = ${b.prod_id};
                	prodNum++;
                	sum = ${b.price}*${b.cnt};
				  	totalPrice(sum, '${b.prod_id}');
				</script>
               </c:forEach>
              </tbody>
            </table>
          </div>
          <!-- End -->
        </div>
      </div>

      <div class="row py-5 p-4 bg-white rounded shadow-sm">
<!--         <div class="col-lg-6"> -->
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">주문 합계</div>
          <div class="p-4">
            <ul class="list-unstyled mb-4">
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">총합계</strong>
                <h5 class="font-weight-bold" id="ttl_sum"></h5>
                <script type="text/javascript">
                	AlltotalPrice();
                </script>
              </li>
            </ul>
            <a href="#" onclick="basketBuyCheck();" class="btn btn-dark rounded-pill py-2 btn-block" style="float:right">구매하기</a>
          </div>
<!--         </div> -->
      </div>

    </div>
  </div>
</body>
</html>