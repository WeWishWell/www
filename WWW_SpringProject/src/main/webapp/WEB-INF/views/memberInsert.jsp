<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="include/main_header.jsp"%>
<%@include file="include/daumjuso.jsp"%>
<%@include file="include/ajaxLoginCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insertmember.jsp</title>
</head>
<style>

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
<script type="text/javascript">
function pwtest() {
    var p1 = document.getElementById('pw').value;
    var p2 = document.getElementById('pw_re').value;
    var addr = document.form.addr.value;
    
	if(document.querySelector('#checkBtn').disabled == false) {
		alert("ID중복 체크를 해주세요.");
		return;
	}
	
	if( p1 != p2 ) {
		alert("비밀번호란과 비밀번호확인란을 일치시켜주십시오");
		return;
	}
	
	if(addr == '') {
		alert("주소를 입력해주세요.");
		return;
	}
	
    form.submit();
}

function checkRset() {
	document.querySelector('#checkBtn').className = 'btn btn-outline-success';
	document.querySelector('#checkBtn').disabled = false;
}

function showDetailAddr() {
	console.log('성공');
}

</script>
</head>
<body>
<div style="width: 100%; height: auto; ">
	<img alt="organic" style="z-index: -1; opacity: 0.5; width: 100%; position: absolute; margin: auto;" src="resources/images/index_bg2.jpg">
	<div class="container" style="padding-top: 50px;">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>
				<p align="right">
					<span class="important">필수입력항목</span>
				</p>
				<form name="form" action="memberInsert" method="post" class="validation-form"
					novalidate onsubmit="return false;">
					<div class="row">
						<div class="mb-3">
							<label for="id" class="important">아이디</label>
							<button type="button" onclick="idCheck();" id="checkBtn" class="btn btn-outline-success" style="position: absolute; margin: 24px 0 0 465px;">중복확인</button>
							<input type="text" onkeyup="checkRset();" style="width: 521px;" class="form-control" id="id" name="id" placeholder="문자와 숫자 조합으로 생성하세요" value="" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="pw" class="important">비밀번호</label> <input
								type="password" class="form-control" id="pw" name="pw"
								placeholder="" value="" required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="pw_re" class="important">비밀번호확인</label> <input
								type="password" class="form-control" id="pw_re" name="pw_re"
								placeholder="" value="" required>
							<div class="invalid-feedback">비밀번호확인을 입력해주세요.</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="name" class="important">이름</label> <input type="text"
							class="form-control" id="name" name="name" placeholder="예시) 홍길동"
							required>
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="address" class="important">주소</label>
						<button type="button" class="btn btn-secondary" style="width: 128px; margin: 24px 0 0 444px; position: absolute;" onclick="daumPostcode();">우편번호 찾기</button>
						<input type="text" readonly="readonly" style="width: 486px;" name="addr" class="form-control" placeholder="" aria-label="addr-holder" aria-describedby="addr-form">
						<div style="margin-top: 2px;">
							<input type="text" onkeyup="getDetailAddr(this);" style="width: 163px;" id="detailaddr" class="form-control" placeholder="상세주소" required>
							<div class="invalid-feedback">상세 주소를 입력해주세요.</div>
						</div>
						<input type="hidden" class="form-control" name="address">
					</div>
					<div class="mb-3">
						<label for="birthday" class="important">생년월일</label> <input
							type="date" class="form-control" id="birthday"
							name="birthday" max='' required>
						<div class="invalid-feedback">생년월일을 입력해주세요.</div>
						<script>
						document.getElementById('birthday').max = new Date().toISOString().substring(0, 10);;
						</script>
					</div>

					
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="button" onclick="pwtest();">가입
						완료</button>
				</form>
			</div>
		</div>
	</div>
</div>
	<script> window.addEventListener('load', () => { const forms = document.getElementsByClassName('validation-form'); Array.prototype.filter.call(forms, (form) => { form.addEventListener('submit', function (event) { if (form.checkValidity() === false) { event.preventDefault(); event.stopPropagation(); } form.classList.add('was-validated'); }, false); }); }, false); </script>
</body>
<script>
$('<span style="color:red;"> *</span>').insertAfter(".important");
</script>

</html>