<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/bootstrap.jsp"%>
<%@include file="include/jquery.jsp"%>
<%@include file="include/ajaxPopup.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("input[type='radio']").click(function(){
		sim = $("input[type='radio']:checked").val();
		document.form.star.value = sim;
			if (sim<=2) {
				$('.myratings').css('color','red');
				if(sim<=1) {
					$(".myratings").text('매우 불만족');
				} else if(sim<=2) {
					$(".myratings").text('불만족'); 
				}
			}else{
				$('.myratings').css('color','green');
				if(sim>4) {
					$(".myratings").text('매우 만족');
				} else if(sim>3) {
					$(".myratings").text('만족');
				} else {
					$(".myratings").text('보통');
				}
			}
		});
	});
	
	function goReview() {
		const form = document.form;
		const title = form.title;
		const cont = form.content;
		
		if(title.value == '') {
			alert('제목을 입력해주세요.');
			title.focus();
			return;
		}
		if(cont.value == '') {
			alert('내용을 입력해주세요.');
			cont.focus();
			return;
		}
		
		insertReview();
	}
</script>
<style type="text/css">
@import url(https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
@import url(http://fonts.googleapis.com/css?family=Calibri:400,300,700);
@font-face {
    font-family: 'GangwonEduHyeonokT_OTFMediumA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduHyeonokT_OTFMediumA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'SUIT-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Medium.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

fieldset,
label {
    margin: 0;
    padding: 0
}

body {
    margin: 20px
}

h1 {
    font-size: 1.5em;
    margin: 10px
}

.rating {
    border: none;
    margin-right: 49px
}

.myratings {
    font-size: 65px;
    color: green
}

.rating>[id^="star"] {
    display: none
}

.rating>label:before {
    margin: 5px;
    font-size: 2.25em;
    font-family: FontAwesome;
    display: inline-block;
    content: "\f005"
}

.rating>.half:before {
    content: "\f089";
    position: absolute
}

.rating>label {
    color: #ddd;
    float: right
}

.rating>[id^="star"]:checked~label,
.rating:not(:checked)>label:hover,
.rating:not(:checked)>label:hover~label {
    color: #FFD700
}

.rating>[id^="star"]:checked+label:hover,
.rating>[id^="star"]:checked~label:hover,
.rating>label:hover~[id^="star"]:checked~label,
.rating>[id^="star"]:checked~label:hover~label {
    color: #FFED85
}

.reset-option {
    display: none
}

.reset-button {
    margin: 6px 12px;
    background-color: rgb(255, 255, 255);
    text-transform: uppercase
}

.mt-100 {
    margin-top: 100px
}

.card {
    position: relative;
    display: flex;
    width: 350px;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid #d2d2dc;
}

.card .card-body {
    padding: 1rem 1rem
}

.card-body {
    flex: 1 1 auto;
    padding: 1.25rem
}

p {
    font-size: 14px
}

h4 {
    margin-top: 18px
}

</style>
</head>
<body>
<div class="card" style="margin: auto; width: 440px; height: 116px; font-family: GangwonEduHyeonokT_OTFMediumA;">
	<div style="margin: auto 0;">
		<div style="font-size: 25px; position: absolute; margin: 32px 0 0 100px;">상품명 : ${requestScope.prodata.name}</div>
		<%double s = Math.random();%>
		<img alt="" style="width: 80px; margin-left: 10px;" src="resources/images/pro_${requestScope.prodata.id}.png?a=<%=s%>">
	</div>
</div>
<div class="card" style="text-align: center; margin: 10px auto; width: 440px; font-family: GangwonEduHyeonokT_OTFMediumA;">
	<span style="font-size: 45px; margin-top: 10px;">상품을 평가해주세요</span>
    <div class="card-body text-center" style="padding-top: 0; padding-bottom: 0;"> <span class="myratings"></span>
        <fieldset class="rating" style="width: 313px;">
        	<input type="radio" id="star5" name="rating" value="5" />
        	<label class="full" for="star5" title="Awesome - 5 stars"></label>
        	
        	<input type="radio" id="star4half" name="rating" value="4.5" />
        	<label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
        	
        	<input type="radio" id="star4" name="rating" value="4" />
        	<label class="full" for="star4" title="Pretty good - 4 stars"></label>
        	
        	<input type="radio" id="star3half" name="rating" value="3.5" />
        	<label class="half" for="star3half" title="Meh - 3.5 stars"></label>
        	
        	<input type="radio" id="star3" name="rating" value="3" />
        	<label class="full" for="star3" title="Meh - 3 stars"></label>
        	
        	<input type="radio" id="star2half" name="rating" value="2.5" />
        	<label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
        	
        	<input type="radio" id="star2" name="rating" value="2" />
        	<label class="full" for="star2" title="Kinda bad - 2 stars"></label>
        	
        	<input type="radio" id="star1half" name="rating" value="1.5" />
        	<label class="half" for="star1half" title="Meh - 1.5 stars"></label>
        	
        	<input type="radio" id="star1" name="rating" value="1" />
        	<label class="full" for="star1" title="Sucks big time - 1 star"></label>
        	
        	<input type="radio" id="starhalf" name="rating" value="0.5" />
        	<label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label> <input type="radio" class="reset-option" name="rating" value="reset" /> </fieldset>
    </div>
</div>
<div class="card" style="text-align: center; margin: 10px auto; padding: 5px; width: 440px; height: 245px; font-family: SUIT-Medium;">
	<form method="post" name="form">
		<span style="font-size: 20px;">리뷰를 작성해주세요</span>
		<div class="input-group mb-3">
			<span class="input-group-text" id="titleText">제목</span>
			<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요" aria-label="Username" aria-describedby="titleText">
		</div>
		<div class="input-group">
			<span class="input-group-text">내용</span>
			<textarea class="form-control" name="content" aria-label="With textarea" placeholder="내용을 입력하세요" style="min-height: 150px; max-height: 150px;"></textarea>
		</div>
		<input type="hidden" name="cdn" value="${requestScope.prodata.odm}">
		<input type="hidden" name="prod_name" value="${requestScope.prodata.name}">
		<input type="hidden" name="prod_id" value="${requestScope.prodata.id}">
		<input type="hidden" name="user_id" value="${sessionScope.data}">
		<input type="hidden" name="star" value="">
	</form>
</div>
<div style="text-align: center;">
<button type="button" onclick="goReview();" class="btn btn-outline-primary">리뷰쓰기</button>
</div>
</body>
</html>