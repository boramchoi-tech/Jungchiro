<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>정치로</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style type="text/css">

	h1{
		font-family: 'Do Hyeon', sans-serif;
	}
	
	.chatListShow{
		display: inline-block;
		font-family: 'Do Hyeon', sans-serif;
		font-size: 35px;
	}
	
	.create-room{
		display: inline-block;
		margin-left: 10%;	
		width: 100%;
	}
	
	.createRoom{
		font-size: 35px;
	}
	
	.form-control{
		width: 400px;
		display: inline-block;
	}
	
	.nameChatroom{
		display: inline-block;
	}
	
	span{
		font-family: 'Do Hyeon', sans-serif;
		font-weight: bold;
		font-size: 20px;
	}
	
	.makeRoom{
		display: inline-block;
	}
	
	.category{
		display: inline-block;
	}
	
	#roomMake{
		display: inline-block;	
		margin-left: 8%;	
		height: 38px;
	}
	
	.select{
		width: 150px;
		height: 38px;
		border-radius: 3px;
		display: inline-block;
		font-family: 'Do Hyeon', sans-serif;
		border-color: #D5D8DC;
	}
	
	table{
		width: 800px auto;
		font-family: 'NanumSquare';
	}
	
	.findMyRoom{
		font-family: 'Do Hyeon', sans-serif;
		font-size: 27px;
		margin : auto;
		line-height: 30px;
	}
	
	.images{
		width: 35px;
		height: 35px;
		display: inline-block;
		margin-right: 2%;
		margin-top: -1%;
	}
	
	.selectedCategory{
		font-weight: bold;
		width: 80px;
	}
	
	tr{
		height: 40px;
	}
	
	.enterBtn{
		width: 500px;
		height: 100%;
		background-color: #FDFEFE;
		border: none;
	}
	
	.enterBtn:hover{
		background-color: #A2D9CE;
	}
	
	#chatName{
		display: inline-block;
		width: 200px;
	}

	
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
		<sec:authentication var="principal" property="principal" />
		
		<br/>
		<div class="container">		
			<div>
				<img class="images" alt="채팅방 만들기" src="/poli/resources/images/message.png">				
				<span class="createRoom">채팅방 만들기</span>
				
				<br/><br/>
				
				<div class="create-room">
					<form action="/poli/createroom.do" method="post" id="createRoom">
						<input type="hidden" name="member_seq" value="${principal.member_seq }">
						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						<div class="nameChatroom">
							<span>채팅방 이름</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="form-control" id="chatName" name="chat_name" required><br>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="category">
							<span>카테고리 </span>
							&nbsp;&nbsp;&nbsp;
							<select class="select" name="chat_category">
								<option value="1">의안</option>
								<option value="2">시사</option>
								<option value="3">이슈</option>
								<option value="4">기타</option>
							</select>
						</div>
							<input id="roomMake" type="button" class="btn btn-success" value="만들기">
					</form>
				</div>
			
			</div>
			
			<br/><br/><br/>
			
			<div class="chat-list">
				<img class="images" alt="채팅방 목록 보기" src="/poli/resources/images/conversation.png">								
				<span class="chatListShow">채팅방 목록</span>
				
				<br/><br/>	
				
				<div class="findMyRoom">
					<input type="checkbox" class="mychatlist" value="${principal.member_seq }"> 내가 참여한 채팅방 목록 보기
				</div>
				
				<br/><br/>
				
				<table class="table-borderless">
					<tbody id="chatList">
						<c:if test="${empty chatlist }">
							<tr>
								<td colspan="2">----존재하는 채팅방이 없습니다----</td>
							</tr>
						</c:if>
						<c:if test="${!empty chatlist }">
							<c:forEach items="${chatlist }" var="chatlist">
								<tr>
									<td class="selectedCategory">
										<!-- 1: 의안 / 2: 시사 / 3: 이슈 / 4: 기타 -->
										<c:if test="${chatlist.chat_category eq '1'}">
											<c:out value="의안"/>
										</c:if>
										<c:if test="${chatlist.chat_category eq '2'}">
											<c:out value="시사"/>
										</c:if>
										<c:if test="${chatlist.chat_category eq '3'}">
											<c:out value="이슈"/>
										</c:if>
										<c:if test="${chatlist.chat_category eq '4'}">
											<c:out value="기타"/>
										</c:if>
									</td>
									<td>
									<!-- action="/poli/enterroom.do" method="post"  -->
										<form id="enter_${chatlist.chat_seq } ">
											<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
											<input type="hidden" name="member_seq" value="${principal.member_seq }">
											<input type="hidden" name="chat_seq" value="${chatlist.chat_seq }">
											<input type="button" class="enterBtn" value="${chatlist.chat_name }">
										</form>
	
									</td>
								</tr>
								
							</c:forEach>
						</c:if>
					</tbody>
						
				</table>
				
			</div>
		
		</div>

	<%@ include file="/WEB-INF/views/form/footer.jsp" %>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
