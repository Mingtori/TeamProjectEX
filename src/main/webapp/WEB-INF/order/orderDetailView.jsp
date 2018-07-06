<%@page import="member.model.Member"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매상세내역</title>
</head>
<body>
	orderDetailView.jsp
	<c:set var="theString" value=
		"http://localhost:9090${pageContext.request.contextPath}/resources/${product.prodimage }"/>

	<h1>${order.prodname }</h1>
	<form action ="delete.ord" method ="post">
		<img src = ${theString } width="300" />
		<br>Date : ${order.prodstartdate } ~ ${order.prodenddate }
		<br>Price : ${order.prodprice*order.orderqty }
		<br>category : ${product.prodcatename }
		<br>
		<input type = "hidden" name = "orderid" value = "${order.orderid }"/>
		<input type = "button" value="확인" onclick="location.href='list.prd?memid=<%=((Member)session.getAttribute("loginfo")).getMemid() %>'">
		<input type = "submit" value = "구매취소"> 
	</form>
	
	<br><br>content : ${order.prodcontent }
</body>
</html>