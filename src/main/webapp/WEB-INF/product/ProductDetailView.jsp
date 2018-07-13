<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../views/top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.jumbotron {
	background-color: rgba(242, 242, 242, 0.8);
}

.form-inline label, .form-inline>.form-control {
	display: inline-block;
}

.font-black {
	color: black;
}

a {
	color: black;
}

@media ( min-width : 768px) {
	section {
		background-image: url("./resources/img/header-bg.jpg");
		background-repeat: no-repeat;
		background-attachment: scroll;
		background-position: center center;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}
}
</style>
<script type="text/javascript">
var prodstock = ${product.prodstock};

function checkProdstock() {
	var cartqty = document.getElementById("cartqty").value;
	if (prodstock < cartqty) {
		return null;
	}
}

function incNum() {
	var cartqty = document.getElementById("cartqty").value;
	var prodprice = ${product.prodprice}
	;
	var x = ++cartqty;
	var y = prodprice * x;
	if (x <= prodstock) {
		document.getElementById("cartqty").value = x;
		document.getElementById("totalprodprice").value = y
				.toLocaleString();
	}
}

function decNum() {
	var cartqty = document.getElementById("cartqty").value;
	var prodprice = ${product.prodprice};
	var x = --cartqty;
	var y = prodprice * x;
	if (x >= 1) {
		document.getElementById("cartqty").value = x;
		document.getElementById("totalprodprice").value = y
				.toLocaleString();
	}
}

function chxNum() {
	var cartqty = document.getElementById("cartqty").value;
	var prodprice = ${product.prodprice};
	var y = prodprice * cartqty;
	document.getElementById("totalprodprice").value = y.toLocaleString();
}
</script>
</head>
<body>
	<section class="bg-light">
	<div class="container">
	<div class="jumbotron" align="center">
		<div align="right">
			<c:if test="${loginfo.gradeid == 0 || loginfo.memid == product.memid}">
			<a href="update.prd?prodid=${product.prodid }&pageNumber=${pageNumber}">
				<button>수정</button></a>
			<a href="delete.prd?prodid=${product.prodid }&pageNumber=${pageNumber}"><button>삭제</button></a>
			</c:if>
			<a href="list.prd?pageNumber=${pageNumber}"><button>상품목록</button> </a>
		</div>
		<c:set var="theString"
			value="http://localhost:9090${pageContext.request.contextPath}/resources/${product.prodimage }" />

		<form name="ProdUpdateForm" action="insert.ct" method="GET">
			<div>
				<h1>${product.prodname }</h1>
			</div>
			<table>
				<tr>
					<td width="50%"><img src=${theString } width="100%" /></td>
					<td><div>
							<ul >
								<li>분류 : ${product.prodcatename } 
								<li>날짜 : ${product.prodstartdate } ~ ${product.prodenddate } 
								<li>가격 : 성인 <fmt:formatNumber value='${product.prodprice }' pattern='###,###' /> 원 
								<li>장소 : ${product.memplace } 
								<li>소개 : ${product.prodcontent } <input type="hidden"
							name="prodid" id="prodid" value="${product.prodid }" /> <input
							type="hidden" name="prodstock" id="prodstock"
							value="${product.prodstock }" /> <input type="hidden"
							name="prodcateid" id="prodcateid" value="${product.prodcateid }" />
							</ul>
				</div></td>
			</tr>
			<tr>	
			<td>
				<div>
				
				</div>
			</td>
				<td>
					<div align="right">
				<label style = "font-size:x-large;">성인</label>
				<input type="button" value="-" onclick="decNum()" /> 
				<input type="number" name="cartqty" id="cartqty" min="1" max="${product.prodstock }" value="1" onchange="chxNum()" /> 
				<input type="button" value="+" onclick="incNum()" /> 
				<br><input style = "border:none;" readonly type="text" id="totalprodprice"
					value="<fmt:formatNumber value='${product.prodprice }' pattern='###,###'/>" />
				<br><input type="submit" value="장바구니" /> 
			</div>
				</td>
				</tr>
			</table>

		</form>
		<hr>
		<!-- 후기게시판 -->
		<h3>관람후기</h3>
		<form action="insert.bd" method="post">
			<input type="hidden" name="boardcateid" value="p03"> <input
				type="hidden" name="prodid" value="${ product.prodid}"> <input
				type="hidden" name="memid" value="${loginfo.memid }">
			<table>
				<tr>
					<td ><input type="text" name="boardsubject" placeholder="제목">
					</td>
				</tr>
				<tr>
					<td ><input type="text" name="boardcontent"
						placeholder="내용"></td>
				</tr>
				<tr>
					<td align="center"><input type="submit" value="글쓰기"></td>
				</tr>
			</table>
		</form>
		
		<table>
			<tr><td></td></tr>
			<c:if test="${fn:length(reviewlist) == 0}">
				<tr>
					<td align="center">후기가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${fn:length(reviewlist) != 0}">
				<c:forEach var="review" items="${reviewlist }">
					<tr>
						<td>${review.boardsubject }</td>
						<td align="right"><a href="">더보기</a></td>
					</tr>
					<tr>
						<td colspan="2">${review.boardcontent }</td>
					</tr>
					<tr>
						<td colspan="2">조회 ${review.boardreadcount } 작성자
							${review.memid } 작성일 ${review.boardinputdate }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	</div>
	</section>
</body>
</html>
<%@ include file="../views/bottom.jsp"%>