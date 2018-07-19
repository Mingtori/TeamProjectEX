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
/* ul {
	list-style-type: none;
} */
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

dl {
	display: table;
}

dt, dd {
	padding: 0px 5px;
	display: table-cell;
}

#content {
	width: 100%;
}

#reviewform {
	padding: 0px;
}

#reviewInfo {
	color: #666666;
	font-size: small;
}
h5{
	text-align:left;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
    color: #555;
    cursor: default;
    background-color: #fff;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
}
.nav-tabs>li>a {
    margin-right: 2px;
    line-height: 1.42857143;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
}

.nav>li>a {
    position: relative;
    display: block;
    padding: 10px 15px;
}

a.active.show {
	border-bottom-color: transparent;
	background-color:white;
}
ul.nav.nav-tabs {
	border-bottom:1px solid gray;
	margin-bottom:10px;
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

		if (str == 'kids') {
			if (cartqtykids <= prodstock) {
				x = ++cartqtykids;
				y = prodprice * cartqty + kidsprice * x;
				document.getElementById("cartqtykids").value = x;
				document.getElementById("totalprodprice").value = y
						.toLocaleString();
			}
		} else {
			if (cartqty <= prodstock) {
				x = ++cartqty;
				y = prodprice * x + kidsprice * cartqtykids;
				document.getElementById("cartqty").value = x;
				document.getElementById("totalprodprice").value = y
						.toLocaleString();
			}
		}

	}

	function decNum(str) {
		var cartqty, cartqtykids, x, y;
		cartqty = document.getElementById("cartqty").value;
		cartqtykids = document.getElementById("cartqtykids").value;

		if (str == 'kids') {
			if (cartqtykids > 0) {
				x = --cartqtykids;
				y = prodprice * cartqty + kidsprice * x;
				document.getElementById("cartqtykids").value = x;
				document.getElementById("totalprodprice").value = y
						.toLocaleString();
			}
		} else {
			if (cartqty > 0) {
				x = --cartqty;
				y = prodprice * x + kidsprice * cartqtykids;
				document.getElementById("cartqty").value = x;
				document.getElementById("totalprodprice").value = y
						.toLocaleString();
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

		if (_month < 10) {
			_month = '0' + _month
		}

		if (_day < 10) {
			_day = '0' + _day
		}

		_todate = _year + "-" + _month + "-" + _day;

		if (cartqty == 0) {
			alert("수량 1개 이상")
			return false;
		} else if (_enddate < _todate) {
			alert("날짜 초과")
			return false;
		} else if (memid == "") {
			alert("로그인 후 이용")
			location.href = "${pageContext.request.contextPath}/login.me";
			return false;
		} else {
			return true;
		}
	}

	$(function() {
		$("#cart_add").click(function() {

			var str = $("#prodenddate").val();
			var flag = checkDate(str);

			if (flag == true) {
				var param = $("form[name=prodForm]").serialize();
				$.ajax({
					url : "insert.ct",
					type : "post",
					data : param,
					dataType : "text",
					error : function(request, error) {

					},
					success : function() {
						$("#prodModal").modal();
					}
				});
				return false;
			} else {
				return false;
			}
		});
	})

	function gotoCart() {
		location.href = "${pageContext.request.contextPath}/list.ct?memid=${loginfo.memid}";
	}

	function gotoList() {
		location.href = "${pageContext.request.contextPath}/list.prd?pageNumber=${pageNumber}";
	}
	
	 function updateForm(prodid,boardsubject,boardid,pageNumber,content){
	      $("#modal-title").text('문의 수정');
	      $("#boardid").val(boardid);
	      $("label[id=boardsubject]").html('<b>' + boardsubject);
	      $("input[name=prodid]").val(prodid);
	      $("input[name=boardsubject]").val(boardsubject);
	      $("#editcontent").html(content);
	      $("#boardModal").modal();
	   }
</script>
</head>
<body onload="geocode();">
	<section class="bg-light">
	<div class="container">
		<div class="jumbotron" align="center">
			<div align="right">
				<c:if
					test="${loginfo.gradeid == 0 || loginfo.memid == product.memid}">
					<a
						href="update.prd?prodid=${product.prodid }&pageNumber=${pageNumber}">
						<button class="btn btn-default">수정</button>
					</a>
					<a
						href="delete.prd?prodid=${product.prodid }&pageNumber=${pageNumber}"><button
							class="btn btn-default">삭제</button></a>
				</c:if>
				<button class="btn btn-default" onclick="gotoList()">
					<span>상품목록</span>
				</button>
			</div>
			<c:set var="theString"
				value="http://localhost:9090${pageContext.request.contextPath}/resources/${product.prodimage }" />
			<div class="row">
				<div class="col-sm-8 offset-sm-2">
					<form name="prodForm" id="prodForm">
						<input type="hidden" id="pageNumber" name="pageNumber"
							value="${pageNumber}" /> <input type="hidden" id="boardcateid"
							name="boardcateid" value="${boardcateid}" />
						<div>
							<h1>${product.prodname }</h1>
						</div>
						<table width="100%">
							<tr>
								<td rowspan="2" width="40%"  style="vertical-align: top;" >
								<img src=${theString } width="100%;"/></td>
								<td style="padding: 30px;">
									<div>
										<ul class="list-unstyled">
											<li class="list-item">
												<dl>
													<dt>분류</dt>
													<dd>${product.prodcatename }</dd>
												</dl>
											</li>
											<li class="list-item">
												<dl>
													<dt>날짜</dt>
													<dd>${product.prodstartdate }~ ${product.prodenddate }</dd>
												</dl>
											<li class="list-item">
												<dl>
													<dd>가격</dd>
													<dt>
														성인
														<fmt:formatNumber value='${product.prodprice }'
															pattern='###,###' />
														원 <br> 소인
														<fmt:formatNumber value='${product.kidsprice }'
															pattern='###,###' />
														원
													</dt>
												</dl>
											<li class="list-item">
												<dl>
													<dt>장소</dt>
													<dd>${product.memplace }</dd>
												</dl>
											<li class="list-item"><input type="hidden" name="prodid"
												id="prodid" value="${product.prodid }" /> <input
												type="hidden" name="prodstock" id="prodstock"
												value="${product.prodstock }" /> <input type="hidden"
												name="prodcateid" id="prodcateid"
												value="${product.prodcateid }" />
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<td align="right">
									<div>
										<label style="font-size: x-large;">성인</label> <input
											class="btn btn-sm" type="button" value="-"
											onclick="decNum('adults')" /> <input type="number"
											name="cartqty" id="cartqty" min="0"
											max="${product.prodstock }" value="1"
											onchange="chxNum('adults')" /> <input class="btn btn-sm"
											type="button" value="+" onclick="incNum('adults')" />
									</div>
									<div>
										<label style="font-size: x-large;">소인</label> <input
											class="btn btn-sm" type="button" value="-"
											onclick="decNum('kids')" /> <input type="number"
											name="cartqtykids" id="cartqtykids" min="0"
											max="${product.prodstock }" value="0"
											onchange="chxNum('kids')" /> <input class="btn btn-sm"
											type="button" value="+" onclick="incNum('kids')" />
									</div> <input class="form-control col-sm-5" style="border: none;"
									readonly type="text" id="totalprodprice"
									value="<fmt:formatNumber value='${product.prodprice }' pattern='###,###'/>" />
									<br> <br>
									<div>
										<button class="btn btn-default" id="cart_add">
											<span>장바구니 담기</span>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">${product.prodcontent }</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<hr>
			
			<div class="row">
				<div class="col-sm-8 offset-sm-2">
					<div role="tabpanel">
					  <!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
					  <li role="presentation"><a href="#notice" class="active show" id="notice-tab" aria-controls="notice" role="tab" data-toggle="tab" aria-expanded="true"><b>공지사항</b></a></li>
					  <li role="presentation"><a href="#review" id="review-tab" aria-controls="review" role="tab" data-toggle="tab" aria-expanded="false"><b>관람후기</b></a></li>
					  <li role="presentation"><a href="#qna" id="qna-tab"  aria-controls="qna" role="tab" data-toggle="tab" aria-expanded="false"><b>문의하기</b></a></li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active show" id="notice" aria-labelledby="notice-tab">
						<!-- 공지사항 -->
							<form action="insert.bd" method="post">
								<fieldset>
									<input type="hidden" name="boardcateid" value="p01"> <input
										type="hidden" name="prodid" value="${ product.prodid}">
									<input type="hidden" name="memid" value="${loginfo.memid }">
									<input type="hidden" name="prodname" value="${product.prodname }">
									<div class="form-group form-inline">
										<c:if test="${loginfo.memid == product.memid && loginfo != null}">
										<div class="col-sm-1" id="reviewform">
											<label>공지 작성</label>
										</div>
										<div class="col-sm-10" id="reviewform">
											<textarea class="form-control" id="content"
												name="boardcontent" placeholder="내용은 140자까지 작성 가능합니다."
												maxlength="140" rows="2"></textarea>
										</div>
										<div class="col-sm-1" id="reviewform">
											<button type="submit" class="btn btn-primary"
												style="height: 60px; float: left">작성</button>
										</div>
										</c:if>
									</div>
								</fieldset>
							</form>
					
							<table class="table" style="background-color: #f2f2f2">
								<c:if test="${fn:length(noticelist) == 0}">
									<tr>
										<td align="center">공지사항이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${fn:length(noticelist) != 0}">
									<c:forEach var="notice" items="${noticelist }">
										<tr>
											<th>${notice.boardsubject }</th>
											<td align="right" style="font-size: small;" colspan="2"
												id="reviewInfo">작성자 <b>${notice.memid } </b> &#124; 작성일
												<b>${notice.boardinputdate }</b>
												<c:if test="${loginfo.memid == product.memid && loginfo != null}">
				                                    <button type="button" id="update_${notice.boardid}" onclick="updateForm('${notice.prodid }','${notice.boardsubject }','${notice.boardid}','${pageNumber}','${notice.boardcontent }');"><i class="far fa-edit"></i></button>
				                                    <button type="button" id="delete_${notice.boardid}" onclick="location.href='delete.bd?boardid=${notice.boardid}&boardcateid=${notice.boardcateid }&flag=flag&prodid=${notice.prodid }'" ><i class="far fa-trash-alt"></i></button>
				                                 </c:if>
												</td>
										</tr>
										<tr>
											<td colspan="2">${notice.boardcontent }</td>
										</tr>
										<tr>
					
										</tr>
									</c:forEach>
								</c:if>
							</table>
					  </div>
					  <div role="tabpanel" class="tab-pane fade" id="review" aria-labelledby="review-tab">
					  		<form action="insert.bd" method="post">
										<fieldset>
											<input type="hidden" name="boardcateid" value="p03"> <input
												type="hidden" name="prodid" value="${ product.prodid}">
									<input type="hidden" name="memid" value="${loginfo.memid }">
									<input type="hidden" name="prodname" value="${product.prodname }">
									<%-- <div class="form-group form-inline">
										<c:if test="${loginfo != null }">
										<div class="col-sm-1" id="reviewform">
											<label>관람평 작성</label>
										</div>
										<div class="col-sm-10" id="reviewform">
											<textarea class="form-control" id="content"
												name="boardcontent" placeholder="내용은 140자까지 작성 가능합니다."
												maxlength="140" rows="2"></textarea>
										</div>
										<div class="col-sm-1" id="reviewform">
											<button type="submit" class="btn btn-primary"
												style="height: 60px; float: left">작성</button>
										</div>
										</c:if>
										<c:if test="${loginfo == null }">
											<h5 align="center">로그인 후에 이용하실 수 있습니다.</h5>
										</c:if>
									</div> --%>
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
											<td align="right" style="font-size: small;" colspan="2"
												id="reviewInfo">작성자 <b>${review.memid } </b> &#124; 작성일
												<b>${review.boardinputdate }</b>
												<c:if test="${review.memid eq loginfo.memid }">
				                                    <button type="button" id="update_${review.boardid}" onclick="updateForm('${review.prodid }','${review.boardsubject }','${review.boardid}','${pageNumber}','${review.boardcontent }');"><i class="far fa-edit"></i></button>
				                                    <button type="button" id="delete_${review.boardid}" onclick="location.href='delete.bd?boardid=${review.boardid}&boardcateid=${review.boardcateid }&flag=flag&prodid=${review.prodid }'" ><i class="far fa-trash-alt"></i></button>
				                                 </c:if>
												</td>
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
					   <div role="tabpanel" class="tab-pane fade" id="qna" aria-labelledby="qna-tab">
					   	<!-- 문의하기 -->
							<form action="insert.bd" method="post">
								<fieldset>
									<input type="hidden" name="boardcateid" value="p02"> <input
										type="hidden" name="prodid" value="${ product.prodid}">
									<input type="hidden" name="memid" value="${loginfo.memid }">
									<input type="hidden" name="prodname" value="${product.prodname }">
									<div class="form-group form-inline">
										<c:if test="${loginfo != null }">
										<div class="col-sm-1" id="reviewform">
											<label>문의 작성</label>
										</div>
										<div class="col-sm-10" id="reviewform">
											<textarea class="form-control" id="content"
												name="boardcontent" placeholder="내용은 140자까지 작성 가능합니다."
												maxlength="140" rows="2"></textarea>
										</div>
										<div class="col-sm-1" id="reviewform">
											<button type="submit" class="btn btn-primary"
												style="height: 60px; float: left">작성</button>
										</div>
										</c:if>
										<c:if test="${loginfo == null }">
											<h5 align="center">로그인 후에 이용하실 수 있습니다.</h5>
										</c:if>
									</div>
								</fieldset>
							</form>
					
							<table class="table" style="background-color: #f2f2f2">
								<c:if test="${fn:length(qnalist) == 0}">
									<tr>
										<td align="center">문의가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${fn:length(qnalist) != 0}">
									<c:forEach var="qna" items="${qnalist }">
										<tr>
											<th>${qna.boardsubject }</th>
											<td align="right" style="font-size: small;" colspan="2"
												id="reviewInfo">작성자 <b>${qna.memid } </b> &#124; 작성일
												<b>${qna.boardinputdate }</b>
												<c:if test="${qna.memid eq loginfo.memid }">
				                                    <button type="button" id="update_${qna.boardid}" onclick="updateForm('${qna.prodid }','${qna.boardsubject }','${qna.boardid}','${pageNumber}','${qna.boardcontent }');"><i class="far fa-edit"></i></button>
				                                    <button type="button" id="delete_${qna.boardid}" onclick="location.href='delete.bd?boardid=${qna.boardid}&boardcateid=${qna.boardcateid }&flag=flag&prodid=${qna.prodid }'" ><i class="far fa-trash-alt"></i></button>
				                                 </c:if>
												</td>
										</tr>
										<tr>
											<td colspan="2">${qna.boardcontent }</td>
										</tr>
										<tr>
					
										</tr>
									</c:forEach>
								</c:if>
									</table>
					  </div>
					</div>
					</div>
			
			<hr>
			<div>
				<h5>위치</h5>
				<div id="googleMap" style="width:500px;height:380px;"></div>
				<script>
			      var map;
			      function initMap() {
			    	  
			      }
			      function geocode(){
			      		var address = '${product.memplace}';
			      		var geocoder = new google.maps.Geocoder();
			      		geocoder.geocode({'address':address,'partialmatch':true}, geocodeResult);
			      	}
			      	
			      	function geocodeResult(results, status){
			      		if(status == 'OK' && results.length>0){
			      			var lat = results[0].geometry.location.lat();
			      			var lng = results[0].geometry.location.lng()
			      		}else{
			      			alert("error");
			      		}
			      		
			      		var uluru = {'lat': lat, 'lng': lng};
				          var map = new google.maps.Map(document.getElementById('googleMap'), {
				            zoom: 15,
				            center: uluru
				          });
				          var marker = new google.maps.Marker({
				            position: uluru,
				            map: map
				          });
			      	}
			    </script>
			    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDmj9FUZX2-wuXkYBXAHSgTU6erKygdkgQ" async defer></script>
			</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	
	
	<div class="modal" id="prodModal">
		<div class="modal-dialog">
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
					<button type="button" class="btn btn-danger"
						data-dismiss="modal" onclick="gotoCart()">예</button>
					<button type="button" class="btn btn-default"
						data-dismiss="modal">아니오</button>
				</div>
			</div>
		</div>
	</div>
	
	   <!-- board Modal -->
      <div id="boardModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
      
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="modal-title" align="center"></h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form action="update.bd" method="post">
            <div class="modal-body">
               <input type="hidden" id="boardid" name="boardid"/>
               <input type="hidden" name="prodid"/>
               <input type="hidden" id="boardsubject" name="boardsubject"/>
               <input type="hidden" name="flag" value="modal"/>
               <input type="hidden" id="pageNumber" name="pageNumber" value="0"/>
               <div class="row">
	               	<label style="margin-left:15px" id="boardsubject"></label>
               </div>
               <div class="row">
                  <div class="col-sm-1">
                     <label for="boardcontent">내용</label>
                  </div>
                  <div class="col-sm-11">
                     <textarea rows="5" style="width:100%" id="editcontent" name="boardcontent">
                     </textarea>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary" id="update" >수정</button>   
            </div>
            </form>
          </div>
      
        </div>
      </div>
</body>
</html>
<%@ include file="../views/bottom.jsp"%>