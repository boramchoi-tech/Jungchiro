<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>

<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/poli/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	function writeCheck() {
		var form = document.boardinsert;

		if (form.board_title.value=="") // form 에 있는 name 값이 없을 때
		{
			alert("제목을 적어주세요"); // 경고창 띄움
			form.board_title.focus();// form 에 있는 name 위치로 이동
			return;
		}

		if (form.board_category.value=="") {
			alert("카테고리를 선택해주세요");
			form.board_category.focus();
			return;
		}

		if (CKEDITOR.instances.board_content.getData()=="") {
			alert("내용을 적어주세요");
			$("#board_content").focus();
			return;
		}

		form.submit();
		alert("글 작성에 성공했습니다.")

	}
</script>

</head>
<body>

	<%@ include file="/WEB-INF/views/form/header.jsp"%>

	<form action="/poli/boardinsertres.do" method="post" name="boardinsert">
		<input name="${_csrf.parameterName}" type="hidden"
			value="${_csrf.token}" />

<div class="container">
		<table class="table table-hover">
			<tr>
				<th>작성자</th>
				<td>${principal.username }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title"></td>
			</tr>

			<tr>
				<th>카테고리</th>
				<td><select name="board_category">
						<option value="">카테고리 선택</option>
						<option value="의안">의안</option>
						<option value="시사">시사</option>
						<option value="이슈">이슈</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="board_content" id="board_content"></textarea>
					<script>
						CKEDITOR.replace("board_content", {
							filebrowserUploadUrl : "/poli/imageUpload.do"
						});
					</script></td>
			</tr>

			<tr>

				<td colspan="2" align="right"><input type="button" value="글쓰기"
					onclick="writeCheck()"> <input type="hidden"
					name="member_seq" value="${principal.member_seq}"> <input
					type="button" value="취소"
					onclick="location.href ='/poli/boardlist.do?page=1'"></td>
			</tr>
		</table>
		</div>
	</form>

	<%@ include file="/WEB-INF/views/form/footer.jsp"%>

</body>
</html>