<script type="text/javascript">
 		
 	$(function() {
 		$('#roomMake').click(function() {	
 			
 			var chatName = $("#chatName").val();
 			
 			if(chatName == null || chatName == ""){
 				alert("방 이름을 입력해주세요");
 				return false;
 			}
 			
 			$('#createRoom').submit();
 		})

 		var member_seq = $('.mychatlist').val();
 		var $check = $('.mychatlist');
		var seqVal = {"member_seq":member_seq}
		
 		$check.click(function() {
 			$("#chatList").children().remove();
 	 	 	var ajax = new ComAjax();
 	 		ajax.url("/poli/chatlist.do");

 	 		if($check.is(":checked")) {
 	 			// checkbox에 체크했을 경우 member_seq를 보내서 totalCount(member_seq), selectChatList(member_seq) 실행
	 	 		ajax.param(seqVal);
 	 			ajax.success(function(msg) {
 	 				
 	 				if(msg.chatroomCount == 0) {
 		 				$("#chatList").append(
 							"<tr><td colspan='2'>---내가 참여 중인 채팅방이 존재하지 않습니다---</td></tr>"
 						);
 		 				
 		 			} else {
 		 				$("#chatList").append(
 		 	 					$.each(msg, function(key, val) {
 		 	 						if (key == 'chatlist') {
 		 								var list = val;
 		 								for (var i = 0; i < list.length; i++) {
 		 									var str = list[i];
 		 									
 		 									if(str.chat_category == 1) {
 		 										str.chat_category = '의안'
 		 									} else if (str.chat_category == 2) {
 		 										str.chat_category = '시사'
 		 									} else if (str.chat_category == 3) {
 		 										str.chat_category = '이슈'
 		 									} else if (str.chat_category == 4) {
 		 										str.chat_category = '기타'
 		 									}
 		 									
 		 									$('#chatList').append(
 		 										"<tr>"+
 		 						 	 			"<td>"+str.chat_category+"</td>"+
 		 						 	 			"<td>"+
 		 						 	 			"<form action='/poli/enterroom.do' method='post' id='enter_"+str.chat_seq+"'>"+
 		 						 	 			"<input name='${_csrf.parameterName}' type='hidden' value='${_csrf.token}'>"+
 		 						 	 			"<input type='hidden' name='member_seq' value='"+member_seq+"'>"+
 		 						 	 			"<input type='hidden' name='chat_seq' value='"+str.chat_seq+"'>"+
 		 						 	 			"<input type='button' class='enterBtn' value='"+str.chat_name+"'>"+
 		 						 	 			"</td>"+
 		 						 	 			"</tr>"		
 		 									)	
 		 								}
 		 	 						}
 		 	 					})
 		 	 			)
 		 			}
 	 	 			
 	 	 		})
 	 			
 	 		} else {
 	 			// checkbox 해제할 경우 member_seq에 0를 보내서 totalCount(), selectChatList() 실행
 	 			ajax.param({"member_seq":0});
 	 			ajax.success(function(msg) {
 	 				
 	 				if(msg.chatroomCount == 0) {
 		 				$("#chatList").append(
 							"<tr><td colspan='2'>---내가 참여 중인 채팅방이 존재하지 않습니다---</td></tr>"
 						);
 		 				
 		 			} else {
 		 				$("#chatList").append(
 		 	 					$.each(msg, function(key, val) {
 		 	 						if (key == 'chatlist') {
 		 								var list = val;
 		 								for (var i = 0; i < list.length; i++) {
 		 									var str = list[i];
 		 									
 		 									if(str.chat_category == 1) {
 		 										str.chat_category = '의안'
 		 									} else if (str.chat_category == 2) {
 		 										str.chat_category = '시사'
 		 									} else if (str.chat_category == 3) {
 		 										str.chat_category = '이슈'
 		 									} else if (str.chat_category == 4) {
 		 										str.chat_category = '기타'
 		 									}
 		 									
 		 									$('#chatList').append(
 		 										"<tr>"+
 		 						 	 			"<td>"+str.chat_category+"</td>"+
 		 						 	 			"<td>"+
 		 						 	 			"<form action='/poli/enterroom.do' method='post' id='enter_"+str.chat_seq+"'>"+
 		 						 	 			"<input name='${_csrf.parameterName}' type='hidden' value='${_csrf.token}'>"+
 		 						 	 			"<input type='hidden' name='member_seq' value='"+member_seq+"'>"+
 		 						 	 			"<input type='hidden' name='chat_seq' value='"+str.chat_seq+"'>"+
 		 						 	 			"<input type='button' class='enterBtn' value='"+str.chat_name+"'>"+
 		 						 	 			"</td>"+
 		 						 	 			"</tr>"		
 		 									)	
 		 								}
 		 	 						}
 		 	 					})
 		 	 			)
 		 			}
 	 	 		})
 	 			
 	 		}
	 	 	ajax.call();
 		})

 	});
	
 	$(document).on('click', '.enterBtn', function() {
 		var form_name = $(this).parent().attr('id');
 		
 		var popupWidth = 400;
		var popupHeight = 600;
		
		var chatpopupX = window.screen.width/2 - (popupWidth/2);
		var chatpopupY = window.screen.height/2 - (popupHeight/2);
 		
 		var frm = document.getElementById(form_name);
 		window.open('', 'viewer', 'width='+popupWidth+', height='+popupHeight+', left='+chatpopupX+', top='+chatpopupY);
 		frm.action = "/poli/enterroom.do";
 		frm.target = "viewer";
 		frm.method = "post";
 		frm.submit();

 	});

</script>

</body>
</html>