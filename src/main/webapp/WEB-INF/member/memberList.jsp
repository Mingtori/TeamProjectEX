<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
<script type="text/javascript">
	function permit(){
		
	}
</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>회원등급</th>
			<th>회사이름</th>
			<th>회사주소</th>
			<th>수정</th>
			<th>삭제</th>
			<th>승인</th>
		</tr>
		<c:forEach var="member" items="${memberlist }">
			<tr>
				<td>${member.memid }</td>
				<td>${member.mempw }</td>
				<td>${member.memname }</td>
				<td>${member.memphone }</td>
				<td>${member.mememail }</td>
				<td>${member.gradename }</td>
				<td>${member.comname }</td>
				<td>${member.comaddr }</td>
				<td><a href="update.me?memid=${member.memid }">수정</a></td>
				<td><a href="delete.me?memid=${member.memid }">삭제</a></td>
				<td>
				<c:if test="${member.mempermit == '승인대기' }">
					<input type="button" value="승인" onclick="permit();">
				</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>