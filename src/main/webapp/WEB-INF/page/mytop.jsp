<%@ include file="./../views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<style>
.list-group-item {
	color: black;
}
.jumbotron {
	background-color: #F2F2F2;
	background-color: rgba(242, 242, 242, 0.8);
}


#mainNav .navbar-nav .nav-item .nav-link {
	font-size: 90%;
	font-weight: 400;
	padding: .75em 0;
	letter-spacing: 1px;
	color: #000;
	font-family: Montserrat, 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

@media ( min-width : 768px) {
	section {
		background-image: url("./resources/img/header-bg.jpg");
		background-repeat: no-repeat;
		background-attachment: scroll;
		background-position: center center;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}
}
a {
	color:blue;
}
.container{
	max-width: 100%;
}
</style>
<section>
	<div class="container">
		<div class="jumbotron">
		<div class="row">
			<div class="list-group">
				<table>
				<td valign="top">
					<c:if test="${loginfo.gradeid == 0 }">
						<!-- 관리자일경우 -->
						<a class="list-group-item" href="memberlist.me">회원관리목록</a>
						<a class="list-group-item" href="list.prd">상품관리목록</a>
					</c:if>
					<c:if test="${loginfo.gradeid == 1 }">
						<!-- 일반 사용자일경우 -->
						<a class="list-group-item" href="list.ct">장바구니</a>
						<a class="list-group-item" href="list.ord?memid=${loginfo.memid }">구매내역</a>
					</c:if>
					<c:if test="${loginfo.gradeid == 2 }">
						<!-- 판매자일경우 -->
						<a class="list-group-item"
							href="listSeller.prd?memid=${loginfo.memid }">상품관리목록</a>
						<a class="list-group-item" href="#">상품판매내역</a>
					</c:if>
					<a class="list-group-item" href="update.me">회원정보수정</a> <a
						class="list-group-item" href="logout.me">로그아웃</a>
				</td>
				<td>