<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/top.jsp"%>
<head>
	<style>
		.jumbotron {
			 background-color: #F2F2F2;
			 background-color: rgba( 242, 242, 242, 0.8 );
		}
		.font-black{
			color:black;
		}
		.inblock{
			display:inline-block;
		}
		.block{
			display:block;
		}
		.div-margin{
			margin-top: 10px;
			margin-bottom: 10px;
		}
		a{
			color:black;
		}
		.fas {
	       margin-bottom:10px;
	      }
	</style>
</head>
<body>
	
	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="jumbotron">
				<div class="intro-lead-in font-black">회원가입</div>
					<form action="login.me" method="post">
						<div class="row">
			                  <div class="col-sm-2 offset-4" >
			                     <a href="register.me?type=nomal"><i class="fas fa-user-lock fa-7x"></i><br><font size="5em">일반회원</font></a>
			                  </div>
			                  <div class="col-sm-2">
			                     <a href="register.me?type=seller"><i class="fas fa-user-tie fa-7x"></i><br><font size="5em">판매자</font></a>
			                  </div>
			               </div>
					</form>
				</div>
			</div>
		</div>
	</header>
	
<%@ include file="../views/bottom.jsp"%>