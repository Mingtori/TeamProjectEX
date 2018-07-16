<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../views/top.jsp"%>

<style>
.jumbotron {
	background-color: #fff;
	
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
dl{
    display: table;
}
dt,dd{ 
	padding: 0px 5px;
    display: table-cell;   
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
<style>
#content{
	width:100%;
 
}
#reviewform{
	padding:0px;
}

#reviewInfo{
	color:#666666;
	font-size: small;

}
#dl-horizontal{

}
</style>
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
		<div class="row">
			<div class="col-sm-8 offset-sm-2">
				<form name="ProdUpdateForm" action="insert.ct" method="GET">
			<div style="margin-bottom: 30px;">
				<h1>${product.prodname }</h1>
			</div>
			<table width="100%">
				<tr>
					<td rowspan="2" width="40%"><img src=${theString } width="100%" /></td>
					<td style="padding:30px;">
						<div>
							<ul class="list-unstyled">
								<li class="list-item">
								<dl>
									<dt>분류</dt>
									<dd> ${product.prodcatename }</dd>
								</dl>
								</li>
								<li class="list-item">
								<dl>
									<dt>날짜 </dt>
									<dd> ${product.prodstartdate } ~ ${product.prodenddate }</dd>
								</dl>
								<li class="list-item">
								<dl>
									<dt>가격 </dt>
									<dd>성인 <fmt:formatNumber value='${product.prodprice }' pattern='###,###' /> 원</dd>
								</dl> 
								<li class="list-item">
								<dl>
									<dt>장소</dt>
									<dd> ${product.memplace }</dd>
								</dl> 
								<li class="list-item">
								
								<input type="hidden" name="prodid" id="prodid" value="${product.prodid }" />
								<input type="hidden" name="prodstock" id="prodstock" value="${product.prodstock }" />
								<input type="hidden" name="prodcateid" id="prodcateid" value="${product.prodcateid }" />
							</ul>
					</div>
				</td>
				</tr>
				<tr>
					<td align="right">
					<label style = "font-size:x-large;">성인</label>
					<input type="button" value="-" onclick="decNum()" /> 
					<input type="number" name="cartqty" id="cartqty" min="1" max="${product.prodstock }" value="1" onchange="chxNum()" /> 
					<input type="button" value="+" onclick="incNum()" /> 
					<br><input style = "border:none;" readonly type="text" id="totalprodprice"
						value="<fmt:formatNumber value='${product.prodprice }' pattern='###,###'/>" />
					<br><input type="submit" value="장바구니" /> 
					</td>
				</tr>
				<tr>
				<td colspan="2">
				${product.prodcontent }
				</td>
				</tr>
				<%-- <tr>
				<td colspan="3" align="right">
				<label style = "font-size:x-large;">성인</label>
				<input type="button" value="-" onclick="decNum()" /> 
				<input type="number" name="cartqty" id="cartqty" min="1" max="${product.prodstock }" value="1" onchange="chxNum()" /> 
				<input type="button" value="+" onclick="incNum()" /> 
				<br><input style = "border:none;" readonly type="text" id="totalprodprice"
					value="<fmt:formatNumber value='${product.prodprice }' pattern='###,###'/>" />
				<br><input type="submit" value="장바구니" /> 
				</td>
				</tr> --%>
			
			</table>
		</form>
			</div>
		</div>
				<hr>
		<!-- 후기게시판 -->
		<div class="row">
			<div class="col-sm-8 offset-sm-2">
				<form action="insert.bd" id="review" method="post">
				<fieldset>
				<legend>관람 후기</legend>
					<input type="hidden" name="boardcateid" value="p03"> 
					<input type="hidden" name="prodid" value="${ product.prodid}">
					<input type="hidden" name="memid" value="${loginfo.memid }">
					<div class="form-group form-inline">
						<div class="col-sm-1" id="reviewform">
							<label>관람평 작성</label>
						</div>
						<div class="col-sm-10" id="reviewform">
							<textarea class="form-control" id="content"name="boardcontent" placeholder="내용은 140자까지 작성 가능합니다." maxlength="140" rows="2" ></textarea>
						</div>
						<div class="col-sm-1" id="reviewform">
							<button type="submit" class="btn btn-primary" style="height:60px; float: left">작성</button>
						</div>
					</div>
				</fieldset>
				</form>
				
				<table class="table" style="background-color: #f2f2f2">
					<c:if test="${fn:length(reviewlist) == 0}">
						<tr>
							<td align="center">후기가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${fn:length(reviewlist) != 0}">
						<c:forEach var="review" items="${reviewlist }">
							<tr>
								<th>${review.boardsubject }</th>
								<td align="right" style="font-size: small;" colspan="2" id="reviewInfo">작성자 <b>${review.memid } </b> &#124; 작성일 <b>${review.boardinputdate }</b></td>
							</tr>
							<tr>
								<td colspan="2">${review.boardcontent }</td>
							</tr>
							<tr>
								
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</div>
	</div>
	</section>
</body>
</html>
<%@ include file="../views/bottom.jsp"%>