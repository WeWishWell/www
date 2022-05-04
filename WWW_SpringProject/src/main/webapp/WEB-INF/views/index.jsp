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
<div class="bgColor" style="width: 100%; height: 2000px; font-size: 32pt; color: black;">
	<img alt="organic" id="bgImg" style="width: 100%; min-width: 1200px; opacity: 0.3; margin: auto; position: absolute; z-index: 0; display: block;" src="resources/images/index_bg.jpg">
	<div style="margin-left: 40%; z-index: 1; position: relative;">
		<span style="padding-top: 160px; display: block; color: black;"># 자연주의</span>
		<span># </span>
		<span id="prod"></span>
		<span id="cursor">_</span>
		<div id="prodImgDiv" style="width: 300px; margin: 50px 0 0 10%; opacity: 0;"></div>
	</div>
</div>
<script type="text/javascript">
document.querySelector('#bgImg').style.opacity = 1;
prodListForIndex();
</script>
<%@include file="include/footer.jsp"%>
</body>
</html>