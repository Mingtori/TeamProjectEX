<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/top.jsp"%>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function goback() {
		history.back(-1);
	}
	function duplicateID() {

	}
	
	var pwflag = false;
	var idflag = false;
	
	function pwcheck(){
		var pw1 = $("input[name='mempw']").val();
		var pw2 = $("input[name='mempwcheck']").val();
		if(pw1 == pw2){
			$("#pwcheck").html("비밀번호 일치");
			pwflag=true;
		}else{
			$("#pwcheck").html("비밀번호 불일치");
			pwflag=false;
		}
		
	}
	
	 
	$(function(){
	   $("#duplicateId").click(function(){
	       var memid = $("#memid").val();   
	       $.ajax({
	             async: true,
	            type : "POST",
	            data : memid,
	            url : "checkSignup.me",
	            dataType : "json",
	               contentType: "application/json; charset=UTF-8",
	            success : function(data){
	               if(data.cnt > 0){
	                  alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
	                  idflag = false;
	               }else {
	                       alert("사용가능한 아이디입니다.");
	                       idflag = true;
	               }
	            },
	            error : function(request, status,error) {
	                   alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	               }
	         });
	   });
	});

	function check(){
		if(idflag == false){
	         alert("아이디 중복확인을 해주세요.");
	         return false;
	    }
		if(pwflag == false){
			alert("비밀번호가 서로 일치하지 않습니다.");
			return false;
		}
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

#pwcheck{
	color:red;
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
									<input class="form-control" type="text" id="memid" name="memid" placeholder="ID">
				                     <div class="col-sm-4">
				                        <input type="button" class="btn btn-default" value="중복확인" id="duplicateId">
				                     </div>
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
										class="form-control" name="mempwcheck" placeholder="PASSWORD" onblur="pwcheck();">
									<span id="pwcheck"></span>
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
									<input class="btn btn-primary" type="submit" value="회원가입" onclick="return check();">
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