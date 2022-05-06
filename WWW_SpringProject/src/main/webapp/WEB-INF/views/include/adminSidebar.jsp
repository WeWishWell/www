<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 260px;">
    <a class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none" style="pointer-events: none; cursor: default;">
      <svg class="bi me-2" width="40" height="32"></svg>
      <span class="fs-4">관리자 메뉴</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item">
        <a href="adminProd" class="nav-link link-dark" id="prodAdmin">
          <svg class="bi me-2" width="16" height="16"></svg>
          상품관리
        </a>
      </li>
      <li>
        <a href="adminOrder" class="nav-link link-dark" id="orderAdmin">
          <svg class="bi me-2" width="16" height="16"></svg>
          배송현황
        </a>
      </li>
      <li>
        <a href="adminReview" class="nav-link link-dark" id="reviewAdmin">
          <svg class="bi me-2" width="16" height="16"></svg>
          리뷰관리
        </a>
      </li>
      <li>
        <a href="adminList" class="nav-link link-dark" id="memberAdmin">
          <svg class="bi me-2" width="16" height="16"></svg>
          회원관리
        </a>
      </li>
      <li>
        <a href="adminEvent" class="nav-link link-dark" id="eventAdmin">
          <svg class="bi me-2" width="16" height="16"></svg>
          이벤트관리
        </a>
      </li>
    </ul>
</div>

<script type="text/javascript">
const href = document.location.href.split('/shop/')[1];

if(href.includes('adminProd')) {
	document.querySelector('#prodAdmin').className = 'nav-link active';
} else if(href.includes('adminOrder')) {
	document.querySelector('#orderAdmin').className = 'nav-link active';
} else if(href.includes('adminReview')) {
	document.querySelector('#reviewAdmin').className = 'nav-link active';
} else if(href.includes('adminList')) {
	document.querySelector('#memberAdmin').className = 'nav-link active';
} else {
	document.querySelector('#eventAdmin').className = 'nav-link active';
}

</script>

</body>
</html>