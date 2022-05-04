<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리(ADMIN)</title>
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

function memberDel(num) {
	if(confirm("정말 삭제하시겠습니까?")) {
		console.log(num);
		location.href='adminMemDel?id='+num;
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
            <h2>&emsp;&emsp;회원관리</h2>
            <hr>
            
            <!-- 검색창 -->
            <form action="adminList" method="post">
            <div class="container">
            <div class="row">
            
		    	<!-- 키워드 검색 -->
			  	<div class="col input-group mb-3">
				  <select class="custom-select" name="searchType" id="inputGroupSelect01">
				    <option value="id">회원 ID</option>
			        <option value="name">회원 이름</option>
				  </select>
				  <div class="input-group-prepend">
				    <input type="search" name="searchKeyword" style="height: 38px"/>
				  </div>
				</div>
			  	
		    <!-- 날짜검색 -->
			    <div class="col-5 input-group mb-3" style="width: 600px">
				  	<span class="input-group-text" id="basic-addon1">가입일자</span>
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
                           <th scope="col" style=" text-align: center;">회원 ID</th>
                           <th scope="col" style=" text-align: center;">회원이름</th>
                           <th scope="col" style=" text-align: center;">회원정보</th>
                           <th scope="col" style=" text-align: center;">가입일자</th>
                           <th scope="col" style=" text-align: center;">주소</th>
                           <th scope="col" style=" text-align: center;">생년월일</th>
                           <th scope="col" style=" text-align: center;">회원탈퇴</th>
                        </tr>
                     </thead>
                     <tbody>
                      <c:forEach var="b" items="${data}">
                        <tr>
                           <td scope="row" style=" text-align: center;">${b.id}</td>
                           <td scope="row" style=" text-align: center;">${b.name}</td>
                           <td scope="row" style=" text-align: center;">${b.role}</td>
                           <td scope="row" style=" text-align: center;">${b.regdate}</td>
                           <td scope="row" style=" text-align: center;">${b.address}</td>
                           <td scope="row" style=" text-align: center;">${b.birthday}</td>
                          <%-- <td><input type="button" value="삭제" class="btn btn-default" onclick="adminMemDel(${vo.id})"></td> --%>
                           <td style=" text-align: center;">
                              <button type="button" class="btn btn-outline-danger" id="Btn${b.id}" onclick="memberDel('${b.id}');">
                                 <span class="#"> 탈퇴 </span>
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