<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./../common/common.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>글쓰기</h3>
<form:form commandName="insert" name="insert" method="post" action="insert.bd">
<input type="hidden" name="boardcateid" value="${boardcateid }">
<input type="hidden" name="memid" value="${loginfo.memid}">
<label for="boardsubject">제목</label>
<input type="text" name="boardsubject" >
<label for="boardcontent">내용</label>
<textarea name="boardcontent"></textarea>
<input type="submit" value="글쓰기"/>
<input type="reset" value="취소" />
</form:form>

</body>
</html>