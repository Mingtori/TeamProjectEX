<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/top.jsp"%>
<head>
<script type="text/javascript">
	function register() {
		location.href = "register.me";
	}
</script>
<style>
.jumbotron {
	background-color: rgba(242, 242, 242, 0.8);
}

.form-inline label, .form-inline>.form-control {
	display: inline-block;
}

.font-black {
	color: black;
}

a.font {
	color: black;
}
</style>
</head>
<body>
	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="jumbotron">
					<div class="intro-lead-in font-black">LOGIN</div>
					<form action="login.me" method="post">
						<div class="form-group form-inline" style="display: block;">
							<label for="memid" class="font-black col-md-2 control-label">아이디</label>
							<input class="form-control" type="text" name="memid"
								placeholder="ID"">
						</div>
						<div class="form-group form-inline" style="display: block;">
							<label for="mempw" class="font-black col-md-2 control-label">비밀번호</label>
							<input class="form-control" type="password" name="mempw"
								placeholder="PASSWORD">
						</div>
						<input class="btn btn-default" type="submit" value="로그인">
						<input class="btn btn-default" type="button" value="회원가입"
							onclick="register();">
					</form>
					<a class="font" href="idsearch.me">아이디 찾기</a> / <a class="font" href="pwsearch.me">비밀번호
						찾기</a>
				</div>
			</div>
		</div>
	</header>

	<%@ include file="../views/bottom.jsp"%>