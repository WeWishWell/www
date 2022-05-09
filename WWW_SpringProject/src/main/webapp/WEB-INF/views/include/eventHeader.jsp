<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.E_active {text-decoration:none; color: #000000; margin-left: 20px;}
.E_active:hover {color: #000000;}
</style>


</head>
<body>
	<div class="d-flex">
		<a class="nav-link E_active active btn btn-outline-secondary" id="eventListOn" href="eventListOn?check=do" style="font-size: 1rem;">진행 이벤트</a>
		<a class="nav-link E_active active btn btn-outline-secondary" id="eventListEnd" href="eventListOn?check=end" style="font-size: 1rem;">종료 이벤트</a>
		<a class="nav-link E_active active btn btn-outline-secondary" id="eventListWinner" href="eventListWinner" style="font-size: 1rem;">당첨자 발표</a>
	</div>
	
<script type="text/javascript">
	if(document.location.href.split('/shop/')[1].includes('eventListOn?check=do')) {
		document.querySelector('#eventListOn').style.color = '#000000';
	} else if(document.location.href.split('/shop/')[1].includes('eventListOn?check=end')) {
		document.querySelector('#eventListEnd').style.color = '#000000';
	} else if(document.location.href.split('/shop/')[1].includes('eventListWinner')) {
		document.querySelector('#eventListWinner').style.color = '#000000';
	}
</script>
</body>
</html>