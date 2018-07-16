<%@ include file="./../views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				<form action = "list.prd">
	         <div class="input-group mb-3" align="center">
   		     	<input type = "hidden" name="whatColumn" id="whatColumn" value="all"/>
   		     	<input class="form-control" style="background-color:rgba(255,255,255,0.5);" type="text" name="keyword" id="keyword" placeholder="search" value = "${keyword }">
       		   	<div class="input-group-append">
			      <button class="btn btn-success" type="submit">search</button>  
			    </div>
       		 </div>
          </form>
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
						</div> <img class="img-fluid" src="${prodimage }" alt="" width="100%">
					</a>
					<div class="portfolio-caption">
						<h5>${product.prodname }</h5>
						<p class="text-muted">${product.prodcontent}</p>
					</div>
				</div>
			</c:forEach>
		</div>
		</div>
	</div>
</section>

<%@ include file="./../views/bottom.jsp"%>