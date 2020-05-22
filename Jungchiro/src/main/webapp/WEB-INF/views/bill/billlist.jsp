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


<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>

<body>
	<%@ include file="/WEB-INF/views/form/header.jsp"%>

	<h1>의안게시판</h1>
	<table border="1">
		<colgroup>
			<col width="100">
			<col width="100">
			<col width="500">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
		</colgroup>
		<thead>
			<tr>
				<th>의안번호</th>
				<th>의안구분</th>
				<th>의안명</th>
				<th>제안자 구분</th>
				<th>제안일자</th>
				<th>의결일자</th>
				<th>의결결과</th>
				<th>주요내용</th>
				<th>심사진행상태</th>

			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list} ">
					<tr>
						<td colspan="9">-------------의안이 없습니다.------------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<!-- 모든 조건이 거짓일때 -->
					<c:forEach items="${list }" var="bill">
						<tr>
							<td>${bill.bill_number}</td>
							<td>${bill.bill_type}</td>
							<td>${bill.bill_name}</td>
							<td>${bill.bill_proposer}</td>
							<td>${bill.propose_date}</td>
							<td>${bill.decide_date}</td>
							<td>${bill.decide_result}</td>
							<td><a href="${bill.content_address}">${bill.bill_content}</a></td>
							<td>${bill.bill_status}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>

			<tr>
				<td colspan="9">
				
					<ul>
						<c:if test="${pageMake.prev}">
							<li><a style="color: black"
								href="/poli/billlist.do${pageMake.makeQuery(pageMake.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMake.startPage}"
							end="${pageMake.endPage}" var="idx">
							<li><a href="/poli/billlist.do${pageMake.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMake.next && pageMake.endPage > 0}">
							<li><a
								href="/poli/billlist.do${pageMake.makeQuery(pageMake.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</td>
			</tr>
		</tfoot>
	</table>






	<%@ include file="/WEB-INF/views/form/footer.jsp"%>
</body>
</html>