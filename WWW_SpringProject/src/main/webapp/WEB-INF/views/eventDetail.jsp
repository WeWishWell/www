<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<%@ include file="include/ajaxEvent.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eventDetail.jsp</title>
<script type="text/javascript">
	function replyBtn() {
		// console.log('성공');
		if(document.insertReply.content.value == ''){
			alert("내용을 입력하세요.")
			return;
		} else{
			insertReply();
		}
	}
	
	function modifyReply(num) {
		document.querySelector('#contentModify'+num).value = document.querySelector('#contentView'+num).innerText;
		document.querySelector('#contentModify'+num).hidden = false;
		document.querySelector('#contentView'+num).hidden = true;
		document.querySelector('#modify'+num).hidden = true;
		document.querySelector('#delete'+num).hidden = true;
		document.querySelector('#modifyDo'+num).hidden = false;
		document.querySelector('#cancel'+num).hidden = false;
	}
	
	function deleteReply(num) {
		if(confirm("정말 삭제하시겠습니까?")) {
			deleteReplyDo(num);
		}
	}
	
	function modifyDo(num) {
		updateReply(num);
	}
	
	function cancelReply(num) {
		document.querySelector('#contentModify'+num).hidden = true;
		document.querySelector('#contentView'+num).hidden = false;
		document.querySelector('#modify'+num).hidden = false;
		document.querySelector('#delete'+num).hidden = false;
		document.querySelector('#modifyDo'+num).hidden = true;
		document.querySelector('#cancel'+num).hidden = true;
	}
	
</script>
</head>
<body>
	<!-- event nav -->
	<br>
	<!-- event content -->
	<div class="cont" style="width: 72rem; margin: auto;">
		<br>
		<nav class="navbar" style="margin-left: 30px;">
		  <div class="container">
		    <span class="navbar-brand" style="font-size: 2rem;"><b id="eventType"></b></span>
		    <%@include file="include/eventHeader.jsp"%>
		  </div>
		</nav>
		<hr>
		<script type="text/javascript">
			if('${requestScope.data.category}' == '[진행이벤트]') {
				document.querySelector('#eventType').innerText = '진행중인 이벤트';
			} else {
				document.querySelector('#eventType').innerText = '종료된 이벤트';
			}
		</script>
		<!-- event title -->
		<h5 style="margin-left: 30px;"><b>${data.title}</b></h5><br>
		
		<div style="margin:10px auto;">
			<%double s = Math.random();%>
			<img src="resources/images/eventDetail_${data.seq}.png?a=<%=s%>" style="width: 72rem;">
		</div>
	</div>
	<hr>
	
	<!-- event reply -->
	<br>
	<h6 style="width: 72rem; margin: auto;">댓글</h6><br>
	
	<!-- event reply list -->
  	<div id="replyFind" style="width: 72rem; margin: auto;"></div>
  	
	<!-- event reply form -->
	<form name="insertReply" method="post">
		<div class="input-group" style="width: 72rem; margin: auto;">
			<input type="hidden" name="user_id" value="${sessionScope.data}">
			<input type="hidden" name="event_seq" value="${requestScope.data.seq}">
			<input type="hidden" name="reply_num" value="0">
			<textarea id="replylogin" name="content" style="min-height: 38px; max-height: 38px;" class="form-control" aria-label="With textarea" placeholder="내용을 입력하세요." ></textarea>
			<button type="button" class="btn btn-secondary" onclick="replyBtn();">확인</button>
		</div>
	</form>
	
	<script type="text/javascript">
		document.querySelector('#replylogin').addEventListener("focus", function() {
			if(!isNaN('${sessionScope.data}')) {
				alert('로그인한 회원만 댓글을 달 수 있습니다.');
				document.querySelector('#replylogin').blur();
				location.href = 'logIn';
			}
		});
		
		insertReply();
	</script>
		
	<br>
	<hr>
			
	<!-- event list btn -->
	<div align="center" style="margin-bottom: 50px;">
		<button type="button" class="btn btn-outline-secondary" onclick="javascript:history.back()">목록</button>
	</div>
	
</body>
</html>