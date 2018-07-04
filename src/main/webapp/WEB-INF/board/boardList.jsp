<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	boardList.jsp

	<h3>공지사항</h3>
	<table border=1>
		<tr>
			<td colspan=5 align="right"><input type="button" value="글쓰기"
				onclick="location.href='insert.bd?boardcateid=${boardcateid}'" /></td>
		</tr>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>게시일자</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${lists }" var="lists">
			<tr>
				<td>${lists.boardid }</td>
				<td><a href="detail.bd?boardid=${lists.boardid}&pageNumber=${pageInfo.pageNumber}">${lists.boardsubject }</a></td>
				<td>${lists.memid }</td>
				<td>${lists.boardinputdate}</td>
				<td>${lists.boardreadcount }</td>
			</tr>
		</c:forEach>
	</table>
	${pageInfo.pagingHtml }
	<form action="notice.bd" method="get">
		<select name="whatColumn">
			<option value="boardsubject">제목
			<option value="boardcontent">내용
		</select> <input type="text" name="keyword" placeholder="검색" value=""> <input
			type="submit" value="검색">
	</form>
</body>
</html>