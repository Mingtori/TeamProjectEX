<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	productRegisterForm.jsp
	<form:form commandName="product" method="post" action="insert.prd" enctype="multipart/form-data">
	<h1><span>상품 추가 화면</span></h1>
	<p>
		<label for="prodname">상품명</label>
		<input type = "text" name = "prodname" id = "prodname" placeholder="상품명"/>
		<form:errors cssClass="err" path="prodname" />
	</p>
	<p>
		<label for="prodimage">이미지</label>
		<input type = "file" name = "upload" id = "upload"/>
		<form:errors cssClass="err" path="prodimage" />
	</p>
	<p>
		<label for="prodstartdate">시작일자</label>
		<input type = "date" name = "prodstartdate" id = "prodstartdate"/>
		<form:errors cssClass="err" path="prodstartdate" />
		<label for="prodenddate">종료일자</label>
		<input type = "date" name = "prodenddate" id = "prodenddate"/>
		<form:errors cssClass="err" path="prodenddate" />
	</p>
	<p>
		<label for="location">위치</label>
		<input type = "text" name = "location" id = "location" value ="예술의 전당"/>
	</p>
	<p>
		<label for="prodstock">수량</label>
		<input type = "text" name = "prodstock" id = "prodstock" placeholder="수량"/>
		<label for="prodprice">가격</label>
		<input type = "text" name = "prodprice" id = "prodprice" placeholder="가격"/>
	</p>
	<p>
		<label for="prodcateid">카테고리</label>
		<select name = "prodcateid" id = "prodcateid">
			<c:forEach items="${categoryList }" var = "category">
				<option value ="${category.prodcateid }">[${category.prodcateid }]${category.prodcatename }
			</c:forEach>
		</select>
		<form:errors cssClass="err" path="prodcateid" />
	</p>
	<p>
		<label for="prodcontent">상세정보</label>
		<textarea name = "prodcontent" id = "prodcontent" rows="" cols="" placeholder = "상품상세내용"></textarea>
		<form:errors cssClass="err" path="prodcontent" />
	</p>
	<p>
		<input type = "submit" value = "추가하기"/>
	</p>	
	</form:form>
</body>
</html>