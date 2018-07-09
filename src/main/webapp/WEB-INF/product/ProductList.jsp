<%@ include file="./../views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

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

@media (min-width: 768px){
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
<section class="bg-light" id="portfolio">
	<div class="container">
		<div class="jumbotron">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading text-uppercase">PRODUCTS</h2>
				<h3 class="section-subheading text-muted">상품 리스트 화면입니다.</h3>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${product }" var="product">
				<c:set var="prodimage"
					value="http://localhost:9090${pageContext.request.contextPath}/resources/${product.prodimage }" />
				<div class="col-md-4 col-sm-6 portfolio-item">
					<a class="portfolio-link"
						href="detail.prd?prodid=${product.prodid }&boardcateid=p03&pageNumber=${pageInfo.pageNumber}">
						<div class="portfolio-hover">
							<div class="portfolio-hover-content">
								<i class="fa fa-plus fa-3x"></i>
							</div>
						</div> <img class="img-fluid" src="${prodimage }" alt="">
					</a>
					<div class="portfolio-caption">
						<h4>${product.prodname }</h4>
						<p class="text-muted">${product.prodcontent}</p>
					</div>
				</div>
			</c:forEach>
		</div>
		</div>
	</div>
</section>

<%@ include file="./../views/bottom.jsp"%>