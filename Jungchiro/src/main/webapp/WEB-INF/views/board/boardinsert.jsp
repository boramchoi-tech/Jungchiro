<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">

function insert() {
	if($(select[name='board_category']).val == "none"){
		alert("카테고리를 선택해주세요");
		return false;
	}
}

</script>

</head>
<body>

	<%@ include file="/WEB-INF/views/form/header.jsp"%>

	<h1>글쓰기</h1>

	<form name="insert" action="/poli/boardinsertres.do" method="post">


		<table border="1">
			<tr>
				<th>작성자</th>
				<td>test</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title"></td>
			</tr>

			<tr>
				<th>카테고리</th>
				<td><select name="board_category">
						<option value="none">카테고리 선택</option>
						<option value="의안">의안</option>
						<option value="시사">시사</option>
						<option value="이슈">이슈</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="board_content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="글쓰기" onclick="insert()">
					<input type="button" value="취소" 
					onclick="location.href ='/poli/boardlist.do?page=1'"></td>
			</tr>
		</table>
	</form>

	<%@ include file="/WEB-INF/views/form/footer.jsp"%>

</body>
</html>