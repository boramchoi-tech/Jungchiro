<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<title>정치로</title>
<!-- START :: CSS -->
<style type="text/css">

	#moreBoard{
		cursor: pointer;
		text-align: center;
		width: auto;
		height: 50px;
	}
	
	#moreBill{
		cursor: pointer;
		text-align: center;
		width: auto;
		height: 50px;
	}
	
	.arrow{
		width: 20px;
		height: 15px;
	}
	
	h1, h2, h3, span{
		font-family: 'Do Hyeon', sans-serif; 
	}
	
	span{
		font-size: 25px;
	}
	
	.totalUpdate{
		margin-top: 5%;
	}
	
	
	.replyList{
		margin-top: 5%;
		margin-bottom: 5%;
		width: 100%;
	}
	
	.LikeNews{
		width: 100%;
		display: inline-block;
	}
	
	.Like_left{
		display: inline-block;
		float: left;
		width: 48%;
	}
	
	.Like_right{
		display: inline-block;
		float: right;
		width: 48%;
	}
	
	.profileUpdate{
		margin-top: 5%;
	}
	
	.favList{
		display: inline-block;
		margin-top: 5%;
		width: 100%;
	}
	
	.boardFav{
		display: inline-block;
		float: left;
		width: 48%;
	}
	
	.billFav{
		display: inline-block;
		float: right;
		width: 48%;
	}
	
	th, td{
		text-align: center;
	}
	
	.profile{
		font-size: 40px;
		line-height: 40px;
	}
	
	.image{
		width: 40px;
		height: 40px;
		margin-bottom: 15px;
	}
	
	.title{
		height: 40px;
	}
	
	.btn{
		float: right;
		margin-left: 5px;
	}
	
	.delete{
		float: right;
	}
	
	.moreLook{
		margin-top: 10%;
		text-align: center;
	}
	
	.password{
		width: 150px;
	}
	
	.confirm{
		text-align: center;
		font-size: 20px;
	}

