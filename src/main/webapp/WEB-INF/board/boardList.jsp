<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/top.jsp"%>
<style>
.jumbotron {
	background-color: rgba(242, 242, 242, 0.8);
}
td, th, .font-black{
	color:black;
}
</style>
		<c:set var="theString" value="http://localhost:9090${pageContext.request.contextPath}/resources/img/board"/>
		<c:set var="count" value="${pageInfo.totalCount - pageInfo.pageSize * (pageInfo.pageNumber-1)}"/>
		<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="jumbotron">
					<c:if test="${boardcateid == 'a01' }">
						<div class="intro-lead-in font-black">공지사항</div>
					</c:if>
					<c:if test="${boardcateid == 'a02' }">
						<div class="intro-lead-in font-black">QnA</div>
					</c:if>
					<table class="table" style="background-color:white;">
						<c:if test="${loginfo.memid eq 'admin' or boardcateid !='a01'}">
						<tr>
							<td colspan=5 align="right"><input class="btn btn-default" type="button" value="글쓰기"
								onclick="location.href='insert.bd?boardcateid=${boardcateid}'" /></td>
						</tr>
						</c:if>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>게시일자</th>
							<th>조회수</th>
						</tr>
						<c:if test="${fn:length(lists) == 0 }">
							<tr><td colspan="5" align="center">게시물이 없습니다.</td></tr>
						</c:if>
						<c:if test="${fn:length(lists) != 0 }">
						<c:forEach items="${lists }" var="lists" varStatus="status">
							<tr>
								<td>${count-status.index}</td>
								<td align="left">
									<c:set var="wid" value="0" />
								    <c:if test="${lists.relevel > 0}">
									    <c:set var="wid" value="${20*lists.relevel }" />
									    <img src="${theString}/level.gif" width="${wid }" height="16">
										<img src="${theString}/re.gif">
								    </c:if>
									<c:if test="${board.re_level <= 0 }">
										<img src="${theString}/level.gif" width="${wid }" height="16">
									</c:if>
									<a href="detail.bd?boardid=${lists.boardid}&pageNumber=${pageInfo.pageNumber}" style="color:black;"><b>${lists.boardsubject }</b></a>
									<c:if test="${lists.boardreadcount > 10}">
						        		 <img src="${theString}/hot.gif" border="0"  height="16">
						 		   </c:if>
								</td>
								<td>${lists.memid }</td>
								<td>${lists.boardinputdate}</td>
								<td>${lists.boardreadcount }</td>
							</tr>
						</c:forEach>
						</c:if>
						</table>
						${pageInfo.pagingHtml }
						<form action="notice.bd" method="get">
							<input type="hidden" name="boardcateid" value="${boardcateid }">
							<div class="form-inline form-group" >
								<div style="margin:0 auto;">
									<select class="form-control" name="whatColumn">
										<option value="boardsubject">제목
										<option value="boardcontent">내용
									</select>
										<input class="form-control" type="text" name="keyword" placeholder="검색" value="">
									<input class="btn btn-default" type="submit" value="검색">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</header>
<%@ include file="../views/bottom.jsp"%>