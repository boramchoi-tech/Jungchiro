<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-164964981-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-164964981-1');
</script>
<meta charset="UTF-8">
<title>정치로</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

</head>

<link rel="stylesheet" type="text/css"
	href="/poli/resources/css/board.css" />


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

	$('#keywordInput').keypress(function(event) {
		if (event.which == 13) {
			$('#searchBtn').click();
			return false;
		}
	});
</script>

<style type="text/css">
</style>

<body>

	<%@ include file="/WEB-INF/views/form/header.jsp"%>


	<div class="nanum_m">
		<div class="container">
			<h1 class="nanum" align="center">자유게시판</h1>

			<div>
				<div class="input-group">
					<div class="search">
						<span><select name="searchType"
							class="form-control input-group-btn">
								<option value="n"
									<c:out value="${search.searchType == null ? 'selected' : ''}"/>>검색
									필터</option>
								<option value="t"
									<c:out value="${search.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"
									<c:out value="${search.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="ct"
									<c:out value="${search.searchType eq 'ct' ? 'selected' : ''}"/>>카테고리</option>
								<option value="w"
									<c:out value="${search.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"
									<c:out value="${search.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						</select> </span>
					</div>
					<input type="text" name="keyword" id="keywordInput"
						class="form-control" value="${search.keyword}" /> <span
						class="input-group-btn">
						<button id="searchBtn" type="button"
							class="btn btn-outline-primary pull-right">검색</button>
					</span>
				</div>
				<!-- /input-group -->
			</div>

			<br />

			<table class="table table-hover">
				<thead id="board_head">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">카테고리</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list} ">
							<tr>
								<td scope="col">-------------작성된 글이 없습니다.------------</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- 모든 조건이 거짓일때 -->
							<c:forEach items="${list }" var="board">
								<tr>
									<td>${board.board_seq}</td>
									<td>${board.board_category}</td>
									<td><a
										href="/poli/boarddetail.do?board_seq=${board.board_seq}&page=${search.page}&perPageNum=${search.perPageNum}&searchType=${search.searchType}&keyword=${search.keyword}"
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
						<td colspan="6" align="right"><input class="btn btn-primary"
							type="button" value="글쓰기"
							onclick="location.href='/poli/boardinsertform.do'"></td>
					</tr>
				</tfoot>
			</table>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMake.prev}">
						<li class="page-item"><a class="page-link"
							href="/poli/boardlist.do${pageMake.makeSearch(pageMake.startPage - 1)}">이전</a></li>
					</c:if>
					<c:forEach begin="${pageMake.startPage}" end="${pageMake.endPage}"
						var="idx">
						<li class="page-item">
							<a class="page-link" href="/poli/boardlist.do${pageMake.makeSearch(idx)}">
								<c:if test="${search.page == idx }">
									<b>${idx }</b>
								</c:if>
								<c:if test="${search.page != idx }">
									${idx}
								</c:if>
							</a>
						</li>
					</c:forEach>
					<c:if test="${pageMake.next && pageMake.endPage > 0}">
						<li class="page-item"><a class="page-link"
							href="/poli/boardlist.do${pageMake.makeSearch(pageMake.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>








	<%@ include file="/WEB-INF/views/form/footer.jsp"%>
</body>
</html>