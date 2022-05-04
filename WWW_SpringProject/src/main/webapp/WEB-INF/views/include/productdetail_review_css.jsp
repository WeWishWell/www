<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
<
style type ="text /css ">.review-list ul li .right h4 .gig-rating {
	display: flex;
	align-items: center;
	margin-left: 10px;
	color: #ffbf00;
}

.review-list ul li .right h4 .gig-rating svg {
	margin: 0 4px 0 0px;
}

.review-list ul li {
	border-bottom: 1px solid #dadbdd;
	padding: 0 0 30px;
	margin: 0 0 30px;
}

.review-list ul li .right {
	flex: auto;
}

.review-list ul li .review-description {
	margin: 20px 0 0;
}

.review-list ul li .review-description p {
	font-size: 14px;
	margin: 0;
}

.review-list ul li .publish {
	font-size: 13px;
	color: #95979d;
}

.review-section h4 {
	font-size: 20px;
	color: #222325;
	font-weight: 700;
}

.review-section .stars-counters tr .stars-filter.fit-button {
	padding: 6px;
	border: none;
	color: #4a73e8;
	text-align: left;
}

.review-section .fit-progressbar-bar .fit-progressbar-background {
	position: relative;
	height: 8px;
	background: #efeff0;
	-webkit-box-flex: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	background-color: #ffffff;;
	border-radius: 999px;
}

.review-section .stars-counters tr .star-progress-bar .progress-fill {
	background-color: #ffb33e;
}

.review-section .fit-progressbar-bar .progress-fill {
	background: #2cdd9b;
	background-color: rgb(29, 191, 115);
	height: 100%;
	position: absolute;
	left: 0;
	z-index: 1;
	border-radius: 999px;
}

.review-section .fit-progressbar-bar {
	display: flex;
	align-items: center;
}

.review-section .stars-counters td {
	white-space: nowrap;
}

.review-section .stars-counters tr .progress-bar-container {
	width: 100%;
	padding: 0 10px 0 6px;
	margin: auto;
}

.ranking h6 {
	font-weight: 600;
	padding-bottom: 16px;
}

.review-section .stars-counters td.star-num {
	color: #4a73e8;
}

.ranking li>span {
	color: #62646a;
	white-space: nowrap;
	margin-left: 12px;
}

.review-section {
	border-bottom: 1px solid #dadbdd;
	padding-bottom: 24px;
	margin-bottom: 34px;
	padding-top: 64px;
}

.review-section select, .review-section .select2-container {
	width: 188px !important;
	border-radius: 3px;
}

ul, ul li {
	list-style: none;
	margin: 0px;
}

.helpful-thumbs, .helpful-thumb {
	display: flex;
	align-items: center;
	font-weight: 700;
}

.inner-star::before {
	color: #FF9600;
}

.star::before {
	color: #FF9600;
}

.outer-star {
	position: relative;
	display: inline-block;
	color: #CCCCCC;
}

.inner-star {
	position: absolute;
	left: 0;
	top: 0;
	width: 0%;
	overflow: hidden;
	white-space: nowrap;
}

.outer-star::before, .inner-star::before {
	content: '\f005 \f005 \f005 \f005 \f005';
	font-family: 'Font Awesome 5 free';
	font-weight: 900;
}
.products_reviews_summary_v2__score_icon{
	height: 20px
}
.products_reviews_summary_v2__score_icon_avg{
	line-height: 20px;
	vertical-align: middle;
}
.thumbs{
	background-color:transparent;
	border: none;
}
</style>