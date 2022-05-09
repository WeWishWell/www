<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css"
    />
    <title>order Tracking</title>
<style type="text/css">
        .steps .step {
          display: block;
          width: 100%;
          margin-bottom: 35px;
          text-align: center;
        }

        .steps .step .step-icon-wrap {
          display: flex;
          justify-content: center;
          position: relative;
          width: 100%;
          height: 80px;
          text-align: center;
        }

        .steps .step .step-icon-wrap::before,
        .steps .step .step-icon-wrap::after {
          display: block;
          position: absolute;
          top: 50%;
          width: 50%;
          height: 3px;
          margin-top: -1px;
          background-color: #e1e7ec;
          content: '';
          z-index: 1;
        }

        .steps .step .step-icon-wrap::before {
          left: 0;
        }

        .steps .step .step-icon-wrap::after {
          right: 0;
        }
	
        .steps .step .step-icon {
          display: flex;
          justify-content: center;
          align-items: center;
          position: relative;
          width: 80px;
          height: 80px;
          border: 1px solid #e1e7ec;
          border-radius: 50%;
          background-color: #f5f5f5;
          color: #374250;
          font-size: 38px;
          line-height: 81px;
          z-index: 5;

          display: flex;
          justify-content: center;
          align-items: center;
        }

        .steps .step .step-title {
          margin-top: 16px;
          margin-bottom: 0;
          color: #606975;
          font-size: 14px;
          font-weight: 500;
        }

        .steps .step:first-child .step-icon-wrap::before {
          display: none;
        }

        .steps .step:last-child .step-icon-wrap::after {
          display: none;
        }

        .steps .step.completed .step-icon-wrap::before,
        .steps .step.completed .step-icon-wrap::after {
          background-color: #f7d069;
        }

        .steps .step.completed .step-icon {
          border-color: #f7d069;
          background-color: #f7d069;
          color: #fff;
        }

        @media (max-width: 576px) {
          .flex-sm-nowrap .step .step-icon-wrap::before,
          .flex-sm-nowrap .step .step-icon-wrap::after {
            display: none;
          }
        }

        @media (max-width: 768px) {
          .flex-md-nowrap .step .step-icon-wrap::before,
          .flex-md-nowrap .step .step-icon-wrap::after {
            display: none;
          }
        }

        @media (max-width: 991px) {
          .flex-lg-nowrap .step .step-icon-wrap::before,
          .flex-lg-nowrap .step .step-icon-wrap::after {
            display: none;
          }
        }

        @media (max-width: 1200px) {
          .flex-xl-nowrap .step .step-icon-wrap::before,
          .flex-xl-nowrap .step .step-icon-wrap::after {
            display: none;
          }
        }

        .bg-faded,
        .bg-secondary {
          background-color: #f5f5f5 !important;
        }
</style>
<script type="text/javascript">
	if('${requestScope.data}' == '[]') {
		alert('존재하지 않는 주문입니다.');
		window.history.back();
	}
</script>
  </head>
  <body>
    <div id="snippetContent">
      <div class="container padding-bottom-3x mb-1">
        <div class="card mb-3" style="margin-bottom: 0">
          <div class="p-4 text-center text-white text-lg bg-dark rounded-top">
            <span class="text-uppercase">주문확인서</span>
          </div>
          <div
            class="d-flex flex-wrap flex-sm-nowrap justify-conten	t-between py-3 px-2 bg-secondary"
          >
            <div class="w-100 text-center py-1 px-2">
              <span class="text-medium">주문번호 : </span> ${data[0].order_num	}
            </div>
            <div class="w-100 text-center py-1 px-2">
              <span class="text-medium">상태 : </span> ${data[0].order_status}
            </div>
            <div class="w-100 text-center py-1 px-2">
              <span class="text-medium" id="orderDate"></span>
              <script type="text/javascript">
              	document.querySelector('#orderDate').innerText = '주문날짜 : '+'${data[0].order_date}'.replace('T', " ");
              </script>
            </div>
          </div>
          <div class="card-body">
            <div
              class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x"
              style="margin-top: 50"
            >
              <div class="step completed">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-cart"></i></div>
                </div>
                <h4 class="step-title">주문완료</h4>
              </div>
              <div id="dlvy_ready" class="step">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-gift"></i></div>
                </div>
                <h4 class="step-title">배송준비</h4>
              </div>
              <div id="dlvy" class="step">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-car"></i></div>
                </div>
                <h4 class="step-title">배송 중</h4>
              </div>
              <div id="dlvy_fin" class="step">
                <div class="step-icon-wrap">
                  <div class="step-icon"><i class="pe-7s-home"></i></div>
                </div>
                <h4 class="step-title">배송완료</h4>
              </div>
            </div>
          </div>
            <!-- 배송지 -->
             <div class="d-flex flex-wrap flex-sm-nowrap justify-conten	t-between py-3 px-2 bg-secondary" >
            <div class="w-100 text-center py-1 px-2">
              <span class="text-medium">배송지 정보 </span>
            </div>
              </div>
              <div class="card-body">
            <div class="steps d-flex flex-wrap flex-sm-nowrap justify-content-between padding-top-2x padding-bottom-1x">
              <div class="col-12" style="margin-top: 30">
				<label class="form-label">수령인</label>
				<div>
					<p><b>${data[0].receiver_name}</b></p>
				</div>
				<label class="form-label">전화번호</label>
				<div>
					<p><b>${data[0].receiver_phone}</b></p>
				</div>
				<label class="form-label">배송지</label>
				<div>
					<p><b>${data[0].receiver_address}</b></p>
				</div>
			</div>
            </div>
          </div>
        </div>
      </div>
      
      <div id="snippetContent" style="margin-top: 30">
    <div class="container padding-bottom-3x mb-1">
      <div class="card mb-3">
        <div class="p-4 text-center text-white text-lg bg-dark rounded-top">
          <span class="text-uppercase">상세 주문 내역</span>
        </div>
            <div class="card-body">
                 <!-- Shopping cart table -->
        <div class="table-responsive" style="margin-bottom:50 ">
          <table class="table">
            <thead>
              <tr>
                <th scope="col" class="border-0 bg-light">
                  <div>제품명</div>
                </th>
                <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                  <div>상품금액</div>
                </th>
                <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                  <div>수량</div>
                </th>
                <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                  <div >합계</div>
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
                <td class="border-0 align-middle" style=" text-align: center;">${b.price}</td>
                <td class="border-0 align-middle" style=" text-align: center;">${b.prod_cnt}</td>
                <td class="border-0 align-middle" style=" text-align: center;" id="out_sum_${b.prod_id}">
                   <script type="text/javascript">
                       var sum = 0;
                      sum = ${b.price}*${b.prod_cnt}
                      document.querySelector('#out_sum_${b.prod_id}').innerText = sum;
                  </script>	
                </td>
              </tr>
             </c:forEach>
            </tbody>
          </table>
        </div>
        <!-- End -->
          </div>
        </div>
      </div>
    </div>
    </div>
<script type="text/javascript">
	if('${data[0].order_status}' == '배송준비') {
		document.querySelector('#dlvy_ready').className = 'step completed';

	}
	else if('${data[0].order_status}' == '배송 중'){
           document.querySelector('#dlvy_ready').className = 'step completed';
           document.querySelector('#dlvy').className = 'step completed';
	}
    else if('${data[0].order_status}' == '배송완료') {
        document.querySelector('#dlvy_ready').className = 'step completed';
        document.querySelector('#dlvy').className = 'step completed';
        document.querySelector('#dlvy_fin').className = 'step completed';
    }
</script>
  </body>
</html>
