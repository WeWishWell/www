<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/ajaxFile.jsp"%>

<script type="text/javascript">

	//AJAX 상품 수정
	function prodModifyDo(id) {
		
		$.ajax({
			type:'GET',
			url:'adminProdModify',
			dataType:'json',
			data: {id: id},
			success: function (data) {
				$('#adminProdDiv').css('width', '700px');
				$('#adminProdDiv').css('margin-left', '50px');
				$('#adminProdDiv').html(
						'<h2>&emsp;&emsp;상품관리</h2><hr>'+
						'<form action="adminProd" method="post" name="form">'+
						'<input type="hidden" name="id" value="'+data.id+'">'+
						'<div class="row" style="margin: auto;">'+
						'<div class="col"><b>상품명</b>'+
						'<input type="text" id="adminPM_name" name="name" class="form-control" placeholder="상품명을 입력하세요" value="'+data.name+'" style="margin-bottom: 5px;"></div>'+
						'<div class="col-sm-3"><b>가격</b>'+
						'<input type="text" id="adminPM_price" name="price" class="form-control" placeholder="상품가격" value="'+data.price+'" style="margin-bottom: 5px;"></div>'+
						'<div class="col-sm-3"><b>분류</b>'+
						'<input type="text" id="adminPM_category" name="category" class="form-control" placeholder="카테고리" value="'+data.category+'" style="margin-bottom: 5px;"></div>'+
						'</div>'+
						
						'<div class="row" style="margin: auto;">'+
						'<div class="col"><b>상품 이미지</b>'+
						'<img src="resources/images/pro_'+data.id+'.png?a='+Math.random()+'" alt="Image" id="img" style="width: 200px; display: block;">'+
						'이미지 변경<br><input type="file" id="file" style="width: 220px;"></div>'+
						'<div class="col"><b>상품 설명</b>'+
						'<textarea class="form-control" id="adminPM_disc" name="disc" placeholder="상품 설명을 입력하세요" style="min-height: 240px; width: 400px;">'+data.disc+'</textarea></div>'+
						'</div>'+
						'</form>'+
						'<div style="margin: 5px 0 0 12px;"><button type="button" class="btn btn-primary" id="prodBtn" onclick="imgModify('+data.id+')">수정</button>'+
						'<a href="adminProd" type="button" class="btn btn-secondary" style="margin-left: 5px;">취소</a></div>'
				);
				$("#file").on("change", handleImgFileSelect);
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	
	function imgModify(id){
        
        var form = new FormData();
        if($("#file")[0].files[0] == undefined) {
        	alert('정보를 수정했습니다.');
        	document.form.submit();
        	return;
        }
        form.append("file", $("#file")[0].files[0]);
        form.append("id", id);
        
         jQuery.ajax({
             url : "fileModify"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
        	   alert('정보를 수정했습니다.');
               document.form.submit();
           }
           ,error: function (jqXHR) 
           { 
               //alert(jqXHR.responseText);
               alert("사진 업로드 오류로 인해 상품 수정에 실패했습니다.");
           }
       });
	}
	
	//AJAX 상품 등록
	function prodCreateDo() {
		
		$.ajax({
			type:'GET',
			url:'adminProdCreate',
			dataType:'json',
			success: function (data) {
				$('#adminProdDiv').css('width', '700px');
				$('#adminProdDiv').css('margin-left', '50px');
				$('#adminProdDiv').html(
						'<h2>&emsp;&emsp;상품등록</h2><hr>'+
						'<form action="adminProd" method="post" name="form">'+
						'<input type="hidden" name="id" value="'+data+'">'+
						'<div class="row" style="margin: auto;">'+
						'<div class="col"><b>상품명</b>'+
						'<input type="text" id="adminPM_name" name="name" class="form-control" placeholder="상품명을 입력하세요" value="" style="margin-bottom: 5px;"></div>'+
						'<div class="col-sm-3"><b>가격</b>'+
						'<input type="text" id="adminPM_price" name="price" class="form-control" placeholder="상품가격" value="" style="margin-bottom: 5px;"></div>'+
						'<div class="col-sm-3"><b>분류</b>'+
						'<input type="text" id="adminPM_category" name="category" class="form-control" placeholder="카테고리" value="" style="margin-bottom: 5px;"></div>'+
						'</div>'+
						
						'<div class="row" style="margin: auto;">'+
						'<div class="col"><b>상품 이미지</b>'+
						'<img src="resources/images/camera.png" alt="Image" id="img" style="width: 200px; display: block;">'+
						'이미지 등록<br><input type="file" id="file" style="width: 220px;"></div>'+
						'<div class="col"><b>상품 설명</b>'+
						'<textarea class="form-control" id="adminPM_disc" name="disc" placeholder="상품 설명을 입력하세요" style="min-height: 240px; width: 400px;"></textarea></div>'+
						'</div>'+
						'</form>'+
						'<div style="margin: 5px 0 0 12px;"><button type="button" class="btn btn-primary" id="prodBtn" onclick="makeProdImg('+data+')">등록</button>'+
						'<a href="adminProd" type="button" class="btn btn-secondary" style="margin-left: 5px;">취소</a></div>'
				);
				$("#file").on("change", handleImgFileSelect);
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	
	function makeProdImg(id){
        
        var form = new FormData();
        if($("#file")[0].files[0] == undefined) {
        	alert('상품의 사진을 등록해주세요.');
        	return;
        }
        form.append("file", $("#file")[0].files[0]);
        
         jQuery.ajax({
             url : "fileUpload"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
        	   alert('상품을 업로드했습니다.');
               document.form.submit();
           }
           ,error: function (jqXHR) 
           { 
               //alert(jqXHR.responseText);
               alert("사진 업로드 오류로 인해 상품 수정에 실패했습니다.");
           }
       });
	}
	
	//상품 삭제
	function adminProdDel(id) {
		$.ajax({
			type:'GET',
			url:'adminProdDel',
			dataType:'json',
			data : {id: id},
			success: function (data) {
				if(data == 1) {
					alert('상품 삭제에 성공했습니다.');
					location.reload();
				} else {
					alert('오류 : 상품 삭제 실패');
				}
			},
			error: function (request, status, error) {
				console.log(request, status, error);
			}
		});
	}
	
</script>