<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문내역</title>
</head>
<body>
	<h3>주문내역</h3>
	<table>
		<c:forEach var="order" items="${orderlist }">
			<c:set var="orderid" value="${fn:split(order.orderid, '@') }"/>
			<c:set var="orderdate" value="${order[0] }"/>
			<tr>
				<td>${order.orderdate }</td>
			</tr>
			<tr>
				<td rowspan="2">사진</td>
				<td>${order.prodname }</td>
			</tr>
			<tr>
				<td>${order.prodprice }</td>
			</tr>
			<tr>
				<td colspan="2">주문취소 || 후기작성</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>