<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="jquery.jsp"%>

<script type="text/javascript">
	function randomNum(min, max) {
		var randNum = Math.floor(Math.random()*(max-min+1)) + min; return randNum;
	}
	
	function prodListForIndex() {
		
		$.ajax({
			type:'POST',
			url:'prodListForIndex',
			dataType:'json',
			success: function (data) {
				var prod = document.querySelector('#prod');
				let index = 0;
				let check = 0;
				let prevNum = -1;
				let prodNum = randomNum(0, data.length-1);
				let ImgCheck = 0;
				
				function typing(){
					if(check == 0) {
						$('#prod').append(data[prodNum].name[index++]);
						if(ImgCheck == 0) {
							$('#prodImgDiv').html('<a href="productDetail?id='+data[prodNum].id+'"><img src="resources/images/pro_'+data[prodNum].id+'.png?a='+Math.random()+'" alt="Image" id="prodImg" style="max-width: 100%; border-radius: 5px;"/></a>');
							$('#prodImgDiv').css('opacity', 1);
							ImgCheck = 1;
						}
					} else {
						prod.innerText = prod.innerText.slice(0, -1);
						if(index != 0) {
							index--;
						} else {
							check = 0;
							prevNum = prodNum;
							while(prevNum == prodNum) {
								prodNum = randomNum(0, data.length-1);
							}
						}
					}
					
					if(index > data[prodNum].name.length){
						clearInterval(interval);
						setTimeout(function() {
							interval = setInterval(typing, 200);
							check = 1;
							if(ImgCheck == 1) {
								$('#prodImgDiv').css('opacity', 0);
								ImgCheck = 0;
							}
						}, 3000);
					}
				}
				
				var interval = setInterval(typing, 200);
				
				
			},
			
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}

</script>