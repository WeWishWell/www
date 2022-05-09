<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="jquery.jsp" %>

<script type="text/javascript">
	function Increase_likeCNT(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		$.ajax({
			type: 'GET',
			url : 'Increase_likeCNT',
			dataType : 'json',
			data: {num: num},
			success: function (data) {
				if(data != 1) {
					alert('오류가 발생해서 실패했습니다..');
					return;
				}
				checklikecntvalue(number);
				var chklikecnt = checkreviewcnt(number);
				if(chklikecnt == 1){
					clickevent(number);
				}else{
					unclickevent(number);
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function Decrease_likeCNT(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		
		$.ajax({
			type: 'GET',
			url : 'Decrease_likeCNT',
			dataType : 'json',
			data: {num: num},
			success: function (data) {
				if(data != 1) {
					alert('오류가 발생해서 실패했습니다..');
					return;
				}
				checklikecntvalue(number);
				var chklikecnt = checkreviewcnt(number);
				if(chklikecnt == 1){
					clickevent(number);
				}else{
					unclickevent(number);
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function Modify_un2likeCNT(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		
		$.ajax({
			type: 'GET',
			url : 'Modify_un2likeCNT',
			dataType : 'json',
			data: {num: num},
			success: function (data) {
				if(data != 1) {
					alert('오류가 발생해서 좋아요가 실패했습니다..');
					return;
				}
				checklikecntvalue(number)
				clickevent(number);
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function Modify_li2unlikeCNT(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		
		$.ajax({
			type: 'GET',
			url : 'Modify_li2unlikeCNT',
			dataType : 'json',
			data: {num: num},
			success: function (data) {
				if(data != 1) {
					alert('오류가 발생해서 좋아요가 실패했습니다..');
					return;
				}
				checklikecntvalue(number)
				clickevent(number);
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function insert_reviewlike(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		const id = '${sessionScope.data}';
		const like = document.querySelector('#thumb_up'+number).value;
		$.ajax({
			type: 'GET',
			url : 'insert_reviewlike',
			dataType : 'json',
			data:{num: num, id: id,like: like},
			success: function(data){
				if(data != 1) {
					alert('오류가 발생해서 좋아요 추가에 실패했습니다..');
					return ;
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function insert_unlikereview(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		const id = '${sessionScope.data}';
		const like = document.querySelector('#thumb_down'+number).value;
		$.ajax({
			type: 'GET',
			url : 'insert_reviewlike',
			dataType : 'json',
			data:{num: num, id: id,like: like},
			success: function(data){
				if(data != 1) {
					alert('오류가 발생해서 좋아요 추가에 실패했습니다..');
					return ;
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	//review 번호와 id를 통해서 좋아요를 눌렀었는지 확인
	function check_reviewLike(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		const id = '${sessionScope.data}';
		let rs = null;
		$.ajax({
			type: 'GET',
			url : 'check_reviewLike',
			dataType : 'json',
			async: false,
			data:{num: num, id: id},
			success: function(data){
				if(data == 1 ) {
					alert('좋아요는 한번만 누를 수 있습니다.');
					rs = data;
					return 
				}else if(data == -1){
					rs = data;
					return 
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
		return rs;
	}
	function delete_reviewlike(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		const id = '${sessionScope.data}';
		$.ajax({
			type: 'GET',
			url : 'delete_reviewlike',
			dataType : 'json',
			data:{num: num, id: id},
			success: function(data){
				if(data != 1) {
					alert('오류가 발생해서 reviewlike테이블을 제거하지 못했습니다.');
					return ;
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	//싫어요를 눌렀는지 확인
	function check_review_unLike(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		const id = '${sessionScope.data}';
		let rs = null;
		$.ajax({
			type: 'GET',
			url : 'check_reviewLike',
			dataType : 'json',
			async: false,
			data:{num: num, id: id},
			success: function(data){
				if(data == -1 ) {
					alert('싫어요는 한번만 누를 수 있습니다.');
					rs = data;
					return 
				}else if(data == 1){
					rs = data;
					return 
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
		return rs;
	}
	function modify_like2unlike(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		const id = '${sessionScope.data}';
		const like = document.querySelector('#thumb_down'+number).value;
		$.ajax({
			type: 'GET',
			url : 'update_reviewlike',
			dataType : 'json',
			data:{num: num, id: id,like: like},
			success: function(data){
				if(data != 1) {
					alert('오류가 발생해서 좋아요 수정에 실패했습니다..');
					return ;
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function modify_unlike2like(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		const id = '${sessionScope.data}';
		const like = document.querySelector('#thumb_up'+number).value;
		$.ajax({
			type: 'GET',
			url : 'update_reviewlike',
			dataType : 'json',
			data:{num: num, id: id,like: like},
			success: function(data){
				if(data != 1) {
					alert('오류가 발생해서 좋아요 수정에 실패했습니다..');
					return ;
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function checkreviewcnt(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		const id = '${sessionScope.data}';
		let rs = null;
		$.ajax({
			type: 'GET',
			url : 'checkreviewcnt',
			dataType : 'json',
			async: false,
			data:{num: num, id: id},
			success: function(data){
				if(data == 1 ) {
					rs = data;
					return 
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
		return rs;
	}
	function Increase_likeCNT_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		
		$.ajax({
			type: 'GET',
			url : 'Increase_likeCNT',
			dataType : 'json',
			data: {num: num},
			success: function (data) {
				if(data != 1) {
					alert('오류가 발생해서 실패했습니다..');
					return;
				}
				checklikecntvalue_by_star(number);
				var chklikecnt = checkreviewcnt_by_star(number);
				if(chklikecnt == 1){
					clickevent_by_star(number);
				}else{
					unclickevent_by_star(number);
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function Decrease_likeCNT_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		
		$.ajax({
			type: 'GET',
			url : 'Decrease_likeCNT',
			dataType : 'json',
			data: {num: num},
			success: function (data) {
				if(data != 1) {
					alert('오류가 발생해서 실패했습니다..');
					return;
				}
				checklikecntvalue_by_star(number);
				var chklikecnt = checkreviewcnt_by_star(number);
				if(chklikecnt == 1){
					clickevent_by_star(number);
				}else{
					unclickevent_by_star(number);
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function Modify_un2likeCNT_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		
		$.ajax({
			type: 'GET',
			url : 'Modify_un2likeCNT',
			dataType : 'json',
			data: {num: num},
			success: function (data) {
				if(data != 1) {
					alert('오류가 발생해서 좋아요가 실패했습니다..');
					return;
				}
				checklikecntvalue_by_star(number);
				clickevent_by_star(number);
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function Modify_li2unlikeCNT_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		
		$.ajax({
			type: 'GET',
			url : 'Modify_li2unlikeCNT',
			dataType : 'json',
			data: {num: num},
			success: function (data) {
				if(data != 1) {
					alert('오류가 발생해서 좋아요가 실패했습니다..');
					return;
				}
				checklikecntvalue_by_star(number);
				clickevent_by_star(number);
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function insert_reviewlike_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		const id = '${sessionScope.data}';
		const like = document.querySelector('#thumb_up_by_star'+number).value;
		$.ajax({
			type: 'GET',
			url : 'insert_reviewlike',
			dataType : 'json',
			data:{num: num, id: id,like: like},
			success: function(data){
				if(data != 1) {
					alert('오류가 발생해서 좋아요 추가에 실패했습니다..');
					return ;
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function insert_unlikereview_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		const id = '${sessionScope.data}';
		const like = document.querySelector('#thumb_down_by_star'+number).value;
		$.ajax({
			type: 'GET',
			url : 'insert_reviewlike',
			dataType : 'json',
			data:{num: num, id: id,like: like},
			success: function(data){
				if(data != 1) {
					alert('오류가 발생해서 좋아요 추가에 실패했습니다..');
					return ;
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	//review 번호와 id를 통해서 좋아요를 눌렀었는지 확인
	function check_reviewLike_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		const id = '${sessionScope.data}';
		let rs = null;
		$.ajax({
			type: 'GET',
			url : 'check_reviewLike',
			dataType : 'json',
			async: false,
			data:{num: num, id: id},
			success: function(data){
				if(data == 1 ) {
					alert('좋아요는 한번만 누를 수 있습니다.');
					rs = data;
					return 
				}else if(data == -1){
					rs = data;
					return 
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
		return rs;
	}
	function delete_reviewlike_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		const id = '${sessionScope.data}';
		$.ajax({
			type: 'GET',
			url : 'delete_reviewlike',
			dataType : 'json',
			data:{num: num, id: id},
			success: function(data){
				if(data != 1) {
					alert('오류가 발생해서 reviewlike테이블을 제거하지 못했습니다.');
					return ;
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	//싫어요를 눌렀는지 확인
	function check_review_unLike_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		const id = '${sessionScope.data}';
		let rs = null;
		$.ajax({
			type: 'GET',
			url : 'check_reviewLike',
			dataType : 'json',
			async: false,
			data:{num: num, id: id},
			success: function(data){
				if(data == -1 ) {
					alert('싫어요는 한번만 누를 수 있습니다.');
					rs = data;
					return 
				}else if(data == 1){
					rs = data;
					return 
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
		return rs;
	}
	function modify_like2unlike_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		const id = '${sessionScope.data}';
		const like = document.querySelector('#thumb_down_by_star'+number).value;
		$.ajax({
			type: 'GET',
			url : 'update_reviewlike',
			dataType : 'json',
			data:{num: num, id: id,like: like},
			success: function(data){
				if(data != 1) {
					alert('오류가 발생해서 좋아요 수정에 실패했습니다..');
					return ;
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function modify_unlike2like_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		const id = '${sessionScope.data}';
		const like = document.querySelector('#thumb_up_by_star'+number).value;
		$.ajax({
			type: 'GET',
			url : 'update_reviewlike',
			dataType : 'json',
			data:{num: num, id: id,like: like},
			success: function(data){
				if(data != 1) {
					alert('오류가 발생해서 좋아요 수정에 실패했습니다..');
					return ;
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	function checkreviewcnt_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		const id = '${sessionScope.data}';
		let rs = null;
		$.ajax({
			type: 'GET',
			url : 'checkreviewcnt',
			dataType : 'json',
			async: false,
			data:{num: num, id: id},
			success: function(data){
				if(data == 1 ) {
					rs = data;
					return 
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
		return rs;
	}
	
	function getcntlike(number) {
		const num = document.querySelector('#reviewnum'+number).innerText;
		var arr = null;
		$.ajax({
			type: 'GET',
			url : 'getcntlike',
			dataType : 'json',
			async: false,
			data: {num: num},
			success: function (data) {
				if(data != null) {
					arr = data;
					return;
				}else {
					alert('오류가 발생해서 좋아요 횟수를 가져오는데 실패했습니다..');
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
			return arr;
	}
	function getcntlike_by_star(number) {
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		var arr = null;
		$.ajax({
			type: 'GET',
			url : 'getcntlike',
			dataType : 'json',
			async: false,
			data: {num: num},
			success: function (data) {
				if(data != null) {
					arr = data;
					return;
				}else {
					alert('오류가 발생해서 좋아요 횟수를 가져오는데 실패했습니다..');
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
			return arr;
	}
	
	function getreviewlike(number){
		const num = document.querySelector('#reviewnum'+number).innerText;
		const id = '${sessionScope.data}';
		var arr = null;
		$.ajax({
			type: 'GET',
			url : 'getreviewlike',
			dataType : 'json',
			async: false,
			data: {num: num, id: id},
			success: function (data) {
				if(data != null) {
					arr = data;
					return;
				}else {
					alert('오류가 발생해서 좋아요 횟수를 가져오는데 실패했습니다..');
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
			return arr;
	}
	function getreviewlike_by_star(number){
		const num = document.querySelector('#reviewnum_by_star'+number).innerText;
		const id = '${sessionScope.data}';
		var arr = null;
		$.ajax({
			type: 'GET',
			url : 'getreviewlike',
			dataType : 'json',
			async: false,
			data: {num: num, id: id},
			success: function (data) {
				if(data != null) {
					arr = data;
					return;
				}else {
					alert('오류가 발생해서 좋아요 횟수를 가져오는데 실패했습니다..');
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
			return arr;
	}
	
	
</script>