<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../page/mytop.jsp" %>
	<table class="table" style="background-color:white">
		<tr>
			<th>구매날짜</th>
			<th>구매자</th>
			<th>상품</th>
			<th>수량</th>
			<th>사용여부</th>
		</tr>
		<c:forEach var="order" items="${orderlist }">
			<c:set var="orderid" value="${fn:split(order.orderid,'@') }"/>
			<c:set var="date" value="${orderid[0] }"/>
			<c:set var="memid" value="${orderid[1] }"/>
			<tr>
				<td>${date }</td>
				<td>${memid }</td>
				<td>${order.prodname }</td>
				<td>${order.orderqty }</td>
				<td>
					<c:if test="${order.orderuse == 'NO' }">
						<input type="button" value="사용" onclick="location.href='update.ord?orderid=${order.orderid}'">
					</c:if>
					<c:if test="${order.orderuse == 'YES' }">
						${order.orderuse }
					</c:if>
				</td>
				
			</tr>
		</c:forEach>
	</table>


<%@ include file="../page/mybottom.jsp" %>