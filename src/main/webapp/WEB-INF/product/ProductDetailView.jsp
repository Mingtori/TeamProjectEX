<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	var prodstock = ${product.prodstock};
	
	function checkProdstock(){
		var cartqty = document.getElementById("cartqty").value;
		if(prodstock < cartqty){
			return null;
		}
	}
	
	function incNum(){
		var cartqty = document.getElementById("cartqty").value;
		var prodprice = ${product.prodprice};
		var x = ++cartqty;
		var y = prodprice * x;
		if(x <= prodstock){
			document.getElementById("cartqty").value = x;
			document.getElementById("totalprodprice").value = y.toLocaleString();
		}
	}
	
	function decNum(){
		var cartqty = document.getElementById("cartqty").value;
		var prodprice = ${product.prodprice};
		var x = --cartqty;
		var y = prodprice * x;
		if(x >= 1){
			document.getElementById("cartqty").value = x;
			document.getElementById("totalprodprice").value = y.toLocaleString();
		}
	}
	
	function chxNum(){
		var cartqty = document.getElementById("cartqty").value;
		var prodprice = ${product.prodprice};
		var y = prodprice * cartqty;
		document.getElementById("totalprodprice").value = y.toLocaleString();
	}
</script>
</head>
<body>
ProductDetailView.jsp
<br><a href = "update.prd?prodid=${product.prodid }&pageNumber=${pageNumber}">수정</a>
<a href = "delete.prd?prodid=${product.prodid }&pageNumber=${pageNumber}">삭제</a>
<a href = "list.prd?pageNumber=${pageNumber}">상품목록
</a>
<c:set var="theString" 
value=
"http://localhost:9090${pageContext.request.contextPath}/resources/${product.prodimage }"/>

<form name = "ProdUpdateForm" action = "insert.ct" method = "GET">
	<h1>${product.prodname }</h1>
			<img src = ${theString } width="300" />
				<br>Date : ${product.prodstartdate } ~ ${product.prodenddate }
				<br>Price : <fmt:formatNumber value='${product.prodprice }' pattern='###,###'/> 원
				<br>category : ${product.prodcatename }
				<br>
				<input type = "button" value = "+" onclick = "incNum()" />
				<input type = "button" value = "-" onclick = "decNum()" />
				<input type = "number" name = "cartqty" id = "cartqty" min = "1" max = "${product.prodstock }" value="1" onchange="chxNum()"/>
				<input type = "submit" value = "장바구니"/> 
				<br> 총 금액
				
			<input type = "text" id = "totalprodprice" value = "<fmt:formatNumber value='${product.prodprice }' pattern='###,###'/>">
	<br><br>content : ${product.prodcontent }
	<input type = "hidden" name = "prodid" id = "prodid"  value = "${product.prodid }"/>
	<input type = "hidden" name = "prodstock" id = "prodstock"  value = "${product.prodstock }"/>
	<input type = "hidden" name = "prodcateid" id = "prodcateid"  value = "${product.prodcateid }"/>
	<br>
</form>
	<!-- 후기게시판 -->
	<form action="insert.bd" method="post">
		<input type="hidden" name="boardcateid" value="p03">
		<input type="hidden" name="prodid" value="${ product.prodid}">
		<input type="hidden" name="memid" value="${loginfo.memid }">
		<table>
			<tr>
				<td>
					<input type="text" name="boardsubject" placeholder="제목">
				</td>
				<td align="right">
					<input type="submit" value="글쓰기">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" name="boardcontent" placeholder="내용">
				</td>
			</tr>
		</table>
	</form>
	<table border="1">
		<c:if test="${fn:length(reviewlist) == 0}">
			<tr>
				<td align="center">
					후기가 없습니다.	
				</td>
			</tr>
		</c:if>
		<c:if test="${fn:length(reviewlist) != 0}">
		<c:forEach var="review" items="${reviewlist }">
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
</body>
</html>