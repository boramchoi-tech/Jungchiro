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
	
		<a>채팅방 만들기</a>
		
		<div class="create-room">
			<form action="/poli/createroom.do" method="post">
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
			
			<a href="/poli/enterroom.do?chat_seq=1">채팅방 입장</a>
		</div>
	
	<%@ include file="/WEB-INF/views/form/footer.jsp" %>
</body>
</html>