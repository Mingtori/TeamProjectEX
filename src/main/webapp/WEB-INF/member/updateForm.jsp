<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../page/mytop.jsp"%>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	function goback(){
		history.back(-1);
	}
	function leave(memid){
		if(confirm("정말 탈퇴하시겠습니까?")==true){
			location.href="delete.me?memid=" + memid;
		}else{
			return;
		}
	}
	
	var pwflag = false;
	
	function pwcheck(){
		var pw1 = $("input[name='mempw']").val();
		var pw2 = $("input[name='mempwcheck']").val();
		if(pw1 != "" && pw2 != ""){
			if(pw1 == pw2){
				$("#pwcheck").html("비밀번호 일치");
				pwflag=true;
			}else{
				$("#pwcheck").html("비밀번호 불일치");
				pwflag=false;
			}
		}else{
			$("#pwcheck").html("비밀번호를 입력해주세요");
			pwflag=false;
		}
	}
	

	function check(){
		if(pwflag == false){
			alert("비밀번호가 서로 일치하지 않습니다.");
			return false;
		}
	}
</script>
<style>
.col-sm-2 {
	padding: 0;
}
#idcheck, #pwcheck{
	color:red;
}
</style>
</head>
	<div class="container">
      <div class="row">
	     <div class="col-sm-8 offset-sm-4"><h1>회원 정보 수정</h1></div>
         <div class="col-sm-9 offset-sm-3 text-center">
            <c:set var="phone" value="${fn:split(member.memphone,'-') }"/>
            <c:set var="email" value="${fn:split(member.mememail,'@') }"/>
            <form:form commandName="update" action="update.me" method="post">
               <input type="hidden" name="comid" value="${member.comid }">
                  <div class="form-group form-inline">
                     <label for="memid" class="col-sm-2 control-label">아이디</label>
                     <input type="hidden" name="memid" value="${member.memid }">
                     <input type="text" class="form-control" name="memid" value="${member.memid }" disabled>
                     <form:errors cssClass="err" path="memid"/>
                  </div>
                  <div class="form-group form-inline">
                     <label for="mempw" class="col-sm-2 control-label">비밀번호</label>
                     <input type="password" class="form-control" name="mempw"/>
                     <form:errors cssClass="err" path="mempw"/>
                  </div>
                  <div class="form-group form-inline">
                     <label for="mempwcheck" class="col-sm-2 control-label">비밀번호 확인</label>
                     <input type="password" class="form-control" name="mempwcheck" onblur="pwcheck();"/>
                     <span id="pwcheck"></span>
                     <form:errors cssClass="err" path="mempwcheck"/>
                  </div>
                  <div class="form-group form-inline">
                     <label for="memname" class="col-sm-2 control-label">이름</label>
                     <input type="text" class="form-control" name="memname" value="${member.memname }"/>
                     <form:errors cssClass="err" path="memname"/>
                  </div>
                  <div class="form-group form-inline">
						<label class="font-black col-sm-2 control-label" for="mempost">우편번호</label>
						<input type="text" id="mempost" name="mempost" class="example_pcfull postcodify_postcode5 form-control" readonly  value="${member.mempost }">
						<div class="col-sm-4">
					    	<input class="btn btn-default" type="button" id="memaddr_button" class="example_button" value="검색">
					    </div>
						<form:errors cssClass="err" path="memaddr" />
					</div>
					<div class="form-group form-inline">	    
					    <label class="font-black col-sm-2 control-label" for="memaddr">도로명주소</label>
					    <input type="text" id="memaddr" name="memaddr" class="example_input postcodify_address form-control" style="width:70%" readonly value="${member.memaddr }"> 
					</div>
					<div class="form-group form-inline">	
						<label class="font-black col-sm-2 control-label" for="memaddrdetail">상세주소</label>
						<input type="text" id="memaddrdetail" name="memaddrdetail" class="example_input postcodify_details form-control" style="width:70%;" value="${member.memaddrdetail }">    
					</div>
                  <c:if test="${member.memid!='admin'}">
                     <div class="form-group form-inline">
                        <label for="memphone1" class="col-sm-2 control-label">전화번호</label>
                        <select class="form-control" name="memphone1">
                           <option value="010" <c:if test="${phone[0] == '010' }">selected</c:if>>010
                           <option value="070" <c:if test="${phone[0] == '070' }">selected</c:if>>070
                        </select>
                        <form:errors cssClass="err" path="memphone1"/>
                        <c:forEach var="ph" items="${phone }" varStatus="status" begin="1">
                         - <input type="text"  class="form-control col-md-2" name="memphone${status.count + 1 }" placeholder="1234" value="${ph }">
                        </c:forEach>
                        <form:errors cssClass="err" path="memphone1"/>
                        <form:errors cssClass="err" path="memphone2"/>
                        <form:errors cssClass="err" path="memphone3"/>
                     </div>
                  </c:if>
                  <div class="form-group form-inline">
                     <label for="mememail1" class="col-sm-2 control-label">이메일</label>
                     <input type="text" class="form-control col-md-2" name="mememail1" value="${email[0] }"/>
                      @ <select class="form-control"  name="mememail2">
                        <option value="">선택하세요
                        <option value="naver.com" <c:if test="${email[1] == 'naver.com' }">selected</c:if>>naver.com
                        <option value="daum.net" <c:if test="${email[1] == 'daum.net' }">selected</c:if>>daum.net
                        <option value="gmail.com" <c:if test="${email[1] == 'gmail.com' }">selected</c:if>>gmail.com
                     </select>
                     <form:errors cssClass="err" path="mememail1"/>
                     <form:errors cssClass="err" path="mememail2"/>
                  </div>
                  <c:if test="${member.gradename == '판매자' }">
	                  <div class="form-group form-inline">
		                  <label class="col-sm-2 control-label" for="comname">회사이름</label>
		                  <input class="form-control" type="text" name="comname" placeholder="예술의 전당" value="${member.comname }">
		                  <form:errors cssClass="err" path="comname"/>
	                  </div>
	                  <div class="form-group form-inline">
							<label class="font-black col-sm-2 control-label" for="compost">우편번호</label>
							<input type="text" id="compost" name="compost" class="example_pcfull postcodify_postcode5 form-control" readonly value="${member.compost }">
							<div class="col-sm-4">
						    	<input class="btn btn-default" type="button" id="comaddr_button" class="example_button" value="검색">
						    </div>
						</div>
						<div class="form-group form-inline">	    
						    <label class="font-black col-sm-2 control-label" for="comaddr">도로명주소</label>
						    <input type="text" id="comaddr" name="comaddr" class="example_input postcodify_address form-control" style="width:70%" readonly value="${member.comaddr }"> 
						</div>
						<div class="form-group form-inline">	
							<label class="font-black col-sm-2 control-label" for="comaddrdetail">상세주소</label>
							<input type="text" id="comaddrdetail" name="comaddrdetail" class="example_input postcodify_details form-control" style="width:70%;" value="${member.comaddrdetail }">    
						</div>
                  </c:if>
                  <div align="right">
	                  <input type="submit" class="btn btn-primary" value="수정하기" onclick="return check();">
	                  <input type="button" class="btn btn-default" value="돌아가기" onclick="goback();">
	                  <input type="button" class="btn btn-default" value="회원탈퇴" onclick="leave('${member.memid}');">
                  </div>
            </form:form>
         </div>
      </div>
   </div>
   
<%@ include file="./searchAddr.jsp" %>
<%@ include file="../page/mybottom.jsp"%>