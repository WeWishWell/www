<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

function ajaxPopup(prod) {
	var w = window.open("about:blank","_blank","top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no");
	name = prod.name.replace(/&nbsp;/g, " ");
	console.log(name);
	
	$.ajax({
		type:'GET',
		url:'ajaxPopup',
		dataType:'html',
		success: eventSuccess,
		error: function (request, status, error) {
			console.log(request, status, error);
		}
	});
	
	function eventSuccess(data)
	{
		w.location.href = "reviewWrite?id="+prod.id+"&name="+name+"&odm="+prod.odm;
	}
}

function insertReview() {
	const num = '${requestScope.prodata.odm}';
	const prod_id = '${requestScope.prodata.id}';
	const prod_name = '${requestScope.prodata.name}';
	const user_id = '${sessionScope.data}';
	const star = document.form.star.value;
	const title = document.form.title.value;
	const content = document.form.content.value;
	
	$.ajax({
		type:'POST',
		url:'reviewWrite',
		dataType:'json',
		data: {'num': num, 'prod_id': prod_id, 'prod_name': prod_name, 'user_id': user_id, 'star': star, 'title': title, 'content': content},
		success: function (data) {
			if(data == 1) {
				alert('리뷰해주셔서 감사합니다.');
				opener.parent.location.reload();
				window.close();
				return;
			}
			alert('오류가 발생했습니다. 다시 시도해주세요.');
		},
		error: function (request, status, error) {
			console.log(request, status, error);
		}
	});
}

</script>