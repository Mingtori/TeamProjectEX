<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ include file="../views/top.jsp"%>
<head>
<script type="text/javascript">
	function goback() {
		history.back(-1);
	}
	function duplicateID() {

	}
</script>
<style>
.jumbotron {
	background-color: #F2F2F2;
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
<body>
	<section class="bg-light">
		<div class="container">
				<div class="jumbotron" align="center">
					<h1>상품수정화면</h1>
						<form:form commandName="product" method="post" action="update.prd" enctype="multipart/form-data">
						<div>
							<label for="prodname" class="form-inline">상품명</label>
							<input type = "text" name = "prodname" id = "prodname" value = "${product.prodname }" class="form-control"/>
							<form:errors cssClass="err" path="prodname" />
						</div>
						<div>
							<label for="prodimage" class="form-inline">이미지</label>
							<div align="left">
								<image src = "${pageContext.request.contextPath}/resources/${product.prodimage }" width = "100"/>
							</div>
							<input type = "file" name = "upload" id = "upload" class="form-control"/>
							<form:errors cssClass="err" path="prodimage" />
						</div>
						<div>
							<label for="prodstartdate" class="form-inline">시작일자</label>
							<input type = "date" name = "prodstartdate" id = "prodstartdate" value = "${product.prodstartdate}" class="form-control"/>
							<form:errors cssClass="err" path="prodstartdate" />
						</div>
						<div>
							<label for="prodenddate" class="form-inline">종료일자</label>
							<input class="form-control" type = "date" name = "prodenddate" id = "prodenddate" value = "${product.prodenddate}"/>
							<form:errors cssClass="err" path="prodenddate" />
						</div>
						<div>
							<label for="prodplace" class="form-inline">위치</label>
							<input class="form-control" type = "text" name = "prodplace" id = "prodplace" value ="${product.prodplace }"/>
						</div>
						<div>
							<label for="prodstock" class="form-inline">수량</label>
							<input class="form-control" type = "text" name = "prodstock" id = "prodstock" placeholder="수량" value = "${product.prodstock}"/>
						</div>
						<div>
							<label for="prodprice" class="form-inline">가격</label>
							<input class="form-control" type = "text" name = "prodprice" id = "prodprice" placeholder="가격" value = "${product.prodprice}"/>
						</div>
						<div>
							<label for="prodcateid" class="form-inline">카테고리</label>
							<select class="form-control" name = "prodcateid" id = "prodcateid">
								<c:forEach items="${categoryList }" var = "category">
									<option value ="${category.prodcateid }" 
										<c:if test ="${product.prodcateid eq category.prodcateid}"> selected </c:if>>
											[${category.prodcateid }]${category.prodcatename }
								</c:forEach>
							</select>
							<form:errors cssClass="err" path="prodcateid" />
						</div>
						<div>
							<label for="prodcontent" class="form-inline">상세정보</label>
						<br><textarea class="form-control" name = "prodcontent" id = "prodcontent" rows="" cols="">${product.prodcontent}</textarea>
							<form:errors cssClass="err" path="prodcontent" />
						</div>
						<div>
							<input type = "hidden" id ="prodid" name = "prodid" value = "${product.prodid }" />
							<input type = "hidden" name = "upload2" id = "upload2" value = "${product.prodimage }"/>
							<input type = "submit" value = "수정하기"/>
						</div>	
						</form:form>
					</div>
				</div>
		</section>
	</body>


	<%@ include file="../views/bottom.jsp"%>