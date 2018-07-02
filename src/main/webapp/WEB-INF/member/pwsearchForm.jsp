<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
	function goback(){
		history.back(-1);
	}
</script>
</head>
<body>
	pwsearchForm.jsp
	<h1>비밀번호 찾기</h1>
	<form:form commandName="pwsearch" action="pwsearch.me" method="post">
		<label for="memid">아이디</label>
		<input type="text" name="memname" placeholder="hong"><p>
		<label for="memname">이름</label>
		<input type="text" name="memname" placeholder="홍길동"><p>
		<label for="mememail">이메일</label>
		<input type="email" name="mememail" placeholder="email@email.com"><p>
		<input type="submit" value="비밀번호찾기">
		<input type="button" value="돌아가기" onclick="goback();">		
	</form:form>
</body>
</html>