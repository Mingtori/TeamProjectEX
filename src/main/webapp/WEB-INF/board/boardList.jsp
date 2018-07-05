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
	<c:set var="theString" value="http://localhost:9090${pageContext.request.contextPath}/resources/images"/>
	<c:set var="count" value="${pageInfo.totalCount - pageInfo.pageSize * (pageInfo.pageNumber-1)}"/>
	boardList.jsp

	<h3>공지사항</h3>
	<table border=1>
		<c:if test="${loginfo.memid eq 'admin'}">
		<tr>
			<td colspan=5 align="right"><input type="button" value="글쓰기"
				onclick="location.href='insert.bd?boardcateid=${boardcateid}'" /></td>
		</tr>
		</c:if>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>게시일자</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${lists }" var="lists" varStatus="status">
			<tr>
				<td>${count-status.index}</td>
				<td>
					<c:set var="wid" value="0" />
				    <c:if test="${lists.relevel > 0}">
					    <c:set var="wid" value="${20*lists.relevel }" />
					    <img src="${theString}/level.gif" width="${wid }" height="16">
						<img src="${theString}/re.gif">
				    </c:if>
					<c:if test="${board.re_level <= 0 }">
						<img src="${theString}/level.gif" width="${wid }" height="16">
					</c:if>
					<a href="detail.bd?boardid=${lists.boardid}&pageNumber=${pageInfo.pageNumber}">${lists.boardsubject }</a>
					<c:if test="${lists.boardreadcount > 10}">
		        		 <img src="${theString}/hot.gif" border="0"  height="16">
		 		   </c:if>
				</td>
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
		</select>
		<input type="text" name="keyword" placeholder="검색" value="">
		<input type="submit" value="검색">
	</form>
</body>
</html>