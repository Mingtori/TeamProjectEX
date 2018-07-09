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
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

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
	.container{
		
	}
	
</style>
</head>

<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="${pageContext.request.contextPath}/">Start
			Bootstrap</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav text-uppercase ml-auto">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#team">Team</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="list.prd">products</a></li>
				<!-- <li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#about">About</a></li> -->
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="mypage.pg">My Page</a></li>
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