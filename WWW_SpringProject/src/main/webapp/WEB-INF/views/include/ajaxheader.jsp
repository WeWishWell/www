<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	function ajaxLikeList() {
		const user_id = '${sessionScope.data}';
		
		$.ajax({
			type:'GET',
			url:'ajaxLikeList',
			dataType:'json',
			data: {id:user_id},
			success: function (data) {
				let html = '<li style="padding-left: 16px;"><b>찜목록</b></li><li><hr class="dropdown-divider"></li>';
				if(data == null) {
					alert('오류가 발생해서 찜 목록 불러오기에 실패했습니다.');
					return;
				} else if(data.length == 0) {
					html += '<li style="text-align: center;">찜한 상품이 없습니다.</li>';
				} else {
					for(prod of data) {
						html += '<li style="padding-left: 16px;"><span style="display: block; position: absolute; margin-left: 110px;">'+prod.name+'</span>';
						html += '<a href="deleteLike?prod_id='+prod.id+'&user_id=${sessionScope.data}" style="position: absolute; margin: 93px 0 0 110px;"><img src="resources/images/bin.png" alt="Image" style="width: 23"/></a>';
						html += '<a href="productDetail?id='+prod.id+'"><img src="resources/images/pro_'+prod.id+'.png?a='+Math.random()+'" alt="" width="100px" style="margin-bottom: 5px;" class="img-fluid rounded shadow-sm"></a></li>';
					}
				}
				document.querySelector('#heart').innerHTML = html;
			},
			
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	
	function ajaxBasketList() {
		const user_id = '${sessionScope.data}';
		
		$.ajax({
			type:'GET',
			url:'ajaxBasketList',
			dataType:'json',
			data: {id:user_id},
			success: function (data) {
				let html = '<li style="padding-left: 16px;"><b>장바구니</b></li><li><hr class="dropdown-divider"></li>';
				if(data == null) {
					alert('오류가 발생해서 장바구니 불러오기에 실패했습니다.');
					return;
				} else if(data.length == 0) {
					html += '<li style="text-align: center;">장바구니에 담긴 상품이 없습니다.</li>';
				} else {
					
					for(prod of data) {
						html += '<li style="padding-left: 16px;"><span style="display: block; position: absolute; margin: 0 0 0 110px;">'+prod.name+'</span>';
						html += '<span style="display: block; position: absolute; margin: 40 0 0 110px;">수량: '+prod.cnt+'개</span>';
						html += '<span style="display: block; position: absolute; margin: 60 0 0 110px;">'+prod.price+'원</span>';
						html += '<a href="basketDelete?prod_id='+prod.prod_id+'&user_id=${sessionScope.data}" style="position: absolute; margin: 93px 0 0 110px;"><img src="resources/images/bin.png" alt="Image" style="width: 23"/></a>';
						html += '<a href="productDetail?id='+prod.prod_id+'"><img src="resources/images/pro_'+prod.prod_id+'.png?a='+Math.random()+'" alt="" width="100px" style="margin-bottom: 5px;" class="img-fluid rounded shadow-sm"></a></li>';
					}
				}
				document.querySelector('#basket').innerHTML = html;
			},
			
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	
	function ajaxRecentList(number){
		
		var html = '';
		$.ajax({
			type:'GET',
			url:'ajaxRecentList',
			dataType:'json',
			async: false,
			data:{id:number},
			success: function (data) {
				if(data == null){
					alert('오류가 발생해서 최근 본 목록 불러오기에 실패했습니다.');
					return
				}else if(data.length == 0){
				}else {
					html = '<li style="padding-left: 16px;"><span style="display: block; position: absolute; margin-left: 110px;">'+data.name+'</span>';
					html += '<span style="display: block; position: absolute; margin:20 0 0 110px;">'+data.price+'원</span>';
					html += '<a href="" onclick="deleteRecentView('+number+')" style="position: absolute; margin: 93px 0 0 110px;"><img src="resources/images/bin.png" alt="Image" style="width: 23"/></a>';
					html += '<a href="productDetail?id='+data.id+'"><img src="resources/images/pro_'+data.id+'.png?a='+Math.random()+'" alt="" width="100px" style="margin-bottom: 5px;" class="img-fluid rounded shadow-sm"></a></li>';
				}
			},
			error: function (request, status, error) {
				  console.log(request, status,error);
				  return;
			}
		});
		return html;
	}

</script>