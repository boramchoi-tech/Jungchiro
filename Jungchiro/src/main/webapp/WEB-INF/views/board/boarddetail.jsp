<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>
</head>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>



<script type="text/javascript">
	/**
	 * 초기 페이지 로딩시 댓글 불러오기
	 */
	
	$(function() {

		selectReply();

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
											function(index, comm) {

												output += "<div><div>"
														+ reply.reply_content
														+ "</div></div>";

												output += "<strong>" + "글쓴이"
														+ " / " + "글쓴이 이메일"
														+ "</strong> / "
														+ reply.reply_date;
												+"<br/><br/>";

												//output += "<c:if test='${not empty sessionLoginMember.MEMBER_CODE || not empty sessionLoginKakao.MEMBER_CODE || not empty sessionLoginNaver.MEMBER_CODE}'>"

												output += "<input type='button' class='btn' value='수정' id='updateBtn' onclick='updateFormToggle("
														+ reply.reply_seq
														+ ")'/>&nbsp;&nbsp;&nbsp;";

												output += "<input type='button' class='btn' value='삭제' onclick='deleteComment("
														+ reply.board_seq
														+ ","
														+ reply.reply_seq
														+ ")'/><br/>";
												//+"</c:if>";

												output += "<form action='/replyupdate.do' method='post' id='updateForm" + reply.reply_seq + "' style='display:none;'>"
														+ "<input type='hidden' name='board_seq' value='" + reply.board_seq + "'/>"
														+ "<input type='hidden' name='reply_seq' value='" + reply.reply_seq + "'/>"
														+ "<textarea cols='50' rows='3' name='reply_content' placeholder=''>"
														+ reply.reply_content
														+ "</textarea>"
														+ "<br/><input type='button' value='수정' onclick='updateComment("
														+ reply.reply_seq
														+ ")'/>"
														+ "&nbsp;&nbsp;&nbsp;"
														+ "<input type='button' value='취소' onclick='updateCancel("
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

		$.ajax({
			type : 'POST',
			url : "/replyinsert.do",
			data : {
				board_seq : board_seq,
				reply_content : reply_content
			},
			datatype : "text",

			success : function(args) {
				selectReply();
				$("#replySubmit").find("textarea[name='reply_content']")
						.val("");

			},
			error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}

		});
	}

	function deleteReply(board_seq, reply_seq) {

		$.ajax({
			type : "POST",
			url : "/replydelete.do",
			data : {
				board_seq : board_seq,
				reply_seq : reply_seq
			},
			datatype : "text",

			success : function(args) {
				alert("댓글 삭제 성공!!")
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
			url : "/replyupdate.do",
			data : {
				board_seq : board_seq,
				reply_seq : reply_seq,
				reply_content : reply_content
			},
			datatype : "text",

			success : function(args) {
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


	<h1>글보기</h1>

	<form name="readForm" role="form" method="post">
		<input type="hidden" id="board_seq" name="board_seq"
			value="${board.board_seq}" /> <input type="hidden" id="page"
			name="page" value="${search.page}"> <input type="hidden"
			id="perPageNum" name="perPageNum" value="${search.perPageNum}">
		<input type="hidden" id="searchType" name="searchType"
			value="${search.searchType}"> <input type="hidden"
			id="keyword" name="keyword" value="${search.keyword}">
	</form>

	<table border="1">
		<tr>
			<th>작성자</th>
			<td>테스트<%-- >${member.member_name}/${member.member_email} --%></td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${board.board_title }</td>
		</tr>

		<tr>
			<th>카테고리</th>
			<td>${board.board_category }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${board.board_content }		
			</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="button" value="수정"
				onclick="location.href='boardupdateform.do?board_seq=${board.board_seq}'">
				<input type="button" value="삭제"
				onclick="location.href='boarddelete.do?board_seq=${board.board_seq}'" />
				<input type="button" value="글 목록"
				onclick="location.href ='boardlist.do?page=${search.page}&perPageNum=${search.perPageNum}&searchType=${search.searchType}&keyword=${search.keyword}'"></td>
		</tr>
	</table>

	<!-- start :: ajax 댓글 리스트 -->
	<div>
		<h5>댓글</h5>
		<div id="ajaxReplyForm"></div>
		<!-- end :: ajax 댓글 리스트 -->

		<!-- start :: 댓글 달기 -->
		<form action="/replyinsert.do" method="post" id="replySubmit">
			<input type="hidden" name="board_seq" value="${board.board_seq }" />
			<div>
				<textarea cols="50" rows="5" name="reply_content"
					placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
				<br /> <input type="button" value="댓글달기" onclick="insertReply();" />

			</div>

		</form>
		<!-- end :: Comment Form-->
	</div>


	<%@ include file="/WEB-INF/views/form/footer.jsp"%>


</body>

</html>