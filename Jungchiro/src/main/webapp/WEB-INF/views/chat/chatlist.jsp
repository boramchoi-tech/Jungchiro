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
				<c:choose>
				
					<c:when test="${empty chatlist }">
						<tr>
							<td colspan="2">---채팅방이 존재하지 않습니다---</td>
						</tr>
					</c:when>
					
					<c:otherwise>
						<tbody id="chatList"></tbody>
					
						<%-- <c:forEach items="${chatlist }" var="chatlist">
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
							
						</c:forEach> --%>

					</c:otherwise>
					
				</c:choose>
			</table>
			
		</div>

	<%@ include file="/WEB-INF/views/form/footer.jsp" %>

<script type="text/javascript">
 	$('.enterroom').click(function() {
		var $href = $(this).attr('href');
		
		var popupWidth = 400;
		var popupHeight = 600;
		
 		var chatpopupX = (window.screen.width/2) - (popupWidth/2);
		var chatpopupY = (window.screen.height/2) - (popupHeight/2);
		 
		window.open($href, "_sub", 'width='+popupWidth+', height='+popupHeight+', left='+chatpopupX+', top='+chatpopupY);
		return false;
	});
 	
 	$('.mychatlist').click(function() {
 		var member_seq = $(this).val();
 		
 		if ($(this).is(":checked")) {
 			
 		} else {
 			var member = {"member_seq":member_seq}
 			ajax.url("/poli/chatlist.do");
 			ajax.param(member);
 			
 			ajax.success(function(msg){
 				if (msg.chatList == 1) {
 					$("#chatList").append(
 						"<tr>"+
 						"</tr>"
 					);
 					
 				} else {
 					$("#chatList").append(
						"<tr><td colspan='2'>---참여 중인 채팅방이 존재하지 않습니다---</td></tr>"
					);
 				}
 			})
 			
 		}
 		
 	})
 	
 	
 	$(function() {
		$("#tbodyResult").hide();
		$("#durResult").hide();
		
		$(".durcheck").click(function() {
			var item_name = $(this).val();
			
			if ($(this).is(":checked")) {
				
				$.ajax({
					type: 'POST',
					url: 'medcontroller.do?command=isDur',
					data: {item_name:item_name},
					dataType: "json",
					success: function(durdata) {
						if (durdata == "" || durdata == null) {
							alert('등록된 DUR 정보가 없습니다.');
						
						} else {
							$("#durResult").show();
							
							$("#tbodyDUR").append(
								"<tr class='durdata_item_name' id=" + durdata.ITEM_SEQ + ">" +
								"<td>" + durdata.ITEM_NAME + "</td>" + 
								"<td>" + durdata.EFFECT_NAME + "</td>" + 
								"<td>" + durdata.TYPE_NAME + "</td>" +
								"</tr>"
							);
	
						}
					}, error: function() {
						alert('에러');
					}
				});

			} else {
				var itemCheck = $(this).attr('id');
				var isChecked = $(".durdata_item_name").length;
				
				for (var i = 0; i < isChecked ; i++) {
					var res = $(".durdata_item_name").eq(i).attr("id");
					
					if(res == itemCheck) {
						
						if(isChecked == 1) {
							$('#tbodyDUR > #' + res).remove();
							$("#durResult").hide();
						} else {
							$('#tbodyDUR > #' + res).remove();
						}						
					}
					
				}

			}
			
		})
		
	});
 	
 	
</script>

</body>
</html>