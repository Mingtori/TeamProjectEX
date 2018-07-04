<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript">
	function goback(){
		history.back(-1);
	}
	function leave(memid){
		location.href="delete.me?memid=" + memid;
	}
</script>
</head>
<body>
	updateForm.jsp
	<c:set var="phone" value="${fn:split(member.memphone,'-') }"/>
	<c:set var="email" value="${fn:split(member.mememail,'@') }"/>
	<h1>회원 정보 수정</h1>
	<form:form commandName="update" action="update.me" method="post">
		<input type="hidden" name="comid" value="${member.comid }">
		<label for="memid">아이디</label>
		<input type="hidden" name="memid" value="${member.memid }">
		<input type="text" value="${member.memid }" disabled>
		<form:errors cssClass="err" path="memid"/><p>
		<label for="mempw">비밀번호</label>
		<input type="password" name="mempw" placeholder="PASSWORD" value="">
		<form:errors cssClass="err" path="mempw"/><p>
		<label for="mempwcheck">비밀번호 확인</label>
		<input type="password" name="mempwcheck" placeholder="PASSWORD" value="">
		<form:errors cssClass="err" path="mempwcheck"/><p>
		<label for="memname">이름</label>
		<input type="text" name="memname" placeholder="NAME" value="${member.memname }">
		<form:errors cssClass="err" path="memname"/><p>
		<label for="memaddr">주소</label>
		<input type="text" name="memaddr" placeholder="서울시 서대문구" value="${member.memaddr }">
		<form:errors cssClass="err" path="memaddr"/><p>
		<c:if test="${member.memid!='admin'}">
			<label for="memphone1">전화번호</label>
			<select name="memphone1">
				<option value="010" <c:if test="${phone[0] == '010' }">selected</c:if>>010
				<option value="070" <c:if test="${phone[0] == '070' }">selected</c:if>>070
			</select>
			<c:forEach var="ph" items="${phone }" varStatus="status" begin="1">
			-
			<input type="text" name="memphone${status.count + 1 }" placeholder="1234" value="${ph }">
			</c:forEach>
			<form:errors cssClass="err" path="memphone1"/>
			<form:errors cssClass="err" path="memphone2"/>
			<form:errors cssClass="err" path="memphone3"/><p>
		</c:if>
		<label for="mememail1">이메일</label>
		<input type="text" name="mememail1" placeholder="email" value="${email[0] }">
		@
		<select name="mememail2">
			<option value="">선택하세요
			<option value="naver.com" <c:if test="${email[1] == 'naver.com' }">selected</c:if>>naver.com
			<option value="daum.net" <c:if test="${email[1] == 'daum.net' }">selected</c:if>>daum.net
		</select>
		<form:errors cssClass="err" path="mememail1"/>
		<form:errors cssClass="err" path="mememail2"/><p>
		<c:if test="${member.gradename == '판매자' }">
			<l	abel for="comname">회사이름</label>
			<input type="text" name="comname" placeholder="예술의 전당" value="${member.comname }"><p>		
			<label for="comaddr">회사주소</label>
			<input type="text" name="comaddr" placeholder="서울시 서초구" value="${member.comaddr }"><p>		
		</c:if>
		
		<input type="submit" value="수정하기">
		<input type="button" value="돌아가기" onclick="goback();">
		<input type="button" value="회원탈퇴" onclick="leave('${member.memid}');">
	</form:form>
</body>
</html>