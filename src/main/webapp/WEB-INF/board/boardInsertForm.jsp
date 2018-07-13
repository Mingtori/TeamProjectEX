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
				<div class="intro-lead-in font-black">글쓰기</div>
				<form:form commandName="insert" name="insert" method="post"
					action="insert.bd">
					<input type="hidden" name="boardcateid" value="${boardcateid }">
					<input type="hidden" name="memid" value="${loginfo.memid}">
					<div class="row">
						<div class="col-sm-2">
							<label for="boardsubject">제목</label>
						</div>
						<div class="form-group col-sm-10">
							<input class="form-control" type="text" name="boardsubject">
						</div>
						<div class="col-sm-2">
							<label for="boardcontent">내용</label>
						</div>
						<div class="form-group col-sm-10">
							<textarea class="form-control" id="boardcontent" name="boardcontent"></textarea>
						</div>
						<div style="margin:0 auto">
							<input class="btn btn-default" type="submit" value="글쓰기" onclick="save();"/>
							<input class="btn btn-default" type="reset" value="취소" />
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</header>
<%@ include file="../views/bottom.jsp"%>