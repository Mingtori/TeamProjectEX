<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../page/mytop.jsp" %>

<script>
function board(what, type, prodname, prodid, memid){
	$("#prodid").val(prodid);
	   $("#modal-title").text(what);
	   $("#memid").val(memid);
	   $("#boardcateid").val(type);
	   $("#boardsubject").val(prodname);
	   $("#reviewModal").modal();
}

</script>
   <h1>구매내역</h1>

		<table>
			<c:if test="${fn:length(orderlists) == 0 }">
				<tr><td align="center">구매내역이 없습니다.</td></tr>
			</c:if>
		   <c:forEach var="orderlist" items="${orderlists }">
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
                     <input class="btn btn-default" type="button" value="후기작성" id="review" onclick="board('후기 작성','p03','${order.prodname}','${order.prodid}','${loginfo.memid}');">
	                  </c:if>
	                  <c:if test="${order.orderuse == 'NO' }">
	                     <input class="btn btn-default" type="button" value="주문취소" onclick="location.href='delete.ord?orderid=${order.orderid}'">
	                  </c:if>
	                  <input class="btn btn-default" type="button" value="문의하기" onclick="board('문의 작성','p02','${order.prodname}','${order.prodid}','${loginfo.memid}');">
		            </td>	
		         </tr>
		      </c:forEach>
			</c:forEach>
		</table>
   	<hr>
   	
   	 <!-- Modal -->
      <div id="reviewModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
      
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="modal-title" align="center"></h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="insert.bd" method="post">
            <div class="modal-body">
               <input type="hidden" id="memid" name="memid"/>
               <input type="hidden" id="prodid" name="prodid"/>
               <input type="hidden" id="boardsubject" name="prodname"/>
               <input type="hidden" id="boardcateid" name="boardcateid"/>
               <div class="row">
                  <div class="col-sm-1">
                     <label for="boardcontent">내용</label>
                  </div>
                  <div class="col-sm-11">
                     <textarea rows="5" cols="70" name="boardcontent"></textarea>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary" id="insert" >작성</button>
            </div>
            </form>
          </div>
      
        </div>
      </div>
<%@ include file="../page/mybottom.jsp" %>