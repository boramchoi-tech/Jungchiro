<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
	
		<h1>채팅방 만들기</h1>

		<div class="create-room">
			<form action="/poli/createroom.do" method="post" id="createRoom">
				<input type="hidden" name="member_seq" value="${loginDto.member_seq }">
				채팅방 이름: <input type="text" name="chat_name" required><br>
				카테고리: 
				<select name="chat_category">
					<option value="1">의안</option>
					<option value="2">시사</option>
					<option value="3">이슈</option>
					<option value="4">기타</option>
				</select>
				<br>
				<input type="button" value="만들기" id="createBtn">
			</form>
		</div>
		
		<div class="chat-list">
			<h1>채팅방 목록</h1>
			
			<input type="checkbox" class="mychatlist" value="${member_seq }"> 내가 참여한 채팅방 목록 보기
			
			<table border="1">
				<tbody id="chatList">
					<c:if test="${empty chatlist }">
						<tr>
							<td colspan="2">----존재하는 채팅방이 없습니다----</td>
						</tr>
					</c:if>
					<c:if test="${!empty chatlist }">
						<c:forEach items="${chatlist }" var="chatlist">
							<tr>
								<td>
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
									<form action="/poli/enterroom.do" method="post" id="enterroom">
										<input type="hidden" name="member_seq" value="${loginDto.member_seq }">
										<input type="hidden" name="chat_seq" value="${chatlist.chat_seq }">
										<input type="button" id="enterBtn" value="${chatlist.chat_name }">
									</form>

								</td>
							</tr>
							
						</c:forEach>
					</c:if>
				</tbody>
					
			</table>
			
		</div>

	<%@ include file="/WEB-INF/views/form/footer.jsp" %>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
<script type="text/javascript">
 		
 	$(function() {
 		$('#createBtn').click(function() {	
 			$('#createRoom').submit();
 		})
 		
 		$('#enterBtn').click(function() {
 			$('#enterroom').submit();
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
 		 									$('#chatList').append(
 		 										"<tr>"+
 		 						 	 			"<td>"+str.chat_category+"</td>"+
 		 						 	 			"<td>"+"<a href='/poli/enterroom.do?chat_seq="+str.chat_seq+"' class='enterroom'>"+str.chat_name+"</a></td>"+
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
 		 									$('#chatList').append(
 		 										"<tr>"+
 		 						 	 			"<td>"+str.chat_category+"</td>"+
 		 						 	 			"<td>"+"<a href='/poli/enterroom.do?chat_seq="+str.chat_seq+"' class='enterroom'>"+str.chat_name+"</a></td>"+
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
 		
 	$('.enterroom').click(function() {
		var $href = $(this).attr('href');
		
		var popupWidth = 400;
		var popupHeight = 600;

		var chatpopupX = (window.screen.width/2) - (popupWidth/2);
		var chatpopupY = (window.screen.height/2) - (popupHeight/2);
		 
		window.open($href, "_sub", 'width='+popupWidth+', height='+popupHeight+', left='+chatpopupX+', top='+chatpopupY);
		return false;
	});
 	
</script>

</body>
</html>