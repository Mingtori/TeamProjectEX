<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../page/mytop.jsp" %>
   <h1>구매내역</h1>

      <c:forEach var="orderlist" items="${orderlists }">
   	<table>
         <c:forEach var="order" items="${orderlist }" varStatus="status">
            <c:set var="orderid" value="${fn:split(order.orderid, '@') }"/>
            <c:set var="orderdate" value="${orderid[0] }"/>
            <c:if test="${status.count ==1 }">
               <tr>
                  <td width="30%"><font size="3px"><b>주문일 : </b>${orderdate }</font></td>
                  <td align="right" colspan="2"><a href="detail.ord?orderid=${order.orderid }">주문 상세</a></td>
               </tr>
            </c:if>
            <tr style="border:1px solid black;">
               <td>
                  <img src="${pageContext.request.contextPath }/resources/${order.prodimage }" width="200px" /></td>
               <td valign="top">
               		<br>
               		<a href="detail.prd?prodid=${order.prodid }&pageNumber=0&boardcateid=p03">${order.prodname }</a><br><br>
               		<fmt:formatNumber value="${order.prodprice }" pattern='###,###'/>원 /  ${order.orderqty }개
               </td>
               <td align="right"  width="15%">
                  전시기간 : <br>${fn:substring(order.prodstartdate,0,10) }<br>  ~  ${fn:substring(order.prodenddate,0,10)}<br><br>
                  <c:if test="${order.orderuse == 'YES' }">
                     <input class="btn btn-default" type="button" value="후기작성" onclick="">
                  </c:if>
                  <c:if test="${order.orderuse == 'NO' }">
                     <input class="btn btn-default" type="button" value="주문취소" onclick="location.href='delete.ord?orderid=${order.orderid}'">
                  </c:if>
                  <input class="btn btn-default" type="button" value="문의하기" onclick="">
               </td>	
            </tr>
         </c:forEach>
   </table>
   <hr>
      </c:forEach>
<%@ include file="../page/mybottom.jsp" %>