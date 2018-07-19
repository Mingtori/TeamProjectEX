<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/top.jsp"%>
<style>
.jumbotron {
   background-color: rgba(242, 242, 242, 0.8);
   color: black;
}
</style>
   
<header class="masthead">
   <div class="container">
      <div class="intro-text">
         <div class="jumbotron">
            <div class="intro-lead-in font-black">답글쓰기</div>
            <form:form commandName="reply" method="post" action="reply.bd">
               <input type="hidden" name="ref" value="${board.ref }">
               <input type="hidden" name="restep" value="${board.restep }">
               <input type="hidden" name="relevel" value="${board.relevel }">
               <input type="hidden" name="pageNumber" value="${pageNumber }">
               <input type="hidden" name="boardcateid" value="${board.boardcateid }">
               <input type="hidden" name="memid" value="${loginfo.memid}">
               <div class="row">
                  <div class="col-sm-2">
                     <label for="boardsubject">제목</label>
                  </div>
                  <div class="form-group col-sm-10">
                     <input class="form-control" type="text" name="boardsubject" value="[답글]">
                  </div>
                  <div class="col-sm-2">
                     <label for="boardcontent">내용</label>
                  </div>
                  <div class="form-group col-sm-10">
                     <textarea class="form-control" id="boardcontent" name="boardcontent"></textarea>
                  </div>
                  <div style="margin:0 auto">
                     <input class="btn btn-primary" type="submit" value="글쓰기"/>
                     <input class="btn btn-default" type="reset" value="취소" />
                  </div>
               </div>      
            </form:form>
         </div>
      </div>
   </div>
</header>
<%@ include file="../views/bottom.jsp"%>