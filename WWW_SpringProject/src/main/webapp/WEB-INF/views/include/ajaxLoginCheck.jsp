<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	function check() {
		let id = document.form.id;
		let pw = document.form.pw;
		
		if(id.value == '') {
			alert('아이디를 입력하세요.');
			id.focus();
			return;
		}
		if(pw.value == '') {
			alert('비밀번호를 입력하세요.');
			pw.focus();
			return;
		}
		$.ajax({
			type:'POST',
			url:'loginCheck',
			dataType:'json',
			data: {id:id.value, pw:pw.value},
			success: function (data) {
				if(data != 1) {
					alert('아이디 혹은 비밀번호 오류입니다.');
					document.querySelector('#inputPw').focus();
					return;
				}
				document.form.submit();
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}

	function idCheck() {
		let id = document.form.id;
		
		if(id.value == '') {
			alert('아이디를 입력하세요.');
			id.focus();
			return;
		}
		
		$.ajax({
			type:'GET',
			url:'idCheck',
			dataType:'json',
			data: {id:id.value},
			success: function (data) {
				if(data == 1) {
					alert('중복되는 ID입니다.');
					document.querySelector('#id').focus();
					return;
				}
				const check = idFormCheck();
				if(check == 0) {
					return;
				}
				alert('사용 가능한 ID입니다.');
				document.querySelector('#checkBtn').className = 'btn btn-secondary';
				document.querySelector('#checkBtn').disabled = true;
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	
	function idFormCheck() {
	    const idCheck = '문자와 숫자의 조합은 필수입니다.';
		
	    if(isNaN(document.querySelector('#id').value)) {
	    	if(document.querySelector('#id').value.replace(/\D/g,'') == '') {
	    		alert(idCheck);
	    		return 0;
	    	} else {
	    		return 1;
	    	}
	    } else {
	    	alert(idCheck);
	    	return 0;
	    }
	}
	
	
	
	function pwTrue() {
		let pw = document.form.pw;
		const id = '${sessionScope.data}';
		
		if(pw.value == '') {
			alert('비밀번호를 입력하세요.');
			pw.focus();
			return;
		}
		
		$.ajax({
			type:'POST',
			url:'pwTrueCheck',
			dataType:'json',
			data: {id:id, pw:pw.value},
			success: function (data) {
				if(data != 1) {
					alert('비밀번호가 틀립니다.');
					pw.focus();
					return;
				}
				const refFull = document.referrer.substring(document.referrer.indexOf('/shop/')+6);
				const ref = refFull.substring(0, refFull.indexOf('?'));
				location.href = 'pwTrue?ref='+ref;
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>