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
.jumbotron {
	background-color: #F2F2F2;
	background-color: rgba(242, 242, 242, 0.8);
	color:black;
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
input[type=text], input[type=date] {
	width: 100%;
}
textarea {
	width: 100%;
}
</style>
</head>
<body>

	<h1>상품추가</h1>
		<form:form commandName="product" method="post" action="insert.prd" enctype="multipart/form-data">
		<div style="display: block;">
			<label class="form-inline" for="prodname">상품명</label>
			<input class="form-control" type = "text" name = "prodname" id = "prodname" placeholder="상품명"/>
			<form:errors cssClass="err" path="prodname" />
		</div>
		<div>
			<label class="form-inline" for="prodimage">이미지</label>
			<input class="form-control" type = "file" name = "upload" id = "upload"/>
			<form:errors cssClass="err" path="prodimage" />
		</div>
		<div>
			<label class="form-inline" for="prodstartdate">시작일자</label>
			<input class="form-control" type = "date" name = "prodstartdate" id = "prodstartdate"/>
			<form:errors cssClass="err" path="prodstartdate" />
		</div>
		<div>	
			<label class="form-inline" for="prodenddate">종료일자</label>
			<input class="form-control" type = "date" name = "prodenddate" id = "prodenddate"/>
			<form:errors cssClass="err" path="prodenddate" />
		</div>
		<div>
			<label class="form-inline" for="prodplace">장소</label>
			<input class="form-control" type = "text" name = "prodplace" id = "prodplace" placeholder ="장소"/>
		</div>
		<div>
			<label class="form-inline" for="prodstock">수량</label>
			<input class="form-control" type = "text" name = "prodstock" id = "prodstock" placeholder="수량"/>
		</div>
		<div>
			<label class="form-inline" for="prodprice">가격</label>
			<input class="form-control" type = "text" name = "prodprice" id = "prodprice" placeholder="가격"/>
		</div>
		<div>
			<label class="form-inline" for="prodcateid">카테고리</label>
			<select class="form-control" name = "prodcateid" id = "prodcateid">
				<c:forEach items="${categoryList }" var = "category">
					<option value ="${category.prodcateid }">[${category.prodcateid }]${category.prodcatename }
				</c:forEach>
			</select>
			<form:errors cssClass="err" path="prodcateid" />
		</div>
		<div>
			<label class="form-inline" for="prodcontent">상세정보</label><br>
			<textarea class="form-control" name = "prodcontent" id = "prodcontent" rows="" cols="" placeholder = "상품상세내용"></textarea>
			<form:errors cssClass="err" path="prodcontent" />
		</div>
		<div align="center">
			<input type = "submit" value = "추가하기"/>
		</div>	
		</form:form>
</body>
</html>
<%@ include file="../page/mybottom.jsp" %>