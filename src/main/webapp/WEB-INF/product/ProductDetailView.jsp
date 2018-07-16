<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
ul {
	list-style-type: none;
}
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	var prodstock = ${product.prodstock};
	var prodprice = ${product.prodprice};
	var kidsprice = ${product.kidsprice};

	function checkProdstock() {
		var cartqty = document.getElementById("cartqty").value;
		if (prodstock < cartqty) {
			return null;
		}
	}

	function incNum(str) {
		var cartqty, cartqtykids, x, y;
		cartqty = document.getElementById("cartqty").value;
		cartqtykids = document.getElementById("cartqtykids").value;
		
			if(str == 'kids'){
				if(cartqtykids <= prodstock){
					x = ++cartqtykids;
					y = prodprice * cartqty + kidsprice * x;
					document.getElementById("cartqtykids").value = x;
					document.getElementById("totalprodprice").value = y.toLocaleString();
				}
			} else {
				if(cartqty <= prodstock){
					x = ++cartqty;
					y = prodprice * x + kidsprice * cartqtykids;
					document.getElementById("cartqty").value = x;
					document.getElementById("totalprodprice").value = y.toLocaleString();
				}
			}
			
	}

	function decNum(str) {
		var cartqty, cartqtykids, x, y;
		cartqty = document.getElementById("cartqty").value;
		cartqtykids = document.getElementById("cartqtykids").value;
		
		if(str == 'kids'){
			if (cartqtykids > 0){
				x = --cartqtykids;
				y = prodprice * cartqty + kidsprice * x;
				document.getElementById("cartqtykids").value = x;
				document.getElementById("totalprodprice").value = y.toLocaleString();
			}
		} else {
			if (cartqty > 0){
				x = --cartqty;
				y = prodprice * x + kidsprice * cartqtykids;
				document.getElementById("cartqty").value = x;
				document.getElementById("totalprodprice").value = y.toLocaleString();
			}
		}
	}

	function chxNum(str) {
		var cartqty, cartqtykids;
		cartqty = document.getElementById("cartqty").value;
		cartqtykids = document.getElementById("cartqtykids").value;
		var y = prodprice * cartqty + kidsprice * cartqtykids;
		document.getElementById("totalprodprice").value = y.toLocaleString();
	}
	
	function checkDate(str) {
		
		
		var cartqty = document.getElementById("cartqty").value;
		var memid = "${loginfo.gradeid}";
		// 예매 날짜 확인
		var _enddate = str
		var _todate = new Date();
		var _year = _todate.getFullYear();
		var _month = _todate.getMonth() + 1;
		var _day = _todate.getDate();
		
		if(_month < 10) {
			_month = '0' + _month
		}
		
		if(_day < 10) {
			_day = '0' + _day
		}
		
		_todate = _year + "-" + _month + "-" + _day;
		
		if(cartqty  == 0){
			alert("수량 1개 이상")
			return false;
		} else if(_enddate < _todate) {
			alert("날짜 초과")
			return false;
		} else if(memid == ""){
			alert("로그인 후 이용")
			location.href = "${pageContext.request.contextPath}/login.me";
			return false;
		} else {
			return true;
		}
	}
	
	$(function(){
		$("#cart_add").click(function(){
			
			 var str = $("#prodenddate").val();	
			 var flag = checkDate(str);

			 if(flag == true){
				 var param = $("form[name=prodForm]").serialize();
				 $.ajax({
					url : "insert.ct",
					type : "post",
					data : param,
					dataType : "text",
					error : function(request, error){
						
					},
					success : function(){
						$("#prodModal").modal();
					} 
				});
				 return false;
			 } else {
				 return false;
			 }
		});
	})

	function gotoCart(){
		location.href = "${pageContext.request.contextPath}/list.ct?memid=${loginfo.memid}";
	}
	
	function gotoList(){
		location.href = "${pageContext.request.contextPath}/list.prd?pageNumber=${pageNumber}";
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
				<button class="btn btn-default">수정</button></a>
			<a href="delete.prd?prodid=${product.prodid }&pageNumber=${pageNumber}"><button class="btn btn-default">삭제</button></a>
			</c:if>
			<button class="btn btn-default" onclick="gotoList()"><span>상품목록</span></button>
		</div>
		<c:set var="theString"
			value="http://localhost:9090${pageContext.request.contextPath}/resources/${product.prodimage }" />
		<form name = "prodForm" id = "prodForm">
			<input type = "hidden" id = "pageNumber" name = "pageNumber" value = "${pageNumber}"/>
			<input type = "hidden" id = "boardcateid" name = "boardcateid" value = "${boardcateid}"/>
			<div>
				<h1>${product.prodname }</h1>
			</div>
			<table>
				<tr>
					<td width="50%"><img src=${theString } width="100%" /></td>
					<td><div>
							<ul>
								<li>
									<dl>
										<dd>장소</dd>
										<dt>${product.memplace } </dt>
									</dl>
								<li>
									<dl>
										<dd>분류</dd>
										<dt>${product.prodcatename } </dt>
									</dl>
								<li>
									<dl>
										<dd>날짜</dd>
										<dt>${product.prodstartdate } ~ ${product.prodenddate }  
										<input type = "hidden" name = "prodenddate" id = "prodenddate" value = "${product.prodenddate }"></dt>
									</dl>
								<li>
									<dl>
										<dd>가격</dd>
										<dt>성인 <fmt:formatNumber value='${product.prodprice }' pattern='###,###' /> 원 
											<br> 소인 <fmt:formatNumber value='${product.kidsprice }' pattern='###,###' /> 원 
										</dt>
									</dl>
								<li>
									<dl>
										<dd>소개</dd>
										<dt>${product.prodcontent } <input type="hidden"
							name="prodid" id="prodid" value="${product.prodid }" /> <input
							type="hidden" name="prodstock" id="prodstock"
							value="${product.prodstock }" /> <input type="hidden"
							name="prodcateid" id="prodcateid" value="${product.prodcateid }" /></dt>
									</dl>
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
						<div>
							<label style = "font-size:x-large;">성인</label>
							<input class= "btn btn-sm" type="button" value="-" onclick="decNum('adults')" /> 
							<input type="number" name="cartqty" id="cartqty" min="0" max="${product.prodstock }" value="1" onchange="chxNum('adults')" /> 
							<input class= "btn btn-sm" type="button" value="+" onclick="incNum('adults')" /> 
						</div>
						<div>
							<label style = "font-size:x-large;">소인</label>
							<input class= "btn btn-sm" type="button" value="-" onclick="decNum('kids')" /> 
							<input type="number" name="cartqtykids" id="cartqtykids" min="0" max="${product.prodstock }" value="0" onchange="chxNum('kids')" /> 
							<input class= "btn btn-sm" type="button" value="+" onclick="incNum('kids')" /> 
						</div>
						<input style = "border:none;" readonly type="text" id="totalprodprice"
							value="<fmt:formatNumber value='${product.prodprice }' pattern='###,###'/>" />
						<br>
						<br>
						<div>
						<button class="btn btn-default" id="cart_add" ><span>장바구니 담기</span></button>
						</div>
						<div class="modal" id = "prodModal">
							<div class = "modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">장바구니 담기</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body" align="center">
							          	<h5>상품이 장바구니에 담겼습니다.</h5>
							          <br> 바로 확인 하시겠습니까?
							        </div>
							         <div class="modal-footer">
							          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="gotoCart()">예</button>
							          <button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
							        </div>
								</div>
							</div>
						</div>
							
					</div>
				</td>
				</tr>
			</table>
		</form>
		<hr>
		<!-- 후기게시판 -->
		<div>
		<button type="button" class="btn btn-default btn-lg" data-toggle="collapse" data-target="#demo">관람후기</button>
		<div id="demo" class="collapse">
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
	</div>
	</div>
	</section>
</body>
</html>
<%@ include file="../views/bottom.jsp"%>