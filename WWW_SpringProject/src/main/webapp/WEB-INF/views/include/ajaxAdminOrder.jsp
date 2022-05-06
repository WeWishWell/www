<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="jquery.jsp" %>

<script type="text/javascript">
	function updateStatus(order_num, status) {
		$.ajax({
			type:'POST',
			url:'updateStatus',
			dataType:'json',
			data: {order_num: order_num, order_status: status},
			success: function (data) {
				if(data != 0) {
					typeCheck(order_num, status);
				} else {
					alert('정보 업데이트에 실패했습니다.');
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>