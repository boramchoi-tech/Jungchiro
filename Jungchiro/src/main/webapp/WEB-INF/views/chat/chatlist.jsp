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
	
		채팅방 만들기

		<div class="create-room">
			<form action="/poli/createroom.do" method="post">
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
				<input type="submit" value="만들기">
			</form>
		</div>
		
		<div class="chat-list">
			<h1>전체 채팅방 목록</h1>
			
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
									${chatlist.chat_category }
								</td>
								<td>
									<a href="/poli/enterroom.do?chat_seq=${chatlist.chat_seq }" class="enterroom">
										${chatlist.chat_name }
									</a>
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
 		var seq = $('.mychatlist').val();
 		var $check = $('.mychatlist');
 		var member_seq = {"member_seq":seq}
 		
 		var ajax = new ComAjax();
 		ajax.url("/poli/chatlist.do");
 		ajax.param(member_seq);

 		$check.click(function() {
 			$("#chatList").children().remove();
 			
	 		ajax.success(function(msg) {
	 			
	 			
	 		})
	 		
	 		ajax.call();
 		});
 	});
 		
 		/* $check.click(function() {
 			
 			if ($check.is(":checked")) {
 				$("#chatList").children().remove();
 				
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
 		 			
 		 		});
 				
 				ajax.param({"member_seq":member_seq});
 				ajax.call();
 				return false;
 				
 			} else {
 				alert('체크 해제');
 				/* ajax.param({"member_seq":member_seq});
 				ajax.call();
 				return false; */
/* 
 			}
 		}) */
 		
 		/* var member_seq = $('.mychatlist').val();
 		console.log('seq : ' + member_seq);
 		
 		var ajax = new ComAjax();
 		ajax.url("/poli/chatlist.do");
 		
 		ajax.success(function(msg) {
 			if(msg.chatroomCount == 0) {
 				$("#chatList").append(
					"<tr><td colspan='2'>---채팅방이 존재하지 않습니다---</td></tr>"
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
 			
 		});
 		
 		var $check = $('.mychatlist');
 		$check.click(function() {
 			if ($check.is(":checked")) {
 				alert('체크');
 				ajax.param({"member_seq":member_seq});
 				ajax.call();
 				return false;
 				
 			} else {
 				alert('체크 해제');
 				ajax.param({"member_seq":member_seq});
 				ajax.call();
 				return false;

 			}
 		})
 		ajax.call(); */
 

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