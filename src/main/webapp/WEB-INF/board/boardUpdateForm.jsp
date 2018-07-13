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
				<div class="intro-lead-in font-black">글 수정</div>
				<form:form commandName="update" name="update" method="post" action="update.bd">
					<input type="hidden" name="boardid" value="${board.boardid}">
					<input type="hidden" name="boardcateid" value="${board.boardcateid}">
					<input type="hidden" name="pageNumber" value="${pageNumber}">
					<div class="row">
						<div class="col-sm-2">
							<label for="boardsubject">제목</label>
						</div>
						<div class="form-group col-sm-10">
							<input class="form-control" type="text" name="boardsubject"  value="${board.boardsubject }">
						</div>
						<div class="col-sm-2">
							<label for="boardcontent">내용</label>
						</div>
						<div class="form-group col-sm-10">
							<textarea class="form-control" id="boardcontent" name="boardcontent">${board.boardcontent }</textarea>
						</div>
						<div style="margin:0 auto">
							<input class="btn btn-default" type="submit" value="글쓰기"/>
							<input class="btn btn-default" type="reset" value="취소" />
						</div>
					</div> 
				</form:form>
			</div>
		</div>
	</div>
</header>

<%@ include file="../views/bottom.jsp"%>