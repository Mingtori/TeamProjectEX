<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script type="text/javascript">
	function register(){
		location.href="register.me";
	}
</script>
</head>
<body>
	loginForm.jsp
	<h1>로그인</h1>
	<form action="login.me" method="post">
		<p>
			<label for="memid">아이디</label>
			<input type="text" name="memid" placeholder="ID">
		</p>
		<p>
			<label for="mempw">비밀번호</label>
			<input type="password" name="mempw" placeholder="PASSWORD">
		</p>
		<p>
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="register();">
		</p>
	</form>
	<p>
		<a href="idsearch.me">아이디 찾기</a>
		/
		<a href="pwsearch.me">비밀번호 찾기</a>
	</p>
</body>
</html>