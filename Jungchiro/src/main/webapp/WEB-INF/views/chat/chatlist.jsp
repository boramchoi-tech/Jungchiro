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
				채팅방 이름: <input type="text" name="chat_name"><br>
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

			<table border="1">
				<c:choose>
				
					<c:when test="${empty chatlist }">
						<tr>
						<td colspan="4">---참여 중인 채팅방이 존재하지 않습니다---</td>
						</tr>
					</c:when>
					
					<c:otherwise>
					
						<c:forEach items="${chatlist }" var="chatlist">
							<tr>
								<td>
									<!-- 1: 의안 / 2: 시사 / 3: 이슈 / 4: 기타 -->
									${chatlist.chat_category }
								</td>
								<td>
									<a href="/poli/enterroom.do?chat_seq=${chatlist.seq }" class="enterroom">
										${chatlist.chat_name }
									</a>
								</td>
							</tr>
							
						</c:forEach>
						
					</c:otherwise>
					
				</c:choose>
			</table>
			
		</div>

	<%@ include file="/WEB-INF/views/form/footer.jsp" %>

<script type="text/javascript">
	$('.enterroom').click(function() {
		var $href = $(this).attr('href');
		window.open($href, "팝업이름", "팝업 옵션");
	});
</script>

</body>
</html>