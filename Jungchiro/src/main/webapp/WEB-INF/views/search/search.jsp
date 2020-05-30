<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>
<body>
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
		<sec:authentication var="principal" property="principal" />
		
		<div class="container">
			<c:forEach items="${titleList }" var="titleList">
				<c:if test="${!empty titleList.res }">
					${titleList.res }
				</c:if>
				
				
				<c:if test="${!empty titleList.img }">
					<img src='${titleList.img }'><br>
				</c:if>
				<c:if test="${!empty titleList.title }">
					<a href="${titleList.url }"><b>${titleList.title }</b></a><br>
				</c:if>
				<c:if test="${!empty titleList.content }">
					${titleList.content }<br>
				</c:if>
				<br><br><br>
				<%-- ${titleList } --%>
			
				<%-- <tr>
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
				</tr> --%>
			</c:forEach>
		</div>

	<%@ include file="/WEB-INF/views/form/footer.jsp" %>
	
</body>
</html>