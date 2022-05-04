<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="jquery.jsp"%>

<script type="text/javascript">

	function insertReply() {
		const user_id = '${sessionScope.data}';
		const event_seq = '${requestScope.data.seq}';
		const content = document.querySelector('#replylogin').value;
		
		$.ajax({
			type:'POST',
			url:'insertReply',
			dataType:'json',
			data: {user_id: user_id, event_seq: event_seq, content: content, reply_num: 0},
			success: function (data) {
				var html = '';
				for(let rply of data) {
					html += '<div class="card">';
					html += '<div class="card-body reply">';
					html += '<p class="card-text">작성자 : '+rply.user_id+'</p>';
					html += '<h6 class="card-subtitle mb-2 text-muted">'+rply.reply_date+'</h6>';
					html += '<h5 id="contentView'+rply.reply_num+'" class="card-title">'+rply.content+'</h5>';
					html += '<textarea id="contentModify'+rply.reply_num+'" name="content" style="min-height: 38px; max-height: 38px;" class="form-control" aria-label="With textarea" placeholder="내용을 입력하세요." hidden="true"></textarea>';
					if('${sessionScope.data}' == rply.user_id) {
						html += '<a href="javascript:void(0);" onclick="modifyDo('+rply.reply_num+')" id="modifyDo'+rply.reply_num+'" class="card-link" hidden="true">수정완료</a>';
						html += '<a href="javascript:void(0);" onclick="cancelReply('+rply.reply_num+')" id="cancel'+rply.reply_num+'" class="card-link" hidden="true">취소</a>';
						html += '<a href="javascript:void(0);" onclick="modifyReply('+rply.reply_num+')" id="modify'+rply.reply_num+'" class="card-link" style="margin-left: 0;">수정</a>';
						html += '<a href="javascript:void(0);" onclick="deleteReply('+rply.reply_num+')" id="delete'+rply.reply_num+'" class="card-link">삭제</a>';
					}
					html += '</div></div><br>';
				}
				document.querySelector('#replylogin').value='';
				document.querySelector('#replyFind').innerHTML = html;
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	
	function updateReply(num) {
			const content = document.querySelector('#contentModify'+num).value;
			const event_seq = '${requestScope.data.seq}';
			const reply_num = num;
		
		$.ajax({
			type:'POST',
			url:'updateReply',
			dataType:'json',
			data: {content: content, reply_num: reply_num, event_seq: event_seq},
			success: function (data) {
				
				document.querySelector('#contentView'+num).innerText = document.querySelector('#contentModify'+num).value;
				document.querySelector('#contentModify'+num).hidden = true;
				document.querySelector('#contentView'+num).hidden = false;
				document.querySelector('#modify'+num).hidden = false;
				document.querySelector('#delete'+num).hidden = false;
				document.querySelector('#modifyDo'+num).hidden = true;
				document.querySelector('#cancel'+num).hidden = true;
				
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	
	function deleteReplyDo(num) {
		const event_seq = '${requestScope.data.seq}';
		const reply_num = num;
	
		$.ajax({
			type:'GET',
			url:'deleteReply',
			dataType:'json',
			data: {reply_num: reply_num, event_seq: event_seq},
			success: function (data) {
				
				insertReply();
				
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}

</script>