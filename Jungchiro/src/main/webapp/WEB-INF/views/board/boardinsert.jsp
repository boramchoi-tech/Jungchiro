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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

</head>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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


<body>


	<%@ include file="/WEB-INF/views/form/header.jsp"%>
	<div class="nanum">

		<div class="container">

			<form action="/poli/boardinsertres.do" method="post"
				name="boardinsert" class="form-inline" role="form">
				<input name="${_csrf.parameterName}" type="hidden"
					value="${_csrf.token}" />

				<div>

					<p id="category">
						<select class="form-control" name="board_category">
							<option value="">카테고리 선택</option>
							<option value="의안">의안</option>
							<option value="시사">시사</option>
							<option value="이슈">이슈</option>
							<option value="기타">기타</option>
						</select>
					</p>

					<p id="title">
						<input type="text" class="form-control col-10" name="board_title"
							placeholder="제목">
					</p>



					<p>
						<textarea rows="10" cols="60" name="board_content"
							id="board_content"></textarea>
						<script>
							CKEDITOR.replace("board_content", {
								filebrowserUploadUrl : "/poli/imageUpload.do"
							});
						</script>
					</p>


					<p>
						<input type="button" value="글쓰기" class="btn btn-outline-primary" onclick="writeCheck()"> <input
							type="hidden" name="member_seq" value="${principal.member_seq}">
						<input type="button" value="취소" class="btn btn-outline-danger" onclick="location.href ='/poli/boardlist.do?page=1'">
					</p>

				</div>
			</form>

		</div>
	</div>


	<%@ include file="/WEB-INF/views/form/footer.jsp"%>
</body>
</html>