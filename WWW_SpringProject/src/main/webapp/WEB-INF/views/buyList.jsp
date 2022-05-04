<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./include/header.jsp"%>
<%@include file="./include/ajaxPopup.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>
<script type="text/javascript">
	function review(prod) {
		ajaxPopup(prod);
	}
	
	function realDel(odm) {
		if (confirm("정말 지우시겠습니까?")) {
			location.href = 'delReview?id=${sessionScope.data}&odm='+odm;
        }
	}
</script>
</head>
<body>
<div class="pb-5">
    <div class="container">
      <div class="row">
	  <h2>&emsp;&emsp;구매내역</h2>
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
                    <div class="py-2 text-uppercase">주문상태</div>
                  </th>
                  <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                    <div class="py-2 text-uppercase">주문날짜</div>
                  </th>
                  <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                    <div class="py-2 text-uppercase">리뷰</div>
                  </th>
                </tr>
              </thead>
              <tbody>
              <!-- 장바구니 상품정보 -->
              <c:forEach var="b" items="${data}">
                <tr>
                  <th scope="row" class="border-0">
                    <div class="p-2">
						<a href="productDetail?id=${b.prod_id}" style="width: 100%; text-align: center; text-decoration: none;">
							<%double s = Math.random();%> 
	                      <img src="resources/images/pro_${b.prod_id}.png?a=<%=s%>" alt="" width="70" class="img-fluid rounded shadow-sm">
						</a>
                      <div class="ml-3 d-inline-block align-middle" style="padding-left: 20">
                        <h5 class="mb-0"> <a href="orderTracking?order_num=${b.order_num}" class="text-dark d-inline-block align-middle">${b.name}</a></h5>
                      </div>
                    </div>
                  </th>
                  <td class="border-0 align-middle" style=" text-align: center;"><strong>${b.price}원</strong></td>
                  <td class="border-0 align-middle" style=" text-align: center;"><strong>${b.order_status}</strong></td>
                  <td class="border-0 align-middle" id="date${b.odm}" style=" text-align: center;">
                  	<script type="text/javascript">
                  		document.querySelector('#date${b.odm}').innerText = '${b.order_date}'.substr(0, 10);
                  	</script>
                  </td>
                  <td class="border-0 align-middle" id="review${b.odm}" align="center"></td>
                </tr>
               	<script type="text/javascript">
               		for(let i of ${requestScope.check}) {
               			if(i == ${b.odm}) {
               				document.querySelector('#review${b.odm}').innerHTML = '<a href="review">리뷰보기</a><br><a href="#" onclick="realDel(${b.odm});" style="color: red;">리뷰삭제</a>';
               				break;
               			}
               		}
               		if(document.querySelector('#review${b.odm}').innerHTML == '') {
               			var prod_name${b.odm} = '${b.name}'.replace(/ /g, "&nbsp;");
               			var prod${b.odm} = {id: ${b.prod_id}, name: prod_name${b.odm}, odm: ${b.odm}};
               			document.querySelector('#review${b.odm}').innerHTML = '<a href="#" onclick="review(prod${b.odm});">리뷰쓰기</a>';
               		}
               	</script>
               </c:forEach>
              </tbody>
            </table>
          </div>
          <!-- End -->
          
        </div>
      </div>
    </div>
  </div>
</body>
</html>