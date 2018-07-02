<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	function goback(){
		history.back(-1);
	}
	function duplicateID(){
		
	}
</script>
</head>
<body>
	registerFormreal.jsp
	<h1>회원가입</h1>
	<form:form commandName="register" action="register.me" method="post">
		<input type="hidden" name="what" value="${what }">
		<label for="memid">아이디</label>
		<input type="text" name="memid" placeholder="ID">
		<input type="button" value="중복확인" onclick="duplicateID();">
		<form:errors cssClass="err" path="memid"/><p>
		<label for="mempw">비밀번호</label>
		<input type="password" name="mempw" placeholder="PASSWORD">
		<form:errors cssClass="err" path="mempw"/><p>
		<label for="mempwcheck">비밀번호 확인</label>
		<input type="password" name="mempwcheck" placeholder="PASSWORD">
		<form:errors cssClass="err" path="mempwcheck"/><p>
		<label for="memname">이름</label>
		<input type="text" name="memname" placeholder="NAME">
		<form:errors cssClass="err" path="memname"/><p>
		<label for="memaddr">주소</label>
		<input type="text" name="memaddr" placeholder="서울시 서대문구">
		<form:errors cssClass="err" path="memaddr"/><p>
		<label for="memphone1">전화번호</label>
		<select name="memphone1">
			<option value="010">010
			<option value="070">070
		</select>
		-
		<input type="text" name="memphone2" placeholder="1234">
		-
		<input type="text" name="memphone3" placeholder="1234">
		<form:errors cssClass="err" path="memphone1"/>
		<form:errors cssClass="err" path="memphone2"/>
		<form:errors cssClass="err" path="memphone3"/><p>
		<label for="mememail1">이메일</label>
		<input type="text" name="mememail1" placeholder="email">
		@
		<select name="mememail2">
			<option value="">선택하세요
			<option value="naver.com">naver.com
			<option value="daum.net">daum.net
		</select>
		<form:errors cssClass="err" path="mememail1"/>
		<form:errors cssClass="err" path="mememail2"/><p>
		<c:if test="${what == 'seller' }">
			<label for="comname">회사이름</label>
			<input type="text" name="comname" placeholder="예술의 전당"><p>		
			<label for="comaddr">회사주소</label>
			<input type="text" name="comaddr" placeholder="서울시 서초구"><p>		
		</c:if>
		
		<input type="submit" value="회원가입">
		<input type="button" value="돌아가기" onclick="goback();">
	</form:form>
	
</body>
</html>