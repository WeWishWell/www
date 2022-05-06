<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/ajaxFile.jsp"%>

<script type="text/javascript">

	//이벤트 썸네일 사진 수정
	function eventImgModify1(seq){
        
        var form = new FormData();
        if($("#file1")[0].files[0] == undefined) {
        	eventImgModify2(seq);
        	return;
        }
        form.append("file", $("#file1")[0].files[0]);
        form.append("seq", seq);
        
         jQuery.ajax({
             url : "eventImgModify1"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
        	   eventImgModify2(seq);
           }
           ,error: function (jqXHR) 
           { 
               //alert(jqXHR.responseText);
               alert("사진 업로드 오류로 인해 이벤트 수정에 실패했습니다.");
           }
       });
	}
	//이벤트 디테일 사진 수정
	function eventImgModify2(seq){
        
        var form = new FormData();
        if($("#file2")[0].files[0] == undefined) {
        	alert('정보를 수정했습니다.');
        	document.form.submit();
        	return;
        }
        form.append("file", $("#file2")[0].files[0]);
        form.append("seq", seq);
        
         jQuery.ajax({
             url : "eventImgModify2"
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
               alert("사진 업로드 오류로 인해 이벤트 수정에 실패했습니다.");
           }
       });
	}

	//이벤트 썸네일 사진 생성
	function eventImgCreate1(){
        
        var form = new FormData();
        if($("#file1")[0].files[0] == undefined) {
        	eventImgCreate2();
        	return;
        }
        form.append("file", $("#file1")[0].files[0]);
        
         jQuery.ajax({
             url : "eventImgCreate1"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
        	   eventImgCreate2();
           }
           ,error: function (jqXHR) 
           { 
               //alert(jqXHR.responseText);
               alert("사진 업로드 오류로 인해 이벤트 등록에 실패했습니다.");
           }
       });
	}
	//이벤트 디테일 사진 생성
	function eventImgCreate2(){
        
        var form = new FormData();
        if($("#file2")[0].files[0] == undefined) {
        	alert('이벤트 등록 완료');
        	document.form.submit();
        	return;
        }
        form.append("file", $("#file2")[0].files[0]);
        
         jQuery.ajax({
             url : "eventImgCreate2"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
        	   alert('이벤트 등록 완료');
               document.form.submit();
           }
           ,error: function (jqXHR) 
           { 
               //alert(jqXHR.responseText);
               alert("사진 업로드 오류로 인해 이벤트 등록에 실패했습니다.");
           }
       });
	}
	
</script>