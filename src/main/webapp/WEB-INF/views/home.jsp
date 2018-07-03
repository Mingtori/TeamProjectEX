<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	Home.jsp<br>
	<ul>
		<li><a href="<%=request.getContextPath() %>/">Home</a></li>
		<li><a href="#">공지사항</a></li>
		<li><a href="#">QnA</a></li>
		<li><a href="mypage.pg">My Page</a></li>
		<% if (session.getAttribute("loginfo")==null){ %>
		<li><a href="login.me">로그인</a></li>
		<% }else{ %>
		<li><a href="logout.me">로그아웃</a></li>
		<% } %>
	</ul>
</body>
</html>
