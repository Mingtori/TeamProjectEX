<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<script type="text/javascript">
   function checkProdstock(_cartqty,prodstock){
      var cartqty = document.getElementById(_cartqty).value;
      if(prodstock < cartqty){
         return null;
      }
   }
   
   function incNum(_cartqty,_totalprodprice,prodstock,prodprice){
      var cartqty = document.getElementById(_cartqty).value;
      var x = ++cartqty;
      var y = prodprice * x;
      if(x <= prodstock){
         document.getElementById(_cartqty).value = x;
         document.getElementById(_totalprodprice).value = y.toLocaleString();
      }
   }
   
   function decNum(_cartqty,_totalprodprice,prodprice){
      var cartqty = document.getElementById(_cartqty).value;
      var x = --cartqty;
      var y = prodprice * x;
      if(x >= 1){
         document.getElementById(_cartqty).value = x;
         document.getElementById(_totalprodprice).value = y.toLocaleString();
      }
   }
   
   function chxNum(_cartqty,_totalprodprice,prodprice){
      var cartqty = document.getElementById(_cartqty).value;
      var y = prodprice * cartqty;
      document.getElementById(_totalprodprice).value = y.toLocaleString();
   }
</script>
<c:forEach items="${product }" var="product">
<c:set var="prodimage" value="http://localhost:9090${pageContext.request.contextPath}/resources/${product.prodimage }" />
  <div class="portfolio-modal modal fade" id="portfolioModal${product.prodid}" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-dismiss="modal">
            <div class="lr">
              <div class="rl"></div>
            </div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 mx-auto">
                <div class="modal-body">

                <!-- Project Details Go Here -->
                 <form name = "ProdUpdateForm" action = "insert.ct" method = "GET">
                 <div class="form-group">
                  <h2>${product.prodname }</h2>
                  <p class="item-intro text-muted">${product.prodcontent}</p>
                  <img class="img-fluid d-block mx-auto" src="${prodimage}" alt="">
                  <ul class="list-inline">
                    <li>Date : ${product.prodstartdate } ~ ${product.prodenddate } </li>
                    <li>Price : ${product.prodprice } </li>
                    <li>Category : ${product.prodcatename } </li>
                  </ul>
                  </div>
                  <br>
              <br>
                  <input type = "button" value = "+" onclick = "incNum('cartqty${product.prodid }','totalprodprice${product.prodid }',${product.prodstock},${product.prodprice})" />
                  <input type = "button" value = "-" onclick = "decNum('cartqty${product.prodid }','totalprodprice${product.prodid }',${product.prodprice})" />
                  <input type = "number" name = "cartqty${product.prodid }" id = "cartqty${product.prodid }" min = "1" max = "${product.prodstock }" value="1" onclick="chxNum('cartqty${product.prodid }','totalprodprice${product.prodid }',${product.prodprice})"/>
                  <input type = "submit" value = "장바구니"/> 
                  <br> 총 금액
                 <input type = "text" id = "totalprodprice${product.prodid }" value = "<fmt:formatNumber value='${product.prodprice }' pattern='###,###'/>">
                <br><br>content : ${product.prodcontent }
                
<br>
            <!-- 후기게시판 -->
            <c:set var="review" value="${reviewlists }"></c:set>
            <form action="insert.bd" method="post">
               <input type="hidden" name="boardcateid" value="p03">
               <input type="hidden" name="prodid" value="${ product.prodid}">
               <input type="hidden" name="memid" value="${loginfo.memid }">
               <table>
                  <tr>
                     <td>
                        <input type="text" name="boardsubject" placeholder="제목">
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        <input type="text" name="boardcontent" placeholder="내용">
                     </td>
                  </tr>
                  <tr>
                     <td align="right">
                        <input type="submit" value="글쓰기">
                     </td>
                  </tr>
               </table>
            </form>
            <table border="1">
            
               <c:if test="${fn:length(review) == 0}">
                  <tr>
                     <td align="center">
                        후기가 없습니다.   
                     </td>
                  </tr>
               </c:if>
               <c:if test="${fn:length(review) != 0}">
               <c:forEach var="review" items="${reviewlists }">
                  <tr>
                     <td>
                        ${review.boardsubject }
                     </td>
                     <td align="right">
                        <a href="">더보기</a>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        ${review.boardcontent }
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2">
                        조회 ${review.boardreadcount } 작성자 ${review.memid } 작성일 ${review.boardinputdate }
                     </td>
                  </tr>
               </c:forEach>
               </c:if>
            </table>
                
                <input type = "hidden" name = "prodid" id = "prodid"  value = "${product.prodid }"/>
                <input type = "hidden" name = "prodstock" id = "prodstock"  value = "${product.prodstock }"/>
                <input type = "hidden" name = "prodcateid" id = "prodcateid"  value = "${product.prodcateid }"/>
               <br>
            </form>
                  <button class="btn btn-primary" data-dismiss="modal" type="button">
                    <i class="fa fa-times"></i>
                    Close Project</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> 
  </c:forEach>