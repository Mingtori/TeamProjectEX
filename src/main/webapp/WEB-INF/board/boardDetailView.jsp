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
boardDetailView.jsp
<h2>게시글 상세보기</h2><br>
<c:set value="${boardDetail}" var="board"/>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0">  
		
  <tr height="30">
    <td align="center" width="125" >글번호</td>
    <td align="center" width="125"> ${board.boardid }</td>
    <td align="center" width="125" >조회수</td>
    <td align="center" width="125">${board.boardreadcount }</td>
  </tr>
  
  <tr height="30">
    <td align="center" width="125" >작성자</td>
    <td align="center" width="125">${board.memid }</td>
    <td align="center" width="125"  >작성일</td>
    <td align="center" width="125"><fmt:formatDate value="${board.boardinputdate }" type="date" pattern="yyyy-MM-dd"/></td>
  </tr>
  
  <tr height="30">
    <td align="center" width="125" >글제목</td>
    <td align="center" width="375" colspan="3">${board.boardsubject}</td>
  </tr>
  
  <tr>
    <td align="center" width="125" >글내용</td>
    <td align="left" width="375" colspan="3">
    	<pre>${board.boardcontent}</pre></td>
  </tr>
  
  <tr height="30">      
    <td colspan="4"  align="right" > 
	  <input type="button" value="글수정" 
       onclick="update(${board.boardid});">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  
	  <input type="button" value="글삭제" 
       onclick="document.location.href=
       'delete.bd?num=${board.boardid}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
      
   
       <input type="button" value="글목록" 
       onclick="document.location.href=
       'notice.bd?pageNumber=${pageNumber}'">
    </td>
  </tr>
</table>    

</form>
</body>
</html>