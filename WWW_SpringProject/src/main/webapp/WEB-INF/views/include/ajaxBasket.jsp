<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="jquery.jsp" %>

<script type="text/javascript">

function plusAJAX(prod_id, cnt) {
	
	$.ajax({
		type:'GET',
		url:'basketChange',
		dataType:'json',
		data: {prod_id:prod_id, user_id:'${sessionScope.data}', cnt:cnt, change:'+'},
		success: function (data) {
			if(data == -1) {
				alert('오류 발생');
				return;
			}
			$('#innerProdCnt'+prod_id).text(data);
			let price = $('#prodPrice'+prod_id).text().replace(/[^0-9]/g,'');
			let prodSum = price*data
			totalPrice(prodSum, prod_id);
			AlltotalPrice();
		},
		error: function (request, status, error) {
			console.log(request, status, error);
		}
	});
}

function minusAJAX(prod_id, cnt) {
	
	$.ajax({
		type:'GET',
		url:'basketChange',
		dataType:'json',
		data: {prod_id:prod_id, user_id:'${sessionScope.data}', cnt:cnt, change:'-'},
		success: function (data) {
			if(data == -1) {
				alert('오류 발생');
				return;
			}
			$('#innerProdCnt'+prod_id).text(data);
			let price = $('#prodPrice'+prod_id).text().replace(/[^0-9]/g,'');
			let prodSum = price*data
			totalPrice(prodSum, prod_id);
			AlltotalPrice();
		},
		error: function (request, status, error) {
			console.log(request, status, error);
		}
	});
}

</script>