<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰관리(ADMIN)</title>
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css"/>
<style type="text/css">
	 .btn-outline-danger {
  color: #dc3545;
  border-color: #dc3545;
}

.btn-outline-danger:hover {
  color: #fff;
  background-color: #dc3545;
  border-color: #dc3545;
}

.btn-check:focus + .btn-outline-danger, .btn-outline-danger:focus {
  box-shadow: 0 0 0 0.25rem rgba(220, 53, 69, 0.5);
}

.btn-check:checked + .btn-outline-danger,
.btn-check:active + .btn-outline-danger, .btn-outline-danger:active, .btn-outline-danger.active, .btn-outline-danger.dropdown-toggle.show {
  color: #fff;
  background-color: #dc3545;
  border-color: #dc3545;
}

.btn-check:checked + .btn-outline-danger:focus,
.btn-check:active + .btn-outline-danger:focus, .btn-outline-danger:active:focus, .btn-outline-danger.active:focus, .btn-outline-danger.dropdown-toggle.show:focus {
  box-shadow: 0 0 0 0.25rem rgba(220, 53, 69, 0.5);
}

.btn-outline-danger:disabled, .btn-outline-danger.disabled {
  color: #dc3545;
  background-color: transparent;
}
</style>

<script type="text/javascript">

function reviewDel(num) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href='reviewDel?num='+num;
	}
}

</script>

</head>
<body>
<div style="display: flex;">

<!-- sidebar -->
<%@include file="../include/adminSidebar.jsp"%>

<!-- 본문 -->
   <div class="pb-5">
      <div class="container">
         <div class="row" style="margin-top: 22">
            <h2>&emsp;&emsp;리뷰관리</h2>
            <hr>
            
            <!-- 검색창 -->
            <form action="adminReview" method="post">
            <div class="container">
            <div class="row">
            
		    	<!-- 키워드 검색 -->
			  	<div class="col input-group mb-3">
				  <select class="custom-select" name="searchType" id="inputGroupSelect01">
				    <option value="prod_name">상품명</option>
				    <option value="title">제목</option>
				    <option value="star">별점</option>
				  </select>
				  <div class="input-group-prepend">
				    <input type="search" name="searchKeyword" style="height: 38px"/>
				  </div>
				</div>
			  	
		    <!-- 날짜검색 -->
			    <div class="col-5 input-group mb-3" style="width: 600px">
				  	<span class="input-group-text" id="basic-addon1">작성일자</span>
				  	<input type="date" name="startDate" id="startDate" class="form-control" onclick="mindate()"/>
			  			~
		   			<input type="date" name="endDate" id="endDate" class="form-control" />
				    <script>
						document.getElementById('startDate').max = new Date().toISOString().substring(0, 10);
						document.getElementById('endDate').max = new Date().toISOString().substring(0, 10);
						
						function mindate(){
							document.getElementById('endDate').min = document.getElementById('startDate').value;
						}
					</script>
				   
				    
				  	<!-- 검색버튼 -->
				  	<button type="submit" class="btn btn-primary" >
				    	조회 <span class="pe-7s-search"></span>
				  	</button>
				</div>
			
			</div>
			</div>
			</form>
			
			<!-- 주문 리스트 -->
            <div class="row-lg-12 p-5 bg-white rounded shadow-sm mb-5">
               <div class="table-responsive">
                  <table class="table">
                     <thead class="thead-light">
                        <tr>
                           <th scope="col" style=" text-align: center;">번호</th>
                           <th scope="col" style=" text-align: center;">회원 ID</th>
                           <th scope="col" style=" text-align: center;">상품명</th>
                           <th scope="col" style=" text-align: center;">제목</th>
                           <th scope="col" style=" text-align: center;">별점</th>
                           <th scope="col" style=" text-align: center;">작성일자</th>
                           <th scope="col" style=" text-align: center;">리뷰삭제</th>
                        </tr>
                     </thead>
                     <tbody>
                      <c:forEach var="b" items="${data}">
                        <tr>
                           <td scope="row" style=" text-align: center;">${b.num}</td>
                           <td scope="row" style=" text-align: center;">${b.user_id}</td>
                           <td scope="row" style=" text-align: center;">${b.prod_name}</td>
                           <td scope="row" style=" text-align: center;">${b.title}</td>
                           <td scope="row" style=" text-align: center;">${b.star}</td>
                           <td scope="row" style=" text-align: center;">${b.reDate}</td>
                           <td style=" text-align: center;">
                              <button type="button" class="btn btn-outline-danger" id="Btn${b.num}" onclick="reviewDel('${b.num}');">
                                 <span class="#"> 삭제 </span>
                              </button>
                        </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
</body>
</html>