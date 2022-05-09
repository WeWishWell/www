<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<%@include file="./include/daumjuso.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>purchase.jsp</title>
<!-- <link href="form-validation.css" rel="stylesheet"> -->
</head>


<script type="text/javascript">
	function user_addressBtn() {
// 		if('${sessionScope.data}' == '') {
		if('${data.user_id }'== "nonmember" || !isNaN('${data.user_id }')) {
			document.querySelector('#user-address').checked="";
			if (window.confirm("로그인 회원만 주소를 불러올 수 있습니다. 로그인 페이지로 이동하시겠습니까?")) {
				  location.href = "logIn";
			}
		}
		else{
			if(document.querySelector('#user-address').checked) {
				document.querySelector('#orderusername').value = "${data.user_name }";
				document.form.addr.value = "${data.address}";
				document.form.address.value = "${data.address}";
				document.querySelector('#detailaddr').hidden = true;
				document.querySelector('#addrBtn').hidden = true;
			} else {
				document.querySelector('#orderusername').value = "" ;
				document.form.addr.value = "" ;
				document.form.address.value = "";
				document.querySelector('#detailaddr').hidden = false;
				document.querySelector('#addrBtn').hidden = false;
			}
		}
	}
	
	(function() {
        'use strict';

        window.addEventListener('load', function() {
          var forms = document.getElementsByClassName('needs-validation');

          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
</script>

<body>
	<div class="container">
		<main>
			<div class="py-5 text-center">
				<h1>주문서</h1>
			</div>

			<div class="center">
				<div class="col-md-7 col-lg-8" style="margin: auto;">
				
					<hr class="my-4">
					<h3>주문 상품 정보</h3>
					<div class="col-12" style="margin-top: 30">
						<label for="product_info" class="form-label">주문 상품</label>
						<div>
							<p><b>${data.prod_name }</b> 상품 등 <b>${data.ttl_cnt }</b>개</p>
						</div>
						<label for="bill" class="form-label">주문 금액</label>
						<div>
							<p><b>${data.amount }</b>원</p>
						</div>
					</div>
				

					<hr class="my-4">
					<h3>주문자 정보</h3>
					<div class="col-12" style="margin-top: 30">
						<label for="username" class="form-label">이름</label>
						<div class="input-group has-validation">
							<input type="text" class="form-control" id="username" value="${data.user_name }">
						</div>
					</div>


					<hr class="my-4">
					<h3>배송지 정보</h3>
					<div class="form-check" style="margin-top: 30">
						<input type="checkbox" class="form-check-input" id="user-address" onclick="user_addressBtn();">
						<label class="form-check-label" for="user-address">
							주문자 정보와 동일
						</label>
					</div>
					<br>
					
					<form action="purchase" method="post" name="form" class="needs-validation" novalidate>
<!-- 					<form class="needs-validation" novalidate> -->
					<input type="hidden" name="user_id" value="${data.user_id }">
					<input type="hidden" name="buy_method" value="${data.method }">
					<input type="hidden" name="prod_id" value="${data.prod_id }">
					<input type="hidden" name="prod_cnt" value="${data.ttl_cnt }">
						<div class="col-12">
							<label for="orderusername" class="form-label">이름</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="orderusername" name="receiver_name" placeholder="받는사람 이름" required>
								<div class="invalid-feedback">받는 사람 이름을 입력해주세요.</div>
							</div>
						</div>

						<div class="col-12">
							<label for="phone" class="form-label">전화번호</label> 
							<div class="input-group has-validation">
								<input type="tel" class="form-control" id="phone" name="receiver_phone" placeholder="010-1234-5678" required>
								<div class="invalid-feedback">배송현황을 연락받을 전화번호를 입력해주세요.</div>
							</div>
						</div>

						<div class="col-12">
							<label for="address" class="important">주소</label>
							<button type="button" id="addrBtn" class="btn btn-secondary" style="width: 128px; margin: 64px 0 0 135px; position: absolute;" onclick="daumPostcode();">우편번호 찾기</button>
							<input type="text" readonly="readonly" name="addr" class="form-control" placeholder="" aria-label="addr-holder" aria-describedby="addr-form">
							<div style="margin-top: 2px;">
								<input type="text" onkeyup="getDetailAddr(this);" style="width: 163px;" id="detailaddr" class="form-control" placeholder="상세주소" required>
							</div>
							<input type="hidden" class="form-control" name="address">
						</div>

						<hr class="my-4">
						<h3 class="mb-3">결제방식</h3>
						<div class="my-3" style="margin-top: 50">
							<div class="form-check">
								<input id="credit_c" value="creditcard" name="paymentMethod" type="radio" class="form-check-input" checked onclick="credit_show();" > 
									<label class="form-check-label" for="credit_c">신용카드</label>
							</div>
							<div class="form-check">
								<input id="deposit_c" value="deposit" name="paymentMethod" type="radio" class="form-check-input" onclick="deposit_show();" > 
									<label class="form-check-label" for="deposit_c">무통장입금</label>
							</div>
						</div>
						
						<div class="row gy-3" id="credit" >
							<div class="col-md-6">
								<label for="cc-name" class="form-label">카드 소지자 이름</label> 
								<input type="text" class="form-control" id="cc-name" placeholder="" required="required"> 
									<small class="text-muted">
										카드에 적혀있는 카드 소지자 이름을 입력해주세요.
									</small>
								<div class="invalid-feedback">카드 소지자 이름을 입력해주세요.</div>
							</div>

							<div class="col-md-6">
								<label for="cc-number" class="form-label">
									카드 번호 입력
								</label> 
								<input type="text" class="form-control" id="cc-number" placeholder="" required="required">
								<div class="invalid-feedback">
									결제카드의 카드번호를 입력해주세요.
								</div>
							</div>

							<div class="col-md-3">
								<label for="cc-expiration" class="form-label">유효기간</label> 
								<input type="text" class="form-control" id="cc-expiration" placeholder="" required="required">
								<div class="invalid-feedback">결제카드의 유효기간을 입력해주세요.</div>
							</div>

							<div class="col-md-3">
								<label for="cc-cvv" class="form-label">CVV</label> 
								<input type="text" class="form-control" id="cc-cvv" placeholder="" required="required">
								<div class="invalid-feedback">결제카드의 cvv를 입력해주세요.</div>
							</div>
						</div>
						
						<div class="row gy-3"  id="deposit" style="display: none;">
						    <div class="col-md-8">
						        <label for="cc-name" class="form-label">입금액 : <b>${data.amount }</b>원</label><br>
						        <label for="cc-name" class="form-label">예금주 명 : <b>홍길동</b>  |  계좌번호 : <b>110-123-456789</b> (신한은행)</label><br>
						        <label for="cc-name" class="form-label">입금자명</label> 
						        <input type="text" class="form-control" id="deposit-name" placeholder=""> 
						            <small class="text-muted">
						                실제 입금하실 때의 이름을 적어주세요.
						            </small>
						        <div class="invalid-feedback">입금자명을 입력해주세요.</div>
						    </div>
						</div>
						
						<script type="text/javascript">
							function credit_show(){
							  document.getElementById('credit').style.display ='';
							  document.getElementById('deposit').style.display = 'none';
							  
							  document.querySelector('#cc-name').required = "required";
							  document.querySelector('#cc-number').required = "required";
							  document.querySelector('#cc-expiration').required = "required";
							  document.querySelector('#cc-cvv').required = "required";
							  
							  document.querySelector('#deposit-name').required = "";
							}
							function deposit_show(){
							  document.getElementById('credit').style.display ='none';
							  document.getElementById('deposit').style.display = '';
							  
							  document.querySelector('#cc-name').required = "";
							  document.querySelector('#cc-number').required = "";
							  document.querySelector('#cc-expiration').required = "";
							  document.querySelector('#cc-cvv').required = "";
							  
							  document.querySelector('#deposit-name').required = "required";
							}
						</script>
						
						<hr class="my-4">
						<div class="form-check" style="margin-top: 30">
						<input type="checkbox" class="form-check-input" id="order-agree" value="agree-true" placeholder="" required>
						<label class="form-check-label" for="order-agree">
							결제 정보 동의
						</label>
					</div>

						<button class="w-100 btn btn-primary btn-lg" type="submit" style="margin-top: 30">결제하기</button>
					</form>
				</div>
			</div>
		</main>
	</div>
    
</body>
</html>