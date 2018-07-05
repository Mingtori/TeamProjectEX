<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>
<body>
	myPage.jsp<br>
	<ul>
		<li><a href="<%=request.getContextPath() %>/">Home</a></li>
		<c:if test="${loginfo.gradeid == 0 }"><!-- 관리자일경우 -->
			<li><a href="memberlist.me">회원관리목록</a></li>
			<li><a href="#">상품관리목록</a></li>
		</c:if>
		<c:if test="${loginfo.gradeid == 1 }"><!-- 일반 사용자일경우 -->
			<li><a href="#">구매내역</a></li>
			<li><a href="#">사용내역</a></li>
		</c:if>
		<c:if test="${loginfo.gradeid == 2 }"><!-- 판매자일경우 -->
			<li><a href="listSeller.prd?memid=${loginfo.memid }">상품관리목록</a></li>	
			<li><a href="#">상품판매내역</a></li>	
		</c:if>
		<li><a href="update.me">회원정보수정</a></li>
		<li><a href="logout.me">로그아웃</a></li>
	</ul>
</body>
</html>