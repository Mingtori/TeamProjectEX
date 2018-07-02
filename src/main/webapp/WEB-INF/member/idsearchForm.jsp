<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">
	function goback(){
		history.back(-1);
	}
</script>
</head>
<body>
	idsearchForm.jsp
	<h1>아이디 찾기</h1>
	<form:form commandName="idsearch" action="idsearch.me" method="post">
		<label for="memname">이름</label>
		<input type="text" name="memname" placeholder="홍길동"><p>
		<label for="mememail">이메일</label>
		<input type="email" name="mememail" placeholder="email@email.com"><p>
		<input type="submit" value="아이디찾기">
		<input type="button" value="돌아가기" onclick="goback();">		
	</form:form>
</body>
</html>