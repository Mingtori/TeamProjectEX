<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../page/mytop.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
td a {
	color:blue;
} 
</style>

	<div align="center"> 
		<form class="form-inline" action = "listSeller.prd" method = "GET">
			<select class="form-control" name = "whatColumn" id = "whatColumn">
				<option value = "all">전체</option>
				<option value = "prodname">제목</option>
				<option value = "prodcontent">내용</option>
			</select> 
			<input class="form-control" type = "text" name = "keyword" id = "keyword">
			<input type = "hidden" name = "memid" id = "memid" value = "${loginfo.memid}">
			<input class="btn btn-default" type = "submit" value = "검색"/> 
		</form>
	</div>
	<div align="right">
		<a href = "insert.prd"><input class="btn btn-primary" type = "button" value = "추가"></a>
	</div> 
	<table class="table">
			<c:forEach items="${sellist }" var="product">
			<tr>
			<c:set var="prodimage"
				value="http://localhost:9090${pageContext.request.contextPath}/resources/${product.prodimage }" />
					<td rowspan="3">
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
						<br>가격 : <fmt:formatNumber value='${product.prodprice }' pattern='###,###'/>
						<br>장소 : ${product.memplace }
						<br>카테고리 : ${product.prodcatename } 
					</td>
				</tr>
				<tr>
					<td align="right">
						<a
						href="update.prd?prodid=${product.prodid }&pageNumber=1&seller=true">
						<button class="btn btn-default">수정</button>
					</a>
					<a
						href="delete.prd?prodid=${product.prodid }&pageNumber=1&seller=true">
						<button class="btn btn-default">삭제</button></a>
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