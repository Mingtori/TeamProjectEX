<%@ include file="./../views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<style>
.list-group-item {
	color: black;
}
.jumbotron {
	background-color: rgba(242, 242, 242, 0.8);
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
	font-weight:600;
	color:black;
}
.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
    color: #555;
    cursor: default;
    background-color: #fff;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
}
.nav-tabs>li>a {
	background-color:white;
    margin-right: 2px;
    line-height: 1.42857143;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
}

.nav>li>a {
    position: relative;
    display: block;
    padding: 10px 15px;
}

a.active.show {
   border-bottom-color: transparent;
   background-color:white;
}
ul.nav.nav-tabs {
   border-bottom:1px solid gray;
   margin-bottom:10px;
}
</style>
<section>
	<div class="container">
		<div class="jumbotron">
			<div class="bs-example" data-example-id="simple-nav-tabs">
				<ul class="nav nav-tabs">
					<!-- 관리자일경우 -->
					<c:if test="${loginfo.gradeid == 0 }">
						<li role="presentation"><a href="memberlist.me">회원관리목록</a></li>
						<li role="presentation"><a href="listSeller.prd?memid=${loginfo.memid }">상품관리목록</a></li>
					</c:if>
					<!-- 일반 사용자일경우 -->
					<c:if test="${loginfo.gradeid == 1 }">
						<li role="presentation"><a href="list.ct">장바구니</a></li>
						<li role="presentation"><a href="list.ord?memid=${loginfo.memid }">구매내역</a></li>
					</c:if>
					<!-- 판매자일경우 -->
					<c:if test="${loginfo.gradeid == 2 }">
						<li role="presentation"><a href="listSeller.prd?memid=${loginfo.memid }">상품관리목록</a></li>
						<li role="presentation"><a href="listSeller.ord">상품판매내역</a></li>
					</c:if>
					<li role="presentation"><a href="update.me">회원정보수정</a></li>
		    	</ul>
			</div>
			<%-- <div class="row">
				<div class="col-sm-2">
					<div class="list-group">
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
							<a class="list-group-item" href="listSeller.ord">상품판매내역</a>
						</c:if>
						<a class="list-group-item" href="update.me">회원정보수정</a>
					</div>
				</div> 
				<div class="col-sm-10">--%>