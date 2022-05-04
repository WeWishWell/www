<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<%@ include file="include/daumjuso.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>

<style type="text/css">
	.mb-3 {width: 500px; margin: 15px 0 0 50px;}
	.input-group-text {width: 90px; display: inline;}
</style>

<script type="text/javascript">
function check() {
	const form = document.form;
	const pw = form.pw;
	const repw = form.repw;
	const name = form.name;
	
	if(pw.value == '') {
		alert('새 비밀번호를 입력해주세요.');
		pw.focus();
		return;
	}
	if(repw.value == '') {
		alert('비밀번호 재확인을 해주세요.');
		repw.focus();
		return;
	}
	if(name.value == '') {
		alert('이름은 필수입니다.');
		name.focus();
		return;
	}
	if(pw.value != repw.value) {
		alert('비밀번호가 다릅니다.');
		repw.focus();
		return;
	}
	
	form.submit();
}

function checkDel() {
	if (window.confirm("삭제한 계정은 되돌릴 수 없습니다. 정말 삭제하시겠습니까?")) {
		alert('삭제가 완료되었습니다. 이용해주셔서 감사합니다.');
		location.href = "delete?id=${sessionScope.data}";
	}
}

</script>

</head>

<body>
	<div id="maindiv" class="bgColor">
		<div class="input-group mb-3">
			<h3>내 정보</h3>
		</div>
		
		<form name="form" method="post">
			<div class="input-group mb-3">
				<span class="input-group-text" id="id-form">
					아이디
				</span>
				<input type="text" class="form-control" name="id" value="${requestScope.data.id}" readonly="readonly">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="pw-form">
					비밀번호
				</span>
				<input type="password" name="pw" class="form-control" placeholder="비밀번호를 입력하세요." aria-label="pw-holder" aria-describedby="pw-form">
			</div>
			<div class="input-group mb-3" style="margin-top: -10px;">
				<span class="input-group-text" id="pw-form">
					확인
				</span>
				<input type="password" name="repw" class="form-control" placeholder="비밀번호를 재입력하세요." aria-label="repw-holder" aria-describedby="pw-form">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="name-form">
					이름
				</span>
				<input type="text" value="${requestScope.data.name}" name="name" class="form-control" placeholder="이름을 입력하세요." aria-label="name-holder" aria-describedby="name-form">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" id="birth-form">
					생일
				</span>
				<input type="date" value="${requestScope.data.birthday}" name="birthday" id="birthday" max="" class="form-control" placeholder="" aria-label="bitrh-holder" aria-describedby="birth-form">
			</div>
			<div class="mb-3">
				<input type="text" readonly="readonly" value="${requestScope.data.address}" name="addr" class="form-control" placeholder="" aria-label="addr-holder" aria-describedby="addr-form">
				<div class="input-group" style="width: 400px; margin-top: 2px;">
					<input type="text" onkeyup="getDetailAddr(this);" id="detailaddr" class="form-control" placeholder="상세주소">
					<button type="button" class="btn btn-secondary" onclick="daumPostcode();">우편번호 찾기</button>
				</div>
				<input type="hidden" class="form-control" name="address">
				<script type="text/javascript">
					getBeforeAddr();
				</script>
			</div>
			<div class="mb-3">
				<a onclick="check();" class="btn btn-outline-primary">정보 수정</a>
				<a onclick="checkDel();" class="btn btn-outline-danger">회원 탈퇴</a>
			</div>
		</form>
	</div>
<script type="text/javascript">
	document.getElementById('birthday').max = new Date().toISOString().substring(0, 10);
</script>
</body>
</html>