</style>
<!-- END :: CSS -->
<!-- START :: JAVASCRIPT -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$("#boardDelete").submit(function(){
			if($("#boardDelete input:checked").length == 0){
				alert("하나 이상 체크해주세요!");
				return false;
			};
		});
		
		$("#replyDelete").submit(function(){
			if($("#replyDelete input:checked").length == 0){
				alert("하나 이상 체크해주세요!");
				return false;
			}
		});
		
		$("#billDelete").submit(function(){
			if($("#billDelete input:checked").length == 0){
				alert("하나 이상 체크해주세요!");
				return false;
			}
		});	
		
	});
	
	function boardAllChks(bool){
		var boardChks = document.getElementsByName("boardChk");
		for(var i = 0; i < boardChks.length; i ++){
			boardChks[i].checked = bool;
		};
	};

	
	function billAllChks(bool){
		var billChks = document.getElementsByName("billChk");
		for(var i = 0; i < billChks.length; i ++){
			billChks[i].checked = bool;
		}
	}
	
	function replyAllChks(bool){
		var replyChks = document.getElementsByName("replyChk");
		for(var i = 0; i < replyChks.length; i ++){
			replyChks[i].checked = bool;
		}
	}

	
	/*
	* 회원 탈퇴
	*/
	function dropOut(){
		
		var member_id = $("#memberIdId").val().trim();
		console.log("member_id : " + member_id);
		
		var confirm = window.confirm("탈퇴 하시는 것이 맞습니까?");

		if( confirm ){
			
			var ajax03 = new ComAjax();
			
			var dropId = {
					"member_id" : member_id
			}
			
			ajax03.url("/poli/dropId.do");
			ajax03.param(dropId);
			
			ajax03.param(dropId);
			
			ajax03.success(function(msg){
				
				if(msg.isDrop == true){
					
					alert("탈퇴 성공하셨습니다.");
					
					$("#logoutBtn").trigger("click");
					
				} else {
					alert("예상치 못한 오류 발생으로 탈퇴 실패하셨습니다.");
				}
				
			});
			
		ajax03.call();
		
		} else {
			return false;
		}
				
	}
	
	/*
	* 게시판 즐겨찾기 더보기
	*/
	function moreBoardFav(){
		
		var member_seq = parseInt($("#member_seq").val().trim());
		var seq = parseInt($("#seq").val());
		console.log("member_seq : " + member_seq + "  seq : " + seq );
	
		var start = (seq*5) + 1;
		var end = start + 4;

		console.log("start : " + start + "end : " + end);
		
		var MoreBoard = {
				"member_seq" : member_seq,
				"start" : start,
				"end" : end				
		}
		
		console.log(MoreBoard);
		
		var ajax = new ComAjax();
		ajax.url("/poli/checkMoreBoardFavList.do");
		ajax.param(MoreBoard);
		
		ajax.success(function(msg){
			console.log(msg);
			
			if(msg.isTrue == true){
				
				var MoreBoardList = {
						"member_seq" : member_seq,
						"start" : start,
						"end" : end
				}
				
				var ajax01 = new ComAjax();
				ajax01.url("/poli/getMoreBoardList.do");
				ajax01.param(MoreBoardList);
				
				ajax01.success(function(result){
					if(result.getMoreBoardList != null){
						
						console.log(result.getMoreBoardList);
						
						$.each(result.getMoreBoardList, function(key, val){
							
							$("#insertMoreBoardFav").append(
									"<tr id='moreSeq'>"+
									"<td><input type='checkbox' name='boardChk' value='"+val.board_seq+"'></td>" +
									"<td>"+val.board_seq+"</td>" +
									"<td><a href='/poli/boarddetail.do?board_seq="+val.board_seq+"'>"+val.board_title+"</a></td>" +
									"</tr>"							
							);
							
							if(result.getMoreBoardList.length < end){
								$("#moreBoard").parent().remove();
							} 
						});
						seq += 1;
						$("#seq").val(seq);
						console.log(seq);
					
					}
				})
				ajax01.call();
				
			} else {
				$("#moreBoard").parent().remove();
				alert("더 추가된 게시물이 없습니다.");
				
			}
			
		});
		
		ajax.call();
		
	}
	
	/*
	* 의안 즐겨찾기 더보기
	*/
	function moreBillFav(){
		
		var member_seq = parseInt($("#member_seq").val().trim());
		var sequence = parseInt($("#sequence").val());
		console.log("member_seq : " + member_seq + "  sequence : " + sequence );
	
		var starting = (sequence*5) + 1;
		var ending = starting + 4;

		console.log("start : " + starting + "end : " + ending);
		
		var MoreBill = {
				"member_seq" : member_seq,
				"start" : starting,
				"end" : ending				
		}
		
		console.log(MoreBill);
		
		var ajax = new ComAjax();
		ajax.url("/poli/checkMoreBillFavList.do");
		ajax.param(MoreBill);
		
		ajax.success(function(msg){
			console.log(msg);
			
			if(msg.isTrue == true){
				
				var MoreBillList = {
						"member_seq" : member_seq,
						"start" : starting,
						"end" : ending
				}
				
				var ajax01 = new ComAjax();
				ajax01.url("/poli/getMoreBillList.do");
				ajax01.param(MoreBillList);
				
				ajax01.success(function(message){
					
					if(message.getMoreBillList != null){
						
						console.log(message.getMoreBillList);
						
						$.each(message.getMoreBillList, function(key, val){
							
							$("#insertMoreBillFav").append(
									"<tr id='moreSequence'>"+
									"<td><input type='checkbox' name='billChk' value='"+val.bill_id+"'></td>" +
									"<td>"+val.bill_id+"</td>" +
									"<td>"+val.bill_name+"</a></td>" +
									"</tr>"							
							);
							
							
							if(message.getMoreBillList.length < ending){
								$("#moreBill").parent().remove();
							} 
							
						});
						sequence += 1;
						$("#sequence").val(sequence);
						console.log(sequence);
					
					}
				});
				
				ajax01.call();
				
			} else {
				$("#moreBill").parent().remove();
				alert("더 추가된 게시물이 없습니다.");	

			}
			
		});
		
		ajax.call();
		
	}
	

