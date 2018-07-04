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
	productUpdateForm.jsp
	<form:form commandName="product" method="post" action="update.prd" enctype="multipart/form-data">
	<h1><span>[${product.prodid }]번 상품 수정 화면</span></h1>
	<p>
		<label for="prodname">상품명</label>
		<input type = "text" name = "prodname" id = "prodname" value = "${product.prodname }"/>
		<form:errors cssClass="err" path="prodname" />
	</p>
	<p>
		<label for="prodimage">이미지</label>
		<image src = "${pageContext.request.contextPath}/resources/${product.prodimage }" width = 100 />
		<input type = "file" name = "upload" id = "upload"/>
		<form:errors cssClass="err" path="prodimage" />
	</p>
	<p>
		<label for="prodstartdate">시작일자</label>
		<input type = "date" name = "prodstartdate" id = "prodstartdate" value = "${product.prodstartdate}"/>
		<form:errors cssClass="err" path="prodstartdate" />
		<label for="prodenddate">종료일자</label>
		<input type = "date" name = "prodenddate" id = "prodenddate" value = "${product.prodenddate}"/>
		<form:errors cssClass="err" path="prodenddate" />
	</p>
	<p>
		<label for="location">위치</label>
		<input type = "text" name = "location" id = "location" value ="예술의 전당"/>
	</p>
	<p>
		<label for="prodstock">수량</label>
		<input type = "text" name = "prodstock" id = "prodstock" placeholder="수량" value = "${product.prodstock}"/>
		<label for="prodprice">가격</label>
		<input type = "text" name = "prodprice" id = "prodprice" placeholder="가격" value = "${product.prodprice}"/>
	</p>
	<p>
		<label for="prodcateid">카테고리</label>
		<select name = "prodcateid" id = "prodcateid">
			<c:forEach items="${categoryList }" var = "category">
				<option value ="${category.prodcateid }" 
					<c:if test ="${product.prodcateid eq category.prodcateid}"> selected </c:if>>
						[${category.prodcateid }]${category.prodcatename }
			</c:forEach>
		</select>
		<form:errors cssClass="err" path="prodcateid" />
	</p>
	<p>
		<label for="prodcontent">상세정보</label>
		<textarea name = "prodcontent" id = "prodcontent" rows="" cols="">${product.prodcontent}</textarea>
		<form:errors cssClass="err" path="prodcontent" />
	</p>
	<p>
		<input type = "hidden" id ="prodid" name = "prodid" value = "${product.prodid }" />
		<input type = "hidden" name = "upload2" id = "upload2" value = "${product.prodimage }"/>
		<input type = "submit" value = "수정하기"/>
	</p>	
	</form:form>
</body>
</html>