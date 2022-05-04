<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<style type="text/css">
.search-sec{
    padding: 2rem;
}
.search-slt{
    display: block;
    width: 100%;
    font-size: 0.875rem;
    line-height: 1.5;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    height: calc(3rem + 2px) !important;
    border-radius:0;
}
.wrn-btn{
    width: 100%;
    font-size: 16px;
    font-weight: 400;
    text-transform: capitalize;
    height: calc(3rem + 2px) !important;
    border-radius:0;
}

</style>
<script type="text/javascript">
	function nonmemOrderList() {
		const order_num = document.querySelector('#order_num').value;
		
		if(order_num == '' || order_num == null) {
			alert('주문번호를 입력해주세요.');
			return 0;
		}
		else{
			location.href = 'orderTracking?order_num='+document.querySelector('#order_num').value;
		}
	}
</script>
</head>
<body>
<div class="container">
<h2>&emsp;&emsp;비회원 구매내역</h2>
<hr>
<section class="search-sec">
    <div class="container">
           <div class="row">
               <div class="col-lg-12">
               <label class="form-label">주문번호를 입력해주세요.</label>
                   <div class="row">
                       <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                           <input type="text" class="form-control search-slt" id="order_num" placeholder="주문번호 입력">
                       </div>
                       <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                           <button type="button" class="btn btn-danger wrn-btn" style="background-color:#f7d069; border-color: #f7d069" onclick="nonmemOrderList()">Search</button>
                       </div>
                   </div>
               </div>
           </div>
    </div>
</section>
 </div>
  
</body>