<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<%@ include file="include/ajaxCheck.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productDetail.jsp</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->

<script type="text/javascript">
	function cntCheck() {
		const cnt = document.querySelector('#out_cnt').innerText;
		
		if(cnt == '' || cnt == '선택') {
			alert('수량을 입력하세요.');
			return 0;
		}
	}
	
	function buyBtn() {
		const check = cntCheck();
		if(check != 0) {
			location.href = 'purchaseOne?user_id=${sessionScope.data}&prod_id=${data.id}&prod_name=${data.name}&p_p=${data.price}&p_c='+document.querySelector('#out_cnt').innerText;
		}
		
	}
	
	function modal() {
		const check = cntCheck();
		if(check != 0) {
				basketCheck();
		}
	}
	
	function like() {
		if(!isNaN('${sessionScope.data}')) {
			if (window.confirm("로그인 회원만 찜 기능을 사용할 수 있습니다. 로그인 페이지로 이동하시겠습니까?")) {
				  location.href = "logIn";
			}
		} else {
			if(document.querySelector('#jjim').className == 'btn btn-danger') {
				likeDelete();
			} else {
				likeInsert();
			}
		}
	}
	
	var get_recent_items = getCookie("recent_view_items");
	if(get_recent_items == null){
	var set_recent_items = setCookie("recent_view_items",${data.id},1);
	}else{
	const getarr_recent_items =getCookie("recent_view_items").split(',');
	var check_recent_items = getarr_recent_items.indexOf('${data.id}');
		if(check_recent_items == -1){
		var update_recent_items = get_recent_items+","+${data.id};
		setCookie("recent_view_items",update_recent_items,1);
		}else{
		getarr_recent_items.splice(check_recent_items,1);
		var update_recent_items = getarr_recent_items+","+${data.id};
		//배열에서 문자열로 자동 변환?? 왜?
		setCookie("recent_view_items",update_recent_items,1);
		} 
	}
</script>
</head>



<body>
	<!-- <table border="1"> -->
	<%-- <tr><th>상품설명</th><td>${data.disc }</td></tr> --%>
	<%-- <tr><th>가격</th><td>${data.price }</td></tr> --%>
	<!-- </table> -->
	
	
	<button id="modalBtn" hidden="true" type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#basketModal"></button>
	<!-- Modal -->
	<div class="modal fade" id="basketModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">${data.name}</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        상품이 장바구니에 담겼습니다. 확인하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <a href="basketList?id=${sessionScope.data}" class="btn btn-primary">확인</a>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<div class="container" style="padding-top: 30px;">
		<div class="row">
			<div class="col">
				<img src="resources/images/pro_${data.id}.png" alt="Image"
					style="max-width: 80%;" />
			</div>
			<div class="col">
				<h3>${data.name }</h3>
                <h5>${data.price }</h5>
                <hr>
                ${data.disc } <br>
                <br>
                <div class="col" align="right">
                    <select class="form-select form-select-lg mb-3" name="cnt"
                        aria-label=".form-select-lg example" style="width: 100">
                        <option selected>선택</option>
                        <% for (int i = 0; i < 10; i++) { %>
                        <option value="<%=i+1 %>"><%=i+1 %></option>
                        <% } %>
                    </select>
                    
                    <table class="table" style="width: 50%">
			            <thead>
			                <tr align="center">
			                    <th scope="col">금액</th>
			                    <th scope="col">수량</th>
			                </tr>
			            </thead>
			            <tbody>
			                <tr align="center">
			                    <td>${data.price }</td>
			                    <td id="out_cnt" >
			                    <script type="text/javascript">
			                    $("select[name=cnt]").change(function(){
			                    	document.querySelector('#out_cnt').innerText = $(this).val(); //value값 가져오기
			                    	});
			                    </script>
			                    </td>
			                </tr>
			            </tbody>
			            <thead>
			                <tr align="center">
			                    <th scope="col">합계</th>
			                    <td scope="col" id="out_sum">
				                    <script type="text/javascript">
			                    	$("select[name=cnt]").change(function(){
			                    		sum = $(this).val()*${data.price }
			                    		if(document.querySelector('#out_cnt').innerText != '선택') {
			                    			document.querySelector('#out_sum').innerText = sum; //value값 가져오기
			                    		} else {
			                    			document.querySelector('#out_sum').innerText = '';
			                    		}
			                    	});
			                    </script>	
				                    	
				                    	
			                    </td>
			                </tr>
			            </thead>
			        </table>
			                    

                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div>
                                    <button id="jjim" style="padding: 6px;" onclick="like();" type="button" class="btn btn-outline-danger"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
									<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
									</svg></button>
                                    <button id="modalBtn" hidden="true" type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#heartModal"></button>
									<script type="text/javascript">
										if('${requestScope.likeCheck}' == 1) {
											document.querySelector('#jjim').className = 'btn btn-danger';
										} else {
											document.querySelector('#jjim').className = 'btn btn-outline-danger';
										}
									</script>
									
									
                                    <button id="basketBtn" onclick="modal();" type="button" class="btn btn-secondary">장바구니</button>
                                    <button type="button" onclick="buyBtn();" class="btn btn-primary">구매하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
</body>
</html>