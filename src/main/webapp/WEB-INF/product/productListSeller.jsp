<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../page/mytop.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.container{
		max-width:70%;
	}
</style>
	<div align="right">
		<a href = "insert.prd">상품 추가</a>
	</div> 
	<div> 
		<form action = "listSeller.prd" method = "GET">
			<div class="form-group form-inline">
				<select class="form-control" name = "whatColumn" id = "whatColumn">
					<option value = "all">전체</option>
					<option value = "prodname">제목</option>
					<option value = "prodcontent">내용</option>
				</select> 
				<input class="form-control" type = "text" name = "keyword" id = "keyword">
				<input class="btn btn-default" type = "submit" value = "검색"/> 
			</div>
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
					기간 : ${fn:substring(product.prodstartdate,0,10) } ~ ${fn:substring(product.prodenddate,0,10) } 
					<br>가격 : <fmt:formatNumber pattern="###,###" value="${product.prodprice }"/> 원
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
<%@ include file="../page/mybottom.jsp" %>