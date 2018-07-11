<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background-color: rgba(242, 242, 242, 0.8);
	color: black;
}
.form-inline label, .form-inline>.form-control {
	display: inline-block;
	text-align: left;
}
.font-black {
	color: black;
}
a {
	color: black;
}
.col-sm-2 {
	padding: 0;
}
</style>
</head>
<body>
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="jumbotron">
					<div class="intro-lead-in font-black">회원가입</div>
					<form:form commandName="register" action="register.me"
						method="post">
						<div class="row">
							<div class="col-sm-8 offset-sm-4" align="left">
								<input type="hidden" name="what" value="${what }">
								<div class="form-group form-inline">
									<label class="font-black col-sm-2 control-label" for="memid">아이디</label>
									<input class="form-control" type="text" name="memid"
										placeholder="ID">
									<!-- <div class="col-sm-4 form-control">
				                        <input type="button" value="중복확인" onclick="duplicateID();">
				                     </div> -->
									<form:errors cssClass="err" path="memid" />
								</div>
								<div class="form-group form-inline">
									<label class="font-black col-sm-2 control-label" for="mempw">비밀번호</label>
									<input class="form-control" type="password" name="mempw"
										placeholder="PASSWORD">
									<form:errors cssClass="err" path="mempw" />
								</div>
								<div class="form-group form-inline">
									<label class="font-black col-sm-2 control-label"
										for="mempwcheck">비밀번호 확인</label> <input type="password"
										class="form-control" name="mempwcheck" placeholder="PASSWORD">
									<form:errors cssClass="err" path="mempwcheck" />
								</div>
								<div class="form-group form-inline">
									<label class="font-black col-sm-2 control-label" for="memname">이름</label>
									<input type="text" name="memname" class="form-control"
										placeholder="NAME">
									<form:errors cssClass="err" path="memname" />
								</div>
								<div class="form-group form-inline">
									<label class="font-black col-sm-2 control-label" for="memaddr">주소</label>
									<input type="text" name="memaddr" class="form-control"
										placeholder="서울시 서대문구">
									<form:errors cssClass="err" path="memaddr" />
								</div>
								<div class="form-group form-inline">
									<label class="font-black col-sm-2  control-label"
										for="memphone1">전화번호</label> 
									<select name="memphone1" class="form-control">
										<option value="010">010
										<option value="070">070
									</select>
									 - 
									<input class="form-control col-md-2" type="text" name="memphone2"
									placeholder="1234">
									 - 
									<input class="form-control col-md-2" type="text" name="memphone3"
									placeholder="1234">
									<form:errors cssClass="err" path="memphone1" />
									<form:errors cssClass="err" path="memphone2" />
									<form:errors cssClass="err" path="memphone3" />
								</div>
								<div class="form-group form-inline">
									<label class="font-black  col-sm-2 control-label"
										for="mememail1">이메일</label> 
									<input type="text" class="form-control col-md-2" name="mememail1"
									 placeholder="email">
									 @ 
									<select class="form-control" name="mememail2">
										<option value="">선택하세요
										<option value="naver.com">naver.com
										<option value="daum.net">daum.net
									</select>
									<form:errors cssClass="err" path="mememail1" />
									<form:errors cssClass="err" path="mememail2" />
								</div>
								<c:if test="${what == 'seller' }">
									<div class="form-group form-inline">
										<label class="font-black col-sm-2 control-label" for="comname">회사이름</label>
										<input type="text" class="form-control" name="comname"
											placeholder="예술의 전당">
									</div>
									<div class="form-group form-inline">
										<label class="font-black col-sm-2 control-label" for="comaddr">회사주소</label>
										<input type="text" class="form-control" name="comaddr"
											placeholder="서울시 서초구">
									</div>
								</c:if>
								<div align="right">
									<input class="btn btn-primary" type="submit" value="회원가입">
									<input class="btn btn-default" type="button" value="돌아가기"
										onclick="goback();">
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</header>


	<%@ include file="../views/bottom.jsp"%>