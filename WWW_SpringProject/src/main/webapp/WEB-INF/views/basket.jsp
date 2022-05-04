<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basket.jsp</title>
<script type="text/javascript">
function basketBuyCheck() {
	if(document.querySelector('#ttl_sum').innerText == '0') {
		alert('장바구니에 물품이 없습니다.');
		return;
	}
	location.href = 'purchase?id=${sessionScope.data}';
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
                    <div class="py-2 text-uppercase">Remove</div>
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
                  <td class="border-0 align-middle" style=" text-align: center;"><strong>${b.price}</strong></td>
                  <td class="border-0 align-middle" style=" text-align: center;"><strong>${b.cnt}</strong></td>
                  <td class="border-0 align-middle" style=" text-align: center;" id="out_sum_${b.prod_id}">
               		 <script type="text/javascript">
               		 	var sum = 0;
                   		sum = ${b.price}*${b.cnt}
                   		document.querySelector('#out_sum_${b.prod_id}').innerText = sum;
                  	 </script>	
               	  </td>
                  <td class="border-0 align-middle" align="center">
                  	<a href="basketDelete?prod_id=${b.prod_id}&user_id=${b.user_id}" > 
						<img src="resources/images/bin.png" alt="Image" style="width: 23" />
					</a>
                  </td>
                </tr>
               </c:forEach>
              </tbody>
            </table>
          </div>
          <!-- End -->
        </div>
      </div>

      <div class="row py-5 p-4 bg-white rounded shadow-sm">
<!--         <div class="col-lg-6"> -->
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order summary </div>
          <div class="p-4">
            <ul class="list-unstyled mb-4">
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">총합계</strong>
                <h5 class="font-weight-bold" id="ttl_sum">
                <script type="text/javascript">var ttl_sum = 0</script>
                <c:forEach var="b" items="${data}">
                	<script type="text/javascript">
                   		ttl_sum = ttl_sum + ${b.price}*${b.cnt}
                  	 </script>
                </c:forEach>
                	<script type="text/javascript">
                   		document.querySelector('#ttl_sum').innerText = ttl_sum;
                	</script>
                </h5>
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