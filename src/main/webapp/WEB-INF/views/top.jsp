<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Ticket</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/agency.min.css"
	rel="stylesheet">
<style>
.dropdown-menu{
	background-color:transparent;
	border:none;
}
</style>
</head>

<body id="page-top">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="${pageContext.request.contextPath}/">Withibition</a> 
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav text-uppercase ml-auto">
				<c:set var="pagestart" value="${pageContext.request.contextPath }"/>
				<c:if test="${fn:substringAfter(pageContext.request.requestURL,pagestart) == '/WEB-INF/views/home.jsp'}">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#team">Team</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="list.prd">products</a></li>
				<li class="nav-item">
					<div class="dropdown">
						<a class="dropdown-toggle nav-link js-scroll-trigger" href="#" id="contact" data-toggle="dropdown" aria-expanded="true">contact
						    <span class="caret"></span>
						</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="contact">
						  <li role="presentation"><a role="menuitem" tabindex="-1" href="notice.bd?boardcateid=a01">Notice</a></li>
						  <li role="presentation"><a role="menuitem" tabindex="-1" href="notice.bd?boardcateid=a02">QnA</a></li>
						</ul>
					</div>
				</li>
				<c:if test="${loginfo != null }">
				<li class="nav-item">
					<div class="dropdown">
					<a class="dropdown-toggle nav-link js-scroll-trigger" id="mypage" data-toggle="dropdown" aria-expanded="true" href="mypage.pg">My Page
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="mypage">
						<c:if test="${loginfo.gradeid == 0 }">
							<!-- 관리자일경우 -->
							<li role="presentation"><a role="menuitem" tabindex="-1" href="memberlist.me">회원관리목록</a></li>
						  	<li role="presentation"><a role="menuitem" tabindex="-1" href="list.prd">상품관리목록</a></li>
						</c:if>
						<c:if test="${loginfo.gradeid == 1 }">
							<!-- 일반 사용자일경우 -->
							<li role="presentation"><a role="menuitem" tabindex="-1" href="list.ct">장바구니</a></li>
						  	<li role="presentation"><a role="menuitem" tabindex="-1" href="list.ord?memid=${loginfo.memid }">구매내역</a></li>
						</c:if>
						<c:if test="${loginfo.gradeid == 2 }">
							<!-- 판매자일경우 -->
							<li role="presentation"><a role="menuitem" tabindex="-1" href="listSeller.prd?memid=${loginfo.memid }">상품관리목록</a></li>
						  	<li role="presentation"><a role="menuitem" tabindex="-1" href="listSeller.ord">상품판매내역</a></li>
						</c:if>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="update.me">회원정보수정</a></li>
					</ul>
					</div>
				</li>
				</c:if>
				<c:if test="${loginfo == null }">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="login.me">Login</a></li>
				</c:if>
				<c:if test="${loginfo != null }">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="logout.me">Logout</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	</nav>