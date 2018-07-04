<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./../common/common.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
</head>
<body>
<h3>게시글 수정</h3>
	<form:form commandName="update" name="update" method="post" action="update.bd">
		<input type="hidden" name="boardid" value="${board.boardid}">
		<input type="hidden" name="boardcateid" value="${board.boardcateid}">
		<input type="hidden" name="pageNumber" value="${pageNumber}">
		<label for="boardsubject">제목</label>
		<input type="text" name="boardsubject" value="${board.boardsubject }">
		<label for="boardcontent">내용</label>
		<textarea name="boardcontent" style="resize:false;">${board.boardcontent }</textarea>
		<input type="submit" value="글쓰기"/>
		<input type="reset" value="취소" />
	</form:form>
</body>
</html>