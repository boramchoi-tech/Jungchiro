<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
	
</script>


</head>
<body>

	<%@ include file="/WEB-INF/views/form/header.jsp"%>


	<h1>글 수정</h1>
	<form action="boardupdateres.do" method="post">
		<input type="hidden" name="board_seq" value="${board.board_seq}">

		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" value="${board.board_title }"
					name="board_title"></td>
			</tr>

			<tr>
				<th>카테고리</th>
				<td><select name="board_category">
						<option value="${board.board_category }">카테고리 선택</option>
						<option value="정책">정책</option>
						<option value="선거">선거</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>

			<tr>

				<th>내용</th>
				<td><textarea rows="10" cols="60" name="board_content">${board.board_content }
				    </textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정">
					<input type="button" value="취소"
					onclick="location.href='boarddetail.do??board_seq=${board.board_seq}&page=${search.page}&perPageNum=${search.perPageNum}&searchType=${search.searchType}&keyword=${search.keyword}'"></td>
			</tr>
		</table>
	</form>

	<%@ include file="/WEB-INF/views/form/header.jsp"%>


</body>
</html>