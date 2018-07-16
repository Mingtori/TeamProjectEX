<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="./../views/top.jsp"%>
<title>수정 확인</title>
<style>
.form-inline label, .form-inline>.form-control {
   display: inline-block;
   text-align: left;
}
.jumbotron {
   background-color: #F2F2F2;
   background-color: rgba(242, 242, 242, 0.8);
}
</style>
<script>

   //로그인 한 정보의 비밀번호
   var loginPW = ${loginfo.mempw};
   
   function checkPw(){ /* 입력한 비밀번호와 로그인한 정보 비교 */
      if(document.getElementById("mempw").value != loginPW){
         alert("비밀번호가 틀립니다!");
         return false;
      }
      
   }
</script>
<header class="masthead">
   <div class="container">
      <div class="intro-text">
         <div class="jumbotron">
            <div class="row">
               <div class="col-lg-12 text-center">
                     <div class="intro-lead-in font-black">비밀번호 확인</div>
                  <div class="form-group" style="margin: auto;">
                     <form action="update.me" method="get">
                        <input type="hidden" name="memid" value="${loginfo.memid }"/>
                        <div class="form-group form-inline" style="display: block;">
                           <label for="mempw" class="col-md-2 control-label">비밀번호</label>
                           <input class="form-control" type="password" name="mempw" id="mempw"
                              placeholder="PASSWORD">
                        </div>
                        <input type="submit" class="btn btn-primary" value="확인" onclick="return checkPw();">
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</header>
<%@ include file="./../views/bottom.jsp"%>