</script>
<!-- END :: JAVASCRIPT -->
</head>
<body>
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
	
	<input type="hidden" name="member_seq" id="member_seq" value="${principal.member_seq }">
	<input type="hidden" id="memberIdId" value="${principal.username }">
	<div class="container">
			
		<img class="image" alt="reply" src="/poli/resources/images/email.png">
		<span class="profile">댓글 알림</span>

		<!-- START :: 변경사항 알림 모아보기 -->
		<div class="totalUpdate">
				
				<!-- 새로 달린 댓글 리스트 -->
				<div class="replyList">
					<span>댓글 소식</span>
					
					<form action="/poli/replyNotificationDelete.do" method="post" id="replyDelete">
						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						<input type="hidden" name="member_seq" value="${principal.member_seq }">
					
						<table class="table table-hover">
						
							<colgroup>
								<col width="50">
								<col width="80">
								<col width="300">
								<col width="520">	
							</colgroup>
							
							<tr>
								<th><input type="checkbox" name="replyAll" onclick="replyAllChks(this.checked);"></th>
								<th>글 번호</th>
								<th>제목</th>
								<th>댓글</th>
							</tr>
							<c:choose>
								<c:when test="${empty notificationReplyList }">
									<tr>
										<td colspan="4" align="center">
											-------- 새로 달린 댓글이 없습니다 --------
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${notificationReplyList }" var="NotificationReplyDto">
										
										<tr>
											<td><input type="checkbox" name="replyChk" value="${NotificationReplyDto.board_seq }"></td>
											<td>${NotificationReplyDto.board_seq }</td>
											<td><a class="deleteReply" id="${NotificationReplyDto.board_seq }" href="/poli/boarddetail.do?board_seq=${NotificationReplyDto.board_seq }">${NotificationReplyDto.board_title }</a></td>
											<td>${NotificationReplyDto.reply_content }</td>
										</tr>							
										
									</c:forEach>
								</c:otherwise>					
							</c:choose>			
							
						</table>
						
					<input type="submit" value="삭제하기" id="delete" class="btn btn-light">				
						
					</form>
				
				<c:if test="${!empty notificationReplyList }">
				
					<!-- 댓글 전체 삭제 -->
					<form action="/poli/replyNotificationDeleteAll.do" method="post">
						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						<input type="hidden" name="member_seq" value="${principal.member_seq }"/>
						<input type="submit" value="전체 삭제하기" class="btn btn-dark"/>
					</form>
				
				</c:if>
				
			</div>
				<img class="image" alt="reply" src="/poli/resources/images/new.png">
				<span class="profile">최신 소식 업데이트!</span>			
				<br><br><br>
				<div class="LikeNews">
					<!-- 하루 안에 추가한 게시판 즐겨찾기 -->
					<div class="Like_left">	
						<span>게시판 즐겨찾기 소식</span>
						
						<table class="table table-hover">
						
							<colgroup>
								<col width="100">
								<col width="300">
								<col width="100">	
							</colgroup>
							
							<tr>
								<th>글 번호</th>
								<th>제목</th>
								<th>작성 시간</th>
							</tr>
							
							<c:choose>
								<c:when test="${empty boardFavUpdateList}">
										<tr>
											<td colspan="3" align="center">
												-------- 새로 추가된 즐겨찾기 포스트가 없습니다 --------
											</td>
										</tr>			
								</c:when>
								<c:otherwise>
									<c:forEach items="${boardFavUpdateList}" var="boardFavUpdateDto">
										
											<tr>
												<td>${boardFavUpdateDto.board_seq}</td>
												<td>${boardFavUpdateDto.board_title}</td>
												<td>${boardFavUpdateDto.board_date }</td>
											</tr>
										
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				
				<div class="Like_right">
					
					<!-- 하루 안에 추가한 의안 즐겨찾기 -->
					<span>의안 즐겨찾기 소식</span>
				
					<table class="table table-hover">
						
						<colgroup>
							<col width="100">
							<col width="320">
						</colgroup>
						
								<tr>
								    <th>의안 ID</th>
								    <th>의안명</th>
							    </tr>
						
						<c:choose>
							<c:when test="${empty billFavUpdateList}">
								<tr>
									<td colspan="3" align="center">
										-------- 새로 추가된 즐겨찾기 의안이 없습니다 --------
									</td>
								</tr>
							</c:when>
							<c:otherwise>

								<c:forEach items="${billFavUpdateList }" var="billFavUpdateDto">
									<tr>
										<td>${billFavUpdateDto.bill_id}</td>
										<td>${billFavUpdateDto.bill_name }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						
					</table>
				</div>
			</div>
		</div>
		<!-- END :: 변경사항 알림 모아보기(sysdate 계산해서 하루 전에 등록된 글 다 뜨게 하기) -->
		
		<!-- START :: 개인정보 영역-->
		<div class="profileUpdate">
			<div class="introduction">
				<img class="image" alt="reply" src="/poli/resources/images/user.png">
				<span class="profile">프로필 보기</span>				
			</div>
			<br><br><br>
			
			<!-- 비밀번호 변경할 떄 암호화 같이 해야함! -->
			<table class="table table-hover">
			
				<colgroup>
					<col width="100">
					<col width="100">	
				</colgroup>

					<tr>
						<th>아이디</th>
						<td id="member_id">${principal.username}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${principal.member_name}</td>
					</tr>
					
			</table>
			
			<div class="clickButton">
				<input type="button" value="탈퇴하기" class="btn btn-danger" onclick="dropOut();">		
				<button type="button" data-toggle="modal" data-target="#passwordUpdate" class="btn btn-light">
					비밀번호 변경
				</button>
			</div>
		
		</div>
		
		  <!-- 비밀번호 변경 전 확인용 모달 -->
		  <div class="modal fade" id="passwordUpdate">
		    <div class="modal-dialog">
		      <div class="modal-content">
		      	<input type="hidden" id="memberId" value="${principal.username }">
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <span class="confirm modal-title">비밀번호를 다시 입력해주세요.</span>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body" align="center">
		          <input type="password" class="form-control" id="password" required="required">
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-primary" onclick="confirmPw();">확인</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		
		<!-- END :: 개인정보 영역-->		
		
		<!-- START :: 즐겨찾기 영역 -->
		<br><br><br>
		<img class="image" alt="reply" src="/poli/resources/images/bookmark.png">
		<span class="profile">즐겨찾기</span>
		
		<div class="favList">
			<div class="boardFav">
			<span>게시판 즐겨찾기</span>
				
					<!-- 게시판 즐겨찾기 -->
					<form action="/poli/boardFavDelete.do" method="post" id="boardDelete">
						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						<input type="hidden" name="member_seq" value="${principal.member_seq }">
						
						<table class="table table-hover" id="insertMoreBoardFav">
						
									<colgroup>
										<col width="80">
										<col width="100">
										<col width="300">	
									</colgroup>
						
								<tr>
									<th><input type="checkbox" name="boardAll" onclick="boardAllChks(this.checked);"></th>
									<th>글 번호</th>
									<th>제목</th>
								</tr>
								<c:choose>
								<c:when test="${empty boardFavPartialList }">
									<tr>
										<td colspan="3" align="center">
											-------- 등록된 즐겨찾기 포스트가 없습니다 --------
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${boardFavPartialList }" var="boardFavDto">
										<tr>
											<td>
												<input type="checkbox" name="boardChk" value="${boardFavDto.board_seq }">
											</td>
											<td>
												${boardFavDto.board_seq }
											</td>
											<td>
												<a href="/poli/boarddetail.do?board_seq=${boardFavDto.board_seq }">
													${boardFavDto.board_title }
												</a>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>		
						
						<input type="submit" value="삭제하기" class="btn btn-light">		
					</form>
					
					<c:if test="${!empty boardFavNum }">
					
						<div class="moreLook">
							<input type="hidden" id="seq" value="${seq }">
							<div id="moreBoard" onclick="moreBoardFav();">
							<img src='/poli/resources/images/down-arrow.png' class="arrow"/>								
								<span>더 보기</span>
							</div>
						</div>
						
					</c:if>
			</div>
			
			<div class="billFav">
			<span>의안 즐겨찾기</span>
				
					<!-- 의안 즐겨찾기 -->
					<form action="/poli/billFavDelete.do" method="post" id="billDelete">
						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						<input type="hidden" name="member_seq" value="${principal.member_seq }">
						
						<table class="table table-hover" id="insertMoreBillFav">
						
									<colgroup>
										<col width="50">
										<col width="80">
										<col width="300">
									</colgroup>
						
								<tr>
									<th><input type="checkbox" name="billAll" onclick="billAllChks(this.checked);"></th>
									<th>의안 ID</th>
									<th>의안명</th>
								</tr>
								<c:choose>
								<c:when test="${empty billFavPartialList }">
									<tr>
										<td colspan="4" align="center">
											-------- 등록된 즐겨찾기 포스트가 없습니다 --------
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${billFavPartialList }" var="billFavDto">
										<tr>
											<td>
												<input type="checkbox" name="billChk" value="${billFavDto.bill_id }">
											</td>
											<td>
												${billFavDto.bill_id }
											</td>
											<td>
												${billFavDto.bill_name }

											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>		
						<input type="submit" value="삭제하기" class="btn btn-light">	
					</form>
					
					<c:if test="${!empty billFavNum }">
					
						<div class="moreLook">
							<input type="hidden" id="sequence" value="${sequence }">
							<div id="moreBill" onclick="moreBillFav();">
								<img src='/poli/resources/images/down-arrow.png' class="arrow"/>
								<span>더 보기</span>
							</div>
						</div>
						
					</c:if>
			</div>		
		</div>	
	</div>
	
	<script type="text/javascript">

		$(".deleteOneReply").click(function(){
			
			var board_seq = $(this).attr("id");
			console.log(board_seq);
		
		});
		
		function confirmPw(){			
		
			var member_id = $("#memberId").val().trim();
			var pw = $("#password").val().trim();
			
			console.log("id : " + member_id);
			console.log("비밀번호 : " + pw);
			
			var ajaxpw = new ComAjax();
			
			var confirmPassword = {
					"member_id" : member_id,
					"member_pw" : pw
			}
			
			ajaxpw.url("/poli/confirmPw.do");
			ajaxpw.param(confirmPassword);
			ajaxpw.success(function(msg){
				
				if(msg.isPw == true){
					var confirmPw = window.confirm("비밀번호가 확인되었습니다. \n 수정하시겠습니까?");
					
					if(confirmPw){
						location.href="/poli/changePwForm.do?";
					} else {
						alert("비밀번호를 다시 입력해주세요.");
					}
				};
			
			});
			
			ajaxpw.call();
		};

	</script>
	
	
	<%@ include file="/WEB-INF/views/form/footer.jsp" %>
	
</body>
</html>