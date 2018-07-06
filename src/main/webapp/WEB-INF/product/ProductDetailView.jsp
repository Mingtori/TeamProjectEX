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
	function comma(num){
		var len, point, str;
		
		num = num + "";
		len = num.length;
		point = len % 3;
		
		str = num.substring(0, point);
		while(point < len){
			if(str != "")
				str += ",";
			str += num.substring(point, point + 3);
			point  += 3;
		}
		return str;
	}
	
	function comma2(num){
		return x.toString().replace(/\B(?=(\d{3})+(?!\d)/g, ",");
	}
	
	function checkProdstock(){
		var orderNum = document.getElementById("orderNum").value;
		var prodstock = ${product.prodstock};
		if(prodstock < orderNum){
			alert("!!")
			return null;
		}
	}
	
	function addNum(){
		var orderNum = document.getElementById("orderNum").value;
		console.log(orderNum)
		var x = (Number)orderNum + 1;
		console.log(x)
		//documemt.getElementById("orderNum").innerHTML = x;
	}
</script>
</head>
<body>
ProductDetailView.jsp
<br><a href = "update.prd?prodid=${product.prodid }&pageNumber=${pageNumber}">수정</a>
<a href = "delete.prd?prodid=${product.prodid }&pageNumber=${pageNumber}">삭제</a>
<a href = "list.prd?pageNumber=${pageNumber}">돌아가기
</a>
<c:set var="theString" 
value=
"http://localhost:9090${pageContext.request.contextPath}/resources/${product.prodimage }"/>

<h1>${product.prodname }</h1>
<form name = "ProdUpdateForm" action = "upaateCart" method = "GET">
<img src = ${theString } width="300" />
<br>Date : ${product.prodstartdate } ~ ${product.prodenddate }
<br>Price : ${product.prodprice }
<br>category : ${product.prodcatename }
<br>
<!-- <input type = "button" value = "Add" onclick = "addNum()" /> -->
<input type = "number" name = "orderNum" id = "orderNum" min = "1" max = "${product.prodstock }"/>
<input type = "hidden" name = "prodid" value = "${product.prodid }"/>
<input type = "submit" value = "주문"/> 
(재고량 : ${product.prodstock })
</form>

<br><br>content : ${product.prodcontent }
<input type = "hidden" name = "prodid" id = "prodid"  value = "${product.prodid }"/>
<input type = "hidden" name = "prodcateid" id = "prodcateid"  value = "${product.prodcateid }"/>
<br>
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