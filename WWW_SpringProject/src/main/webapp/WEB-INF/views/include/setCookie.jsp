<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

var setCookie = function(name, value, exp) {
	var date = new Date();
	date.setTime(date.getTime() + exp*24*60*60*1000);
	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
};

var getCookie = function(name) {
	var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    
	return value? value[2] : null;
};

var deleteCookie = function(name){
	var expireDate = new Date();
	expireDate.setDate( expireDate.getDate() - 1 );
	document.cookie = name + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
};


var is_nm = getCookie("nm_ID");
if(is_nm == null) {
	const random = Math.random();
	setCookie("nm_ID", random, 1);
} else {
	const is_nm = getCookie("nm_ID");
	setCookie("nm_ID", is_nm, 1);
}

function deleteRecentView(num) {
	const cookie = getCookie('recent_view_items');
	var arr = cookie.split(",");
	var arr2 = [];
	for(i=0; i<arr.length; i++) {
		if(arr[i] == num) {
			delete arr[i];
		} else {
			arr2.push(arr[i]);
		}
	}
	setCookie('recent_view_items', arr2.toString(), 1);
}
</script>