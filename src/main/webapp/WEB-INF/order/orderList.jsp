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
			<c:set var="orderdate" value="${orderid[0] }"/>
			<tr>
				<td>${orderdate }</td>
			</tr>
			<tr>
				<td rowspan="2"><img
							src="${pageContext.request.contextPath }/resources/${order.prodimage }"
							width="100" /></td>
				<td><a href="detail.ord?orderid=${order.orderid }">${order.prodname }</a></td>
			</tr>
			<tr>
				<td>${order.prodprice }</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${order.orderuse == 'YES' }">
						<input type="button" value="후기작성" onclick="">
					</c:if>
					<c:if test="${order.orderuse == 'NO' }">
						<input type="button" value="주문취소" onclick="location.href='delete.ord?orderid=${order.orderid}'">
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>