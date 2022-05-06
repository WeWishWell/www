<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/main_header.jsp"%>
<%@include file="include/ajaxProdListForIndex.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>W.W.W</title>
<style type="text/css">
	
	#bgImg {transition: 1s;}
	#prodImgDiv {transition: 1s;}
	
	@keyframes blink-effect { 50% { opacity: 0; } }
	#cursor {animation: blink-effect 1s step-end infinite;}
	
</style>

</head>
<body>
<div class="bgColor" style="width: 100%; color: black;">
	<img alt="organic" id="bgImg" style="width: 100%; min-width: 1200px; opacity: 0.3; margin: auto; position: absolute; z-index: 0; display: block;" src="resources/images/index_bg2.jpg?a=134">
	<div style="margin-left: 38vw; font-size: 3vw; z-index: 1; position: relative;">
		<span style="padding-top: 12vw; display: block; color: black;"># 자연주의</span>
		<span># </span>
		<span id="prod"></span>
		<span id="cursor">_</span>
		<div id="prodImgDiv" style="width: 20vw; min-width: 300px; margin-top: 50px; opacity: 0;"></div>
	</div>
</div>
<script type="text/javascript">
document.querySelector('#bgImg').style.opacity = 1;
prodListForIndex();
</script>
</body>
</html>