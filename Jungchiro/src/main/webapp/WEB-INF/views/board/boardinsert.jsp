<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
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


<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/poli/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	function writeCheck() {
		var form = document.boardinsert;

		if (form.board_title.value == "") // form 에 있는 name 값이 없을 때
		{
			alert("제목을 적어주세요"); // 경고창 띄움
			form.board_title.focus();// form 에 있는 name 위치로 이동
			return;
		}

		if (form.board_category.value == "") {
			alert("카테고리를 선택해주세요");
			form.board_category.focus();
			return;
		}

		if (CKEDITOR.instances.board_content.getData() == "") {
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

		<form action="/poli/boardinsertres.do" method="post"
			name="boardinsert" class="form-inline" role="form">
			<input name="${_csrf.parameterName}" type="hidden"
				value="${_csrf.token}" />

			<div class="input-group">

				<span class="input-group-addon">제목</span> <input type="text"
					class="form-control" name="board_title" placeholder="제목">

			</div>

			<div>
				<p>카테고리</p>
				<p>
					<select name="board_category">
						<option value="">카테고리 선택</option>
						<option value="의안">의안</option>
						<option value="시사">시사</option>
						<option value="이슈">이슈</option>
						<option value="기타">기타</option>
					</select>
				</p>
			</div>


			<div>
				<textarea rows="10" cols="60" name="board_content"
					id="board_content"></textarea>
				<script>
					CKEDITOR.replace("board_content", {
						filebrowserUploadUrl : "/poli/imageUpload.do"
					});
				</script>
			</div>

			<br />


			<div>
				<input type="button" value="글쓰기" onclick="writeCheck()"> <input
					type="hidden" name="member_seq" value="${principal.member_seq}">
				<input type="button" value="취소"
					onclick="location.href ='/poli/boardlist.do?page=1'">
			</div>
		</form>


	<%@ include file="/WEB-INF/views/form/footer.jsp"%>

</body>
</html>