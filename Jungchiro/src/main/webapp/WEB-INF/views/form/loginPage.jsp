<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/poli/resources/css/header.css"/>
</head>
<body>
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
	<form action="${pageContext.request.contextPath}/login" method="post">
	    <input type="text" name="loginId" placeholder="아이디">
	    <input type="password" name="loginPwd" placeholder="비밀번호">
	    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	    <button type="submit">로그인</button>
	</form>
		
	<%@ include file="/WEB-INF/views/form/footer.jsp" %>
</body>
</html>