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
				<div class="intro-lead-in font-black">상세보기</div>
					<c:set value="${boardDetail}" var="board" />
					<form>
						<table class="table">
							<tr height="30">
								<td align="center" width="125">글번호</td>
								<td align="center" width="125">${board.boardid }</td>
								<td align="center" width="125">조회수</td>
								<td align="center" width="125">${board.boardreadcount }</td>
							</tr>
				
							<tr height="30">
								<td align="center" width="125">작성자</td>
								<td align="center" width="125">${board.memid }</td>
								<td align="center" width="125">작성일</td>
								<td align="center" width="125">
								<fmt:formatDate value="${board.boardinputdate }" type="date" pattern="yyyy-MM-dd" /></td>
							</tr>
				
							<tr height="30">
								<td align="center" width="125">글제목</td>
								<td align="center" width="375" colspan="3">${board.boardsubject}</td>
							</tr>
				
							<tr>
								<td align="center" width="125">글내용</td>
								<td align="left" width="375" colspan="3"><pre>${board.boardcontent}</pre></td>
							</tr>
				
							<tr height="30">
								<td colspan="4" align="right">
									<c:if test="${(loginfo.memid eq 'admin') or (board.boardcateid eq 'a02' and board.memid eq loginfo.memid)}"> 
										<input class="btn btn-default" type="button" value="글수정" onclick="location.href='update.bd?boardid=${board.boardid}&pageNumber=${pageNumber }'">
							  			 &nbsp;&nbsp;&nbsp;&nbsp;
										<input class="btn btn-default" type="button" value="글삭제" onclick="document.location.href='delete.bd?boardid=${board.boardid}&boardcateid=${board.boardcateid}'">
										 &nbsp;&nbsp;&nbsp;&nbsp;
								   	</c:if>
								    <c:if test="${board.boardcateid eq 'a02' and loginfo.memid eq 'admin'}">
										<input class="btn btn-default" type="button" value="답글쓰기" onclick="document.location.href='reply.bd?boardid=${board.boardid}&boardcateid=${board.boardcateid}&ref=${board.ref }&relevel=${board.relevel }&restep=${board.restep }&pageNumber=${pageNumber }'">
										 &nbsp;&nbsp;&nbsp;&nbsp;
								   	</c:if>
								   <input class="btn btn-default" type="button" value="글목록" onclick="document.location.href='notice.bd?pageNumber=${pageNumber}&boardcateid=${board.boardcateid }'">
								</td>
							</tr>
						</table>
				
					</form>
			</div>
		</div>
	</div>
</header>

<%@ include file="../views/bottom.jsp"%>