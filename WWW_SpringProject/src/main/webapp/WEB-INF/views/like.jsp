<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>like.jsp</title>
</head>
<body>

<div class="pb-5">
    <div class="container">
      <div class="row">
      <h2>&emsp;&emsp;찜목록</h2>
	  <hr>
        <div class="row-lg-12 p-5 bg-white rounded shadow-sm mb-5">

          <!-- Shopping cart table -->
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                    <div class="p-2 px-3 text-uppercase">제품명</div>
                  </th>
                  <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                    <div class="py-2 text-uppercase">상품금액</div>
                  </th>
                  <th scope="col" class="border-0 bg-light" style=" text-align: center;">
                    <div class="py-2 text-uppercase">Remove</div>
                  </th>
                </tr>
              </thead>
              <tbody>
              <!-- 장바구니 상품정보 -->
              <c:forEach var="b" items="${data}">
                <tr>
                  <th scope="row" class="border-0">
                    <div class="p-2">
                    	<%double s = Math.random();%>
                      <img src="resources/images/pro_${b.id}.png?a=<%=s%>" alt="" width="70" class="img-fluid rounded shadow-sm">
                      <div class="ml-3 d-inline-block align-middle" style="padding-left: 20">
                        <h5 class="mb-0"> <a href="productDetail?id=${b.id}" class="text-dark d-inline-block align-middle">${b.name}</a></h5><span class="text-muted font-weight-normal font-italic d-block">Category: ${b.category}</span>
                      </div>
                    </div>
                  </th>
                  <td class="border-0 align-middle" style=" text-align: center;"><strong>${b.price}</strong></td>
                  <td class="border-0 align-middle" align="center">
                  	<a href="deleteLike?prod_id=${b.id}&user_id=${sessionScope.data}" > 
						<img src="resources/images/bin.png" alt="Image" style="width: 23" />
					</a>
                  </td>
                </tr>
               </c:forEach>
              </tbody>
            </table>
          </div>
          <!-- End -->
        </div>
      </div>


    </div>
  </div>

</body>
</html>