<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기게시판</title>
</head>
<body>
	<form action="insert.bd" method="post">
		<input type="hidden" name="boardcateid" value="">
		<table>
			<tr>
				<td>
					<input type="text" name="boardsubject" placeholder="제목">
				</td>
				<td align="right">
					<a href="">글쓰기</a>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="boardcontent" placeholder="내용">
				</td>
			</tr>
		</table>
	</form>
	<table border="1">
		<c:if test="${fn:length(reviewlist) == 0}">
			<tr>
				<td align="center">
					후기가 없습니다.	
				</td>
			</tr>
		</c:if>
		<c:if test="${fn:length(reviewlist) != 0}">
		<c:forEach var="review" items="${reviewlist }">
			<tr>
				<td>
					${review.boardsubject }
				</td>
				<td align="right">
					<a href="">더보기</a>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					${review.boardcontent }
				</td>
			</tr>
			<tr>
				<td colspan="2">
					조회 ${review.boardreadcount } 작성자 ${review.memid } 작성일 ${review.boardinputdate }
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
</body>
</html>