<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/ajaxAdminOrder.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송현황(ADMIN)</title>
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css"
    />
    
<script type="text/javascript">
	//DB에서 호출시 버튼 초기값 결정 함수
	function typeCheck(order_num, status) {
		if(status == '주문완료') {
			document.querySelector('#order_btn'+order_num).className = 'btn btn-danger btn-sm'
		} else if(status == '배송준비') {
			document.querySelector('#order_btn'+order_num).className = 'btn btn-light btn-sm disabled'
			document.querySelector('#dlvy_ready_btn'+order_num).className = 'btn btn-warning btn-sm'
		} else if(status == '배송 중') {
			document.querySelector('#order_btn'+order_num).className = 'btn btn-light btn-sm disabled'
			document.querySelector('#dlvy_ready_btn'+order_num).className = 'btn btn-light btn-sm disabled'
			document.querySelector('#dlvy_btn'+order_num).className = 'btn btn-success btn-sm'
		} else {
			document.querySelector('#order_btn'+order_num).className = 'btn btn-light btn-sm disabled'
			document.querySelector('#dlvy_ready_btn'+order_num).className = 'btn btn-light btn-sm disabled'
			document.querySelector('#dlvy_btn'+order_num).className = 'btn btn-light btn-sm disabled'
			document.querySelector('#dlvy_fin_btn'+order_num).className = 'btn btn-primary btn-sm'
		}
	}
	
	// 클릭시 변경되는 버튼 상태
	function order_track(raw_status, status, order_num){
		if(status == "배송준비" && raw_status != "배송준비") {
			if(confirm("배송준비 상태로 변경하시겠습니까?\n"+
						"변경 후에는 이전 상태로 되돌릴 수 없습니다.\n\n"+
						"주문번호 : "+order_num+"\n"+
						"현재 배송상태 : "+raw_status)) {
					updateStatus(order_num, status);
			}
		} else if(status == "배송 중" && raw_status != "배송 중") {
			if(confirm("배송 중 상태로 변경하시겠습니까?\n"+
						"변경 후에는 이전 상태로 되돌릴 수 없습니다.\n\n"+
						"주문번호 : "+order_num+"\n"+
						"현재 배송상태 : "+raw_status)) {
					updateStatus(order_num, status);
			}
		} else if(status == "배송완료" && raw_status != "배송완료") {
			if(confirm("배송완료 상태로 변경하시겠습니까?\n"+
						"변경 후에는 이전 상태로 되돌릴 수 없습니다.\n\n"+
						"주문번호 : "+order_num+"\n"+
                    	"현재 배송상태 : "+raw_status)) {
					updateStatus(order_num, status);
			}
		}
	}
</script>
</head>
<body>
<div style="display: flex;">

<!-- sidebar -->
<%@include file="../include/adminSidebar.jsp"%>

<!-- 본문 -->
      <div class="container" style="margin-top: 15px;">
         <h2>&emsp;&emsp;배송현황</h2>
         <hr>
         <div class="row">
            
            <!-- 검색창 -->
            <form action="adminOrder" method="post">
            <div class="container">
            <div class="row">
            
		    	<!-- 키워드 검색 -->
			  	<div class="input-group mb-3" style="width: 350px;">
				  <select class="form-select" name="searchType" id="inputGroupSelect01">
				    <option value="order_num" id="order_num">주문번호</option>
			        <option value="user_id" id="user_id">주문자 ID</option>
				  </select>
				  <input type="text" class="form-control" name="searchKeyword" id="search_kw" style="width: 100px;">
				</div>
				<script type="text/javascript">
					// 검색 후 값 유지
					if('${searchkw.searchKeyword}'!= ''){
						document.querySelector('#${searchkw.searchType}').selected = true;
						document.querySelector('#search_kw').value = '${searchkw.searchKeyword}'
					}
				</script>
			  	
			  	<!-- 배송상태 검색 -->
			    <div class="input-group mb-3" style="width: 250px;">
				  <label class="input-group-text" for="inputGroupSelect01">배송상태</label>
				  <select class="form-select" name="order_status" id="inputGroupSelect01">
				    <option value="">전체상태</option>
				    <option value="주문완료" id="status1">주문완료</option>
			        <option value="배송준비" id="status2">배송준비</option>
			        <option value="배송 중" id="status3">배송 중</option>
			        <option value="배송완료" id="status4">배송완료</option>
				  </select>
				</div>
				<script type="text/javascript">
					// 검색 후 값 유지
					if('${searchkw.order_status}' == "주문완료"){
						document.querySelector('#status1').selected = true
					} else if('${searchkw.order_status}' == "배송준비"){
						document.querySelector('#status2').selected = true
					} else if('${searchkw.order_status}' == "배송 중"){
						document.querySelector('#status3').selected = true
					} else if('${searchkw.order_status}' == "배송완료"){
						document.querySelector('#status4').selected = true
					}
				</script>
			    
			    
			    <!-- 날짜검색 -->
			    <div class="input-group mb-3" style="width: 600px;">
				  	<span class="input-group-text" id="basic-addon1">주문일자</span>
				  	<input type="date" name="startDate" id="startDate" class="form-control"/>
			  		<span class="input-group-text bg-body border-0" id="basic-addon1">~</span>
		   			<input type="date" name="endDate" id="endDate" class="form-control" />
		   			<script type="text/javascript">
						// 달력 검색 날짜 최소, 최대 설정
		   				document.getElementById('startDate').max = new Date().toISOString().substring(0, 10);
						document.getElementById('endDate').max = new Date().toISOString().substring(0, 10);
						
						document.getElementById('endDate').addEventListener('click', function() {
							const sd = document.getElementById('startDate');
							const ed = document.getElementById('endDate');
							
							if(sd.value == '') {
								ed.min = '';
							} else {
								ed.min = sd.value;
							}
						});
						
						document.getElementById('startDate').addEventListener('click', function() {
							document.getElementById('endDate').value = '';
							document.getElementById('endDate').min = '';
						});
						
						// 검색 후 값 유지
		   				if('${searchkw.startDate}'!= ''){
				       		document.getElementById('startDate').value = '${searchkw.startDate}';
				       	}
				       	if('${searchkw.endDate}'!= ''){
				       		document.getElementById('endDate').value = '${searchkw.endDate}';
				       	}
					</script>
				    
				  	<!-- 검색버튼 -->
				  	<button type="submit" class="btn btn-primary" >
				    	조회 <span class="pe-7s-search"></span>
				  	</button>
				  	
				  	<button type="button" class="btn btn-secondary" onclick="location.href='adminOrder'">
				    	초기화 
				  	</button>
				</div>
			</div>
			</div>
			
			</form>
			
			<!-- 주문 리스트 -->
            <div class="row-lg-12 p-5 bg-white rounded mb-5">
               <div class="table-responsive">
                  <table class="table">
                     <thead class="thead-light">
                        <tr>
                           <th scope="col" style=" text-align: center;">주문번호</th>
                           <th scope="col" style=" text-align: center;">주문자 ID</th>
                           <th scope="col" style=" text-align: center;">주문일자</th>
                           <th scope="col" style=" text-align: center;">배송상태</th>
                        </tr>
                     </thead>
                     <tbody>
                     <!-- 주문리스트 반복문 -->
                      <c:forEach var="b" items="${data}">
                        <tr>
							<!-- 주문번호 -->
                           <th scope="row" style=" text-align: center;">${b.order_num}</th>
                           <!-- 주문자 ID, 비회원(난수)일 경우 nonmember 치환 -->
                           <td style=" text-align: center;"><a href="orderTracking?order_num=${b.order_num}" id="orderId${b.order_num}">${b.user_id }</a></td>
                           <!-- 주문날짜 -->
                           <td style=" text-align: center;" id="orderDate${b.order_num}">
                              <script type="text/javascript">
                                  document.querySelector('#orderDate${b.order_num}').innerText = '${b.order_date}'.replace('T', " ");
                              </script> 
                           </td>
                           <!-- 배송현황 버튼 -->
                           <td style=" text-align: center;">
                              <button type="button" value="test" class="btn btn-light btn-sm" id="order_btn${b.order_num}" onclick="order_track('${b.order_status}', '주문완료', ${b.order_num})">
                                 <span class="pe-7s-cart"> 주문완료 </span>
                              </button>
                              <button type="button" class="btn btn-light btn-sm" id="dlvy_ready_btn${b.order_num}" onclick="order_track('${b.order_status}', '배송준비', ${b.order_num})">
                                 <span class="pe-7s-gift"> 배송준비 </span>
                              </button>
                              <button type="button" class="btn btn-light btn-sm" id="dlvy_btn${b.order_num}" onclick="order_track('${b.order_status}', '배송 중', ${b.order_num})">
                                 <span class="pe-7s-car"> 배송 중 </span>
                              </button>
                              <button type="button" class="btn btn-light btn-sm" id="dlvy_fin_btn${b.order_num}" onclick="order_track('${b.order_status}', '배송완료', ${b.order_num})">
                                 <span class="pe-7s-home"> 배송완료 </span>
                              </button>
                           </td>
                        </tr>
                        <script type="text/javascript">
	                        if('${b.user_id }'== "nonmember" || !isNaN('${b.user_id }')) {
	                      		document.querySelector('#orderId${b.order_num}').innerText = "nonmember";
							}
                        
                        	typeCheck('${b.order_num}', '${b.order_status}');
						</script>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
</div>
</body>
</html>