<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="jquery.jsp" %>

<script type="text/javascript">
	function likeInsert() {
		const prod_id = '${data.id}';
		const user_id = '${sessionScope.data}';
		
		$.ajax({
			type:'GET',
			url:'likeInsert',
			dataType:'json',
			data: {prod_id:prod_id, user_id:user_id},
			success: function (data) {
				if(data != 1) {
					alert('오류가 발생해서 찜 목록 추가에 실패했습니다.');
					return;
				}
				document.querySelector('#jjim').className = 'btn btn-danger';
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	
	function likeDelete() {
		const prod_id = '${data.id}';
		const user_id = '${sessionScope.data}';
		
		$.ajax({
			type:'GET',
			url:'likeDelete',
			dataType:'json',
			data: {prod_id:prod_id, user_id:user_id},
			success: function (data) {
				if(data != 1) {
					alert('오류가 발생해서 찜 목록 삭제에 실패했습니다.');
					return;
				}
				document.querySelector('#jjim').className = 'btn btn-outline-danger';
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	
	function basketCheck() {
		const prod_id = '${data.id}';
		let user_id = '${sessionScope.data}';
		const cnt = document.querySelector('#out_cnt').innerText;
		
		$.ajax({
			type:'GET',
			url:'basketCheck',
			dataType:'json',
			data: {prod_id:prod_id, user_id:user_id, cnt:cnt},
			success: function (data) {
				if(data != 1) {
					alert('오류가 발생해서 장바구니 등록에 실패했습니다.');
					return;
				}
				document.querySelector('#modalBtn').click();
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>