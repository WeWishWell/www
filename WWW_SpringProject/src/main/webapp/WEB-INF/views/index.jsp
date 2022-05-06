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
	
	@font-face {
    font-family: 'Donoun-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2205@1.0/Donoun-Medium.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}
	
</style>

</head>
<body>
<div class="bgColor" style="width: 100%; color: black;">
	<img alt="organic" id="bgImg" style="width: 100%; min-width: 1200px; opacity: 0.3; margin: auto; position: absolute; z-index: 0; display: block;" src="resources/images/index_bg2.jpg?a=134">
	<div style="margin-left: 38vw; font-size: 3.5vw; z-index: 1; position: relative; font-family: Donoun-Medium;">
		<span style="padding-top: 12vw; display: block; color: black;"># 자연주의</span>
		<span># </span>
		<span id="prod"></span>
		<span id="cursor">_</span>
		<div id="prodImgDiv" style="width: 20vw; min-width: 300px; margin-top: 10px; opacity: 0;"></div>
	</div>
</div>
<script type="text/javascript">
document.querySelector('#bgImg').style.opacity = 1;
prodListForIndex();
</script>
</body>
</html>