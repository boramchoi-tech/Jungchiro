<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="/poli/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	function updateCheck() {
		var form = document.boardupdate;

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

		alert("글 수정에 성공했습니다.")
		form.submit();

	}
</script>


</head>
<body>

	<%@ include file="/WEB-INF/views/form/header.jsp"%>


	<h1>글 수정</h1>
	<form action="/poli/boardupdateres.do" method="post" name="boardupdate">
		<input name="${_csrf.parameterName}" type="hidden"
			value="${_csrf.token}" /> <input type="hidden" name="board_seq"
			value="${board.board_seq}">


		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" value="${board.board_title }"
					name="board_title"></td>
			</tr>

			<tr>
				<th>작성자</th>
				<td>${principal.username }</td>
			</tr>

			<tr>
				<th>카테고리</th>
				<td><select name="board_category">
						<option value="${board.board_category }">${board.board_category }</option>
						<option value="">카테고리 선택</option>
						<option value="의안">의안</option>
						<option value="시사">시사</option>
						<option value="이슈">이슈</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>

			<tr>

				<th>내용</th>
				<td><textarea rows="10" cols="60" name="board_content"
						id="board_content">
						${board.board_content }
				    </textarea> <script>
									CKEDITOR
											.replace(
													"board_content",
													{
														filebrowserUploadUrl : "/poli/imageUpload.do"
													});
								</script></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="button" value="수정"
					onclick="updateCheck()"> <input type="button" value="취소"
					onclick="location.href='/poli/boarddetail.do?board_seq=${board.board_seq}'"></td>
			</tr>
		</table>
	</form>

	<%@ include file="/WEB-INF/views/form/header.jsp"%>


</body>
</html>