<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../page/mytop.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
<script type="text/javascript">
</script>
</head>
<body>
	<form action="memberlist.me" method="get">
		<div class="form-group form-inline">
			<select class="form-control" name="flag">
				<option value="" selected>전체검색
				<option value="memid">아이디
				<option value="memname">이름
			</select>
			<input class="form-control" type="text" name="search" placeholder="검색" value="">
			<input class="btn btn-default" type="submit" value="검색">
		</div>
	</form>
	<table class="table table-bordered" style="background-color:white;">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>회원등급</th>
			<th>회사 이름</th>
			<th>회사 주소</th>
			<th>수정</th>
			<th>삭제</th>
			<th>가입</th>
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
				<td>
					<c:if test="${member.gradename != '관리자' }">
						<a href="update.me?memid=${member.memid }">수정</a>
					</c:if>
				</td>
				<td>
					<c:if test="${member.gradename != '관리자' }">
						<a href="delete.me?memid=${member.memid }">삭제</a>
					</c:if>
				</td>
				<td>
					<c:if test="${member.mempermit == '승인대기' }">
						<form action="memberlist.me" method="post">
							<input type="hidden" name="memid" value="${member.memid }">
							<input type="submit" value="승인">
						</form>
					</c:if>
					<c:if test="${member.mempermit == '승인' }">
						<c:out value="승인"/>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
<%@ include file="./../page/mybottom.jsp" %>