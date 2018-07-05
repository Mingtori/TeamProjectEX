<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./../common/common.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답글쓰기</title>
</head>
<body>
	<h3>답글쓰기</h3>
	<form:form commandName="reply" method="post" action="reply.bd">
		<input type="hidden" name="ref" value="${board.ref }">
		<input type="hidden" name="restep" value="${board.restep }">
		<input type="hidden" name="relevel" value="${board.relevel }">
		<input type="hidden" name="pageNumber" value="${pageNumber }">
		<input type="hidden" name="boardcateid" value="${board.boardcateid }">
		<input type="hidden" name="memid" value="${loginfo.memid}">
		<label for="boardsubject">제목</label>
		<input type="text" name="boardsubject" value="[답글]">
		<label for="boardcontent">내용</label>
		<textarea name="boardcontent"></textarea>
		<input type="submit" value="글쓰기"/>
		<input type="reset" value="취소" />
	</form:form>
</body>
</html>