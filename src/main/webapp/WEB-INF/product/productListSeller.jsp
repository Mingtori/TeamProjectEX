<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../page/mytop.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.container{
		max-width:70%;
	}
</style>
</head>
<body>
	<br><a href = "insert.prd">상품 추가</a>
	<div> 
		<form action = "listSeller.prd" method = "GET">
			<select name = "whatColumn" id = "whatColumn">
				<option value = "all">전체</option>
				<option value = "prodname">제목</option>
				<option value = "prodcontent">내용</option>
			</select> 
			<input class="form-control" type = "text" name = "keyword" id = "keyword">
			<input class="btn btn-default" type = "submit" value = "검색"/> 
		</form>
	</div>
	<table>
			<c:forEach items="${sellist }" var="product">
			<tr>
			<c:set var="prodimage"
				value="http://localhost:9090${pageContext.request.contextPath}/resources/${product.prodimage }" />
				<td rowspan="2">
					<a href = "detail.prd?prodid=${product.prodid }&pageNumber=${pageInfo.pageNumber}&boardcateid=p03">
					<img src = ${prodimage } width="200"/> </a>
				</td>
				<td>
					<h4><a href = "detail.prd?prodid=${product.prodid }&pageNumber=${pageInfo.pageNumber}&boardcateid=p03">
					${product.prodname }</a></h4>
				</td>
			</tr>
			<tr>
				<td>
					기간 : ${product.prodstartdate } ~ ${product.prodenddate } 
					<br>가격 : ${product.prodprice } 
					<br>장소 : 
					<br>카테고리 : ${product.prodcatename } 
				</td>
			</tr>
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
<%@ include file="../page/mybottom.jsp" %>