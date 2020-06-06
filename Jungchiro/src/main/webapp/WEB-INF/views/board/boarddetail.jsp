<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
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

<!-- START :: CSS -->
<style type="text/css">
#insertFav {
	cursor: pointer;
}

.yellowstar {
	height: 15px;
	width: 15px;
	cursor: pointer;
}

.blackstar {
	height: 15px;
	width: 15px;
	cursor: pointer;
}

th {
	color: #007eff;
	text-decoration: bold;
}

#date {
	color: #007eff;
}

#content{
	text-size: 13px;
}
</style>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>



<script type="text/javascript">
	/**
	 * 초기 페이지 로딩시 댓글 불러오기
	 */

	$(function() {

		selectReply();

		/*
		 * 즐겨찾기 등록 여부에 따른 아이콘 표시
		 */
		var member_seq = document.getElementById("member_seq").value;
		var board_seq = document.getElementById("board_seq").value;
		console.log(board_seq);

		var Fav = {
			"member_seq" : member_seq,
			"board_seq" : board_seq
		}

		var ajax = new ComAjax();
		ajax.url("/poli/isFav.do");
		ajax.param(Fav);

		ajax
				.success(function(msg) {

					if (msg.isFav == true) {

						$("#isFav")
								.append(
										"<td><img src='/poli/resources/images/yellow star.png' class='yellowstar' onclick='deleteFav();'/></td>")
					} else {
						$('#isFav')
								.append(
										"<td><img src='/poli/resources/images/black star.png' class='blackstar' onclick='insertFav();'/></td>");
					}
				});

		ajax.call();

	});

	/**
	 * 댓글 불러오기(Ajax)
	 */
	function selectReply() {
		var board_seq = <c:out value="${board.board_seq }" />;

		$
				.getJSON(
						"/poli/replylist.do",
						{
							board_seq : board_seq
						},
						function(data) {

							var output = "";

							$
									.each(
											data,
											function(index, reply) {

												output += "<h5 class='card-title'>"
														+ reply.member_id
														+ "</h5>"
														+ "<span class='card-text' id='date'>"
														+ reply.reply_date
														+ "</span>" + "<br/>";

												output += "<div><div class='card-text' id='content'>"
														+ reply.reply_content
														+ "</div></div>";

												output += "<input type='button' class='btn btn-outline-success col-1' value='수정' id='updateBtn' onclick='updateFormToggle("
														+ reply.reply_seq
														+ ")'/>&nbsp;&nbsp;&nbsp;";

												output += "<input type='button' class='btn btn-outline-danger col-1' value='삭제' onclick='deleteReply("
														+ reply.board_seq
														+ ","
														+ reply.reply_seq
														+ ")'/><br/><br/>";

												output += "<form action='/replyupdate.do' method='post' id='updateForm" + reply.reply_seq + "' style='display:none;'>"
														+ "<input type='hidden' name='board_seq' value='" + reply.board_seq + "'/>"
														+ "<input type='hidden' name='reply_seq' value='" + reply.reply_seq + "'/>"
														+ "<textarea cols='50' rows='3' name='reply_content' placeholder=''>"
														+ reply.reply_content
														+ "</textarea>"
														+ "<br/><input type='button' class='btn btn-outline-success col-1' value='수정' onclick='updateReply("
														+ reply.reply_seq
														+ ")'/>"
														+ "&nbsp;&nbsp;&nbsp;"
														+ "<input type='button' class='btn btn-outline-danger col-1' value='취소' onclick='updateCancel("
														+ reply.reply_seq
														+ ")'/>" + "</form>";

											});

							if (output == "") {
								output += "<div>---등록된 댓글이 없습니다---</div>";
							}
							$("#ajaxReplyForm").html(output);
						})

	}

	function insertReply() {
		//var MEMBER_CODE = $("#commentSubmit").find("input[name='MEMBER_CODE']")
		//.val();
		var board_seq = $("#replySubmit").find("input[name='board_seq']").val();
		var reply_content = $("#replySubmit").find(
				"textarea[name='reply_content']").val();
		var member_seq = $("#member_seq").val().trim();
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");

		$.ajax({
			type : 'POST',
			url : "/poli/replyinsert.do",
			data : {
				member_seq : member_seq,
				board_seq : board_seq,
				reply_content : reply_content
			},
			datatype : "text",
			beforeSend : function(xhr) { //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
				xhr.setRequestHeader(header, token);
			},
			success : function(args) {
				alert("댓글 쓰기 성공")
				selectReply();
				$("#replySubmit").find("textarea[name='reply_content']")
						.val("");

			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}

		});
	}

	function deleteReply(board_seq, reply_seq) {

		$.ajax({
			type : "POST",
			url : "/poli/replydelete.do",
			data : {
				board_seq : board_seq,
				reply_seq : reply_seq
			},
			datatype : "text",

			success : function(args) {
				alert("댓글 삭제 성공")
				selectReply();
			},

			error : function(request, status, error) {
				alert("통신 실패");
				alert("code : " + request.status + "\n" + "message : "
						+ request.responseText + "\n" + "error : " + error);
			}
		})
	}

	function updateFormToggle(reply_seq) {
		$("#updateForm" + reply_seq).show();
	}

	function updateCancel(reply_seq) {
		$("#updateForm" + reply_seq).hide();
	}
	// update : ajax : 댓글 수정
	function updateReply(reply_seq) {
		var board_seq = $("#updateForm" + reply_seq).find(
				"input[name='board_seq']").val();
		var reply_seq = $("#updateForm" + reply_seq).find(
				"input[name='reply_seq']").val();
		var reply_content = $("#updateForm" + reply_seq).find(
				"textarea[name='reply_content']").val();

		$.ajax({
			type : "POST",
			url : "/poli/replyupdate.do",
			data : {
				board_seq : board_seq,
				reply_seq : reply_seq,
				reply_content : reply_content
			},
			datatype : "text",

			success : function(args) {
				alert("댓글 수정 성공")
				selectReply();
			},

			error : function(request, status, error) {
				alert("통신 실패");
				alert("code : " + request.status + "\n" + "message : "
						+ request.responseText + "\n" + "error : " + error);
			}
		})
	}
</script>
<body>

	<%@ include file="/WEB-INF/views/form/header.jsp"%>

	<div class="container">
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="board_seq" name="board_seq"
				value="${board.board_seq}" /> <input type="hidden" id="page"
				name="page" value="${search.page}"> <input type="hidden"
				id="perPageNum" name="perPageNum" value="${search.perPageNum}">
			<input type="hidden" id="searchType" name="searchType"
				value="${search.searchType}"> <input type="hidden"
				id="keyword" name="keyword" value="${search.keyword}">
		</form>

		<!-- 즐겨찾기 등록 여부 확인 -->
		<input type="hidden" id="member_seq" value="${loginDto.member_seq }" />
		<input type="hidden" id="board_seq" value="${board.board_seq }">

		<table class="table table-bordered">

			<tr>
				<th>제목</th>
				<td colspan="5">${board.board_title }</td>
				<th>작성자</th>
				<td>${board.member_id}</td>
			</tr>

			<tr id="isFav">
				<th>카테고리</th>
				<td>${board.board_category }</td>
				<th>작성시간</th>
				<td>${board.board_date }</td>
				<th>조회수</th>
				<td>${board.board_count }</td>
				<th>즐겨찾기 등록</th>
			</tr>
			<tr>
				<td colspan="8"><textarea rows="10" cols="60"
						readonly="readonly" class="form-control-plaintext">
					${board.board_content }		
				</textarea></td>
			</tr>

			<!-- 글 수정 / 삭제 -->
			<c:if test="${principal.member_seq eq board.member_seq }">
				<tr>
					<td colspan="8" align="right"><input type="button" class="btn btn-success" value="수정"
						onclick="location.href='/poli/boardupdateform.do?board_seq=${board.board_seq}&member_seq=${board.member_seq }'">
						<input type="button" class="btn btn-danger" value="삭제"
						onclick="location.href='/poli/boarddelete.do?board_seq=${board.board_seq}'" />
						<input type="button" class="btn btn-primary" value="글 목록"
						onclick="location.href ='/poli/boardlist.do?page=${search.page}&perPageNum=${search.perPageNum}&searchType=${search.searchType}&keyword=${search.keyword}'">
					</td>
				</tr>
			</c:if>
		</table>

		<!-- start :: ajax 댓글 리스트 -->
		<div class="card">
			<div id="ajaxReplyForm"></div>
			<!-- end :: ajax 댓글 리스트 -->

			<!-- start :: 댓글 달기 -->
			<form action="/poli/replyinsert.do" method="post" id="replySubmit">
				<input type="hidden" name="board_seq" value="${board.board_seq }" />
				<div>
					<textarea cols="50" rows="5" name="reply_content"
						class="form-control col-6" placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
					<br /> <input type="button" class="btn btn-outline-primary" value="댓글달기" onclick="insertReply();" />

				</div>

			</form>
			<!-- end :: Comment Form-->
		</div>

	</div>


	<script type="text/javascript">
		/*
		 * 즐겨찾기 등록 
		 */
		function insertFav() {

			var member_seq = document.getElementById("member_seq").value;
			var board_seq = document.getElementById("board_seq").value;
			console.log("member_seq :" + member_seq + "board_seq : "
					+ board_seq);

			var boardFav = {
				"member_seq" : member_seq,
				"board_seq" : board_seq
			}

			var ajax = new ComAjax();
			ajax.url("/poli/insertBoardFav.do");
			ajax.param(boardFav);

			ajax
					.success(function(msg) {

						if (msg.isInsert == true) {

							$(".blackstar").parent().remove();

							$("#isFav")
									.append(
											"<td><img src='/poli/resources/images/yellow star.png' class='yellowstar' onclick='deleteFav();'/></td>");

							var confirm = window
									.confirm("즐겨찾기에 등록되었습니다. \n 마이페이지로 이동하시겠습니까?");

							if (confirm) {
								location.href = "/poli/mypage.do?member_seq="
										+ member_seq;
							} else {
								return false;
							}
						}
					});

			ajax.call();

		}

		/*
		 * 즐겨찾기 취소
		 */

		function deleteFav() {

			var member_seq = document.getElementById("member_seq").value;
			var board_seq = document.getElementById("board_seq").value;
			console.log("member_seq :" + member_seq + "board_seq : "
					+ board_seq);

			var CancleBoardFav = {
				"member_seq" : member_seq,
				"board_seq" : board_seq
			}

			var ajax = new ComAjax();
			ajax.url("/poli/cancleBoardFav.do");
			ajax.param(CancleBoardFav);

			ajax
					.success(function(msg) {

						if (msg.isCancle == true) {

							$(".yellowstar").parent().remove();

							$("#isFav")
									.append(
											"<td><img src='/poli/resources/images/black star.png' class='blackstar' onclick='insertFav();'/></td>");
						}
						;

					});

			ajax.call();

		}
	</script>

	<%@ include file="/WEB-INF/views/form/footer.jsp"%>


</body>

</html>