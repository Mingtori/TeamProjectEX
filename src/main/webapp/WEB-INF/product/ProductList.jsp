<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	ProductList.jsp
	<br> 상품리스트화면
	<br><a href = "insert.prd">상품 추가</a>
	<div> 
		<form action = "list.prd" method = "GET">
			<select name = "whatColumn" id = "whatColumn">
				<option value = "all">전체</option>
				<option value = "prodname">제목</option>
				<option value = "prodcontent">내용</option>
			</select> 
			<input type = "text" name = "keyword" id = "keyword">
			<input type = "submit" value = "검색"/> 
		</form>
	</div>
	<table>
		<tr>
			<c:forEach items="${product }" var="product">
			<c:set var="prodimage"
				value="http://localhost:9090${pageContext.request.contextPath}/resources/${product.prodimage }" />
				<td>
					<a href = "detail.prd?prodid=${product.prodid }&pageNumber=${pageInfo.pageNumber}&boardcateid=p03">
					<img src = ${prodimage } width="200"/> </a>
					<h4><a href = "detail.prd?prodid=${product.prodid }&pageNumber=${pageInfo.pageNumber}&boardcateid=p03">
					${product.prodname }</a></h4>
					<br>Date : ${product.prodstartdate } ~ ${product.prodenddate } 
					<br>Price : ${product.prodprice } 
					<br>category : ${product.prodcatename } 
				</td>
				<c:if test="${product.rownum%3 == 0 }">
					<tr></tr>
				</c:if>
			</c:forEach>
	</table>
	<center>
	${pageInfo.pagingHtml}
	</center>	
</body>
</html>