<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>
</head>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript"></script>

<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "/poli/boardlist.do"
							+ '${pageMake.makeQuery(1)}' + "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>

<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>

<body>
	<%@ include file="/WEB-INF/views/form/header.jsp"%>

	<h1>자유게시판</h1>

	<div class="search">
		<select name="searchType">
			<option value="n"
				<c:out value="${search.searchType == null ? 'selected' : ''}"/>>검색
				필터</option>
			<option value="t"
				<c:out value="${search.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			<option value="c"
				<c:out value="${search.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
			<option value="ct"
				<c:out value="${search.searchType eq 'ct' ? 'selected' : ''}"/>>카테고리</option>
			<!--<option value="w"
				<c:out value="${search.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>  -->
			<option value="tc"
				<c:out value="${search.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
		</select> <input type="text" name="keyword" id="keywordInput"
			value="${search.keyword}" />

		<button id="searchBtn" type="button">검색</button>
	</div>

	<table border="1">
		<colgroup>
			<col width="50">
			<col width="100">
			<col width="200">
			<col width="100">
			<col width="100">
			<col width="100">			
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list} ">
					<tr>
						<td colspan="6">-------------작성된 글이 없습니다.------------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<!-- 모든 조건이 거짓일때 -->
					<c:forEach items="${list }" var="board">
						<tr>					
							<td>${board.board_seq}</td>
							<td>${board.board_category}</td>
							<td><a href="/poli/boarddetail.do?board_seq=${board.board_seq}&page=${search.page}&perPageNum=${search.perPageNum}&searchType=${search.searchType}&keyword=${search.keyword}"
								style="color: black">${board.board_title}</a></td>
							<td>${board.member_id}</td>
							<td>${board.board_count}</td>
							<td>${board.board_date}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6" align="right"><input type="button" value="글쓰기"
					onclick="location.href='/poli/boardinsertform.do'"></td>
			</tr>
			<tr>
				<td colspan="6">
					<ul>
						<c:if test="${pageMake.prev}">
							<li><a 
								href="/poli/boardlist.do${pageMake.makeSearch(pageMake.startPage - 1)}">이전</a></li>
						</c:if>
						<c:forEach begin="${pageMake.startPage}" end="${pageMake.endPage}"
							var="idx">
							<li><a 
								href="/poli/boardlist.do${pageMake.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>
						<c:if test="${pageMake.next && pageMake.endPage > 0}">
							<li><a 
								href="/poli/boardlist.do${pageMake.makeSearch(pageMake.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</td>
			</tr>
		</tfoot>
	</table>
	


			


	<%@ include file="/WEB-INF/views/form/footer.jsp"%>
</body>
</html>