<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="jquery.jsp"%>

<script type="text/javascript">
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
        $("#file").on("change", handleImgFileSelect);
    });
 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                $('#file').val('');
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
                $("#img").width('200px');
            }
            reader.readAsDataURL(f);
        });
    }
    
	function fn_submit(){
	        
	        var form = new FormData();
	        form.append( "file", $("#file")[0].files[0] );
	        
	         jQuery.ajax({
	             url : "fileUpload"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) {
	        	   console.log(response);
	               //alert("사진 변경에 성공하였습니다.");
	           }
	           ,error: function (jqXHR) 
	           { 
	               //alert(jqXHR.responseText);
	               alert("오류로 인해 사진 변경에 실패했습니다.");
	           }
	       });
	}
	
</script>