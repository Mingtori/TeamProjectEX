<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/top.jsp"%>

<head>
<script type="text/javascript">
	function goback() {
		history.back(-1);
	}
</script>
<style>
.jumbotron {
	background-color: #F2F2F2;
	background-color: rgba(242, 242, 242, 0.8);
}

.form-inline label, .form-inline>.form-control {
	display: inline-block;
}

.font-black {
	color: black;
}

a {
	color: black;
}
</style>
</head>
<body>

	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="jumbotron">
					<div class="intro-lead-in font-black">비밀번호 찾기</div>
					<form:form commandName="pwsearch" action="pwsearch.me"
						method="post">
						<div class="form-inline" style="display: block;">
							<label class="font-black col-md-2 control-label" for="memid">아이디</label> <input
								class="form-control" type="text" name="memid"
								placeholder="hong">
						</div>
						<div class="form-inline" style="display: block;">
							<label class="font-black col-md-2 control-label" for="memname">이름</label> <input
								class="form-control" type="text" name="memname"
								placeholder="홍길동">
						</div>
						<div class="form-inline" style="display: block;">
							<label class="font-black col-md-2 control-label" for="mememail">이메일</label> <input
								class="form-control" type="email"
								name="mememail" placeholder="email@email.com">
						</div>
						
						<input class="btn btn-default" type="submit" value="비밀번호찾기">
						<input class="btn btn-default" type="button" value="돌아가기"
							onclick="goback();">
						
					</form:form>
				</div>
			</div>
		</div>
	</header>


	<%@ include file="../views/bottom.jsp"%>