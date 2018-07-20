<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
    <!-- Header -->
    <header class="masthead">
      <div class="container">
         <c:if test="${loginfo != null and loginfo.gradeid == 1}">
           <div class="dropdown" align="left">
            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" style="margin-top:110px;"
               >
               <i class="fas fa-shopping-bag"></i>&nbsp;&nbsp;  in My Bag ${fn:length(cartlist)}개 / <fmt:formatNumber value="${totalprice }" pattern="###,###"/>원 
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
               <table class="table" style="margin:0 0;">
                  <c:if test="${fn:length(cartlist) > 0}">
                  <c:forEach items="${cartlist}" var="cart">
                  <c:set var="theString"
                           value="http://localhost:9090${pageContext.request.contextPath}/resources/${cart.prodimage }" />
                  <tr>
                     <td><img alt="" src="${theString }" width="50px" height="50px"></td>
                     <td>${cart.prodname }<br>${cart.cartqty } 개 / <fmt:formatNumber value="${cart.prodprice }" pattern="###,###"/> 원</td>
                     <td style="vertical-align: middle;'" align="right"><fmt:formatNumber value="${cart.cartprice }" pattern="###,###"/> 원</td>
                  </tr>       
                  </c:forEach>
                  </c:if>
                  <c:if test="${fn:length(cartlist) == 0}">
                     <tr><td align="center">상품이 없습니다.</td></tr>
                  </c:if>
                  <tr>
                     <td colspan="3"><input type="button" class="btn btn-default form-control" value="장바구니가기" onclick="location.href='list.ct'"></td>
                     
                  </tr>
               </table>
            </div>
           <div class="form-group" style="margin-top: 110px; float: right;">
              <form action = "list.prd">
               <div class="input-group">
                   <input type = "hidden" name="whatColumn" id="whatColumn" value="all"/>
                   <input class="form-control" style="background-color:rgba(255,255,255,0.8); border-top-left-radius: 0.3rem;
    border-bottom-left-radius: 0.3rem;" type="text" name="keyword" id="keyword" placeholder="search">
                   <div class="input-group-append">
               <button class="btn btn-success" type="submit">search</button>  
               </div>
               </div>
                </form>
           </div>
         </div>
        </c:if>
       
        <div class="intro-text" style="padding-bottom:300px;"> 
          <div class="intro-lead-in"></div>
        </div>
      </div>
    </header>

    <!-- Team -->
    <section class="bg-light" id="team">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Team</h2>
            <h3 class="section-subheading text-muted">일석이조</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="${pageContext.request.contextPath}/resources/img/team/1.jpg" alt="">
              <h4>임 주 하</h4>
              <p class="text-muted">대 장</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="${pageContext.request.contextPath}/resources/img/team/2.jpg" alt="">
              <h4>김 민 창</h4>
              <p class="text-muted">별다섯개</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="${pageContext.request.contextPath}/resources/img/team/3.jpg" alt="">
              <h4>김지희</h4>
              <p class="text-muted">에이스</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <p class="large text-muted">끝났다</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Clients -->
    <section class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-md-3 col-sm-6">
            <a href="#">
              <img class="img-fluid d-block mx-auto" src="img/logos/envato.jpg" alt="">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="#">
              <img class="img-fluid d-block mx-auto" src="img/logos/designmodo.jpg" alt="">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="#">
              <img class="img-fluid d-block mx-auto" src="img/logos/themeforest.jpg" alt="">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="#">
              <img class="img-fluid d-block mx-auto" src="img/logos/creative-market.jpg" alt="">
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- Contact -->
    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Contact Us</h2>
            <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <form id="contactForm" name="sentMessage" novalidate="novalidate">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input class="form-control" id="name" type="text" placeholder="Your Name *" required="required" data-validation-required-message="Please enter your name.">
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="email" type="email" placeholder="Your Email *" required="required" data-validation-required-message="Please enter your email address.">
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="phone" type="tel" placeholder="Your Phone *" required="required" data-validation-required-message="Please enter your phone number.">
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <textarea class="form-control" id="message" placeholder="Your Message *" required="required" data-validation-required-message="Please enter a message."></textarea>
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12 text-center">
                  <div id="success"></div>
                  <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit">Send Message</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; Your Website 2018</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-facebook"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-linkedin"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="list-inline-item">
                <a href="#">Privacy Policy</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Terms of Use</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>


<%@ include file="bottom.jsp"%>