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
<style type="text/css">

	.search_res th {
		height: 50px;
		font-size: 1.3em;
		font-weight: bold;
		border-bottom: 1px solid #9a9a9a;
	}
	
	.search_res td {
		border-bottom: 1px solid #c5c5c5;
		padding: 10px;
	}
	
	.search_res td img{
		width: 100px;
		height: 65px;
	}
	
	.search_res .search_res_img {
		text-align: center;
		width: 150px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/form/header.jsp" %>
		<sec:authentication var="principal" property="principal" />
		
		<div class="nanum_m">
			<div class="container">
				<table class="search_res" style="width: 100%;">
					<tr>
						<th colspan="2">
							제목 검색 결과
						</th>
					</tr>
					
					
					<c:forEach items="${titleList }" var="titleList">
						<c:if test="${!empty titleList.res }">
							<td colspan="2">${titleList.res }</td>
						</c:if>
						
						<c:if test="${!empty titleList.img }">
							<tr>
								<td rowspan="2" class="search_res_img">
									<img src='${titleList.img }'>
								</td>
								<td><a href="${titleList.url }"><b>${titleList.title }</b></a></td>
							</tr>
							<tr>
								<td>${titleList.content }</td>
							</tr>
							
						</c:if>
					</c:forEach>
					
				</table>
				
				<p></p>
				
				<table class="search_res" style="width: 100%;">
					<tr>
						<th colspan="2">
							내용 검색 결과
						</th>
					</tr>
					
					
					<c:forEach items="${contentList }" var="contentList">
						<c:if test="${!empty contentList.res }">
							<td colspan="2">${contentList.res }</td>
						</c:if>
						
						<c:if test="${!empty contentList.img }">
							<tr>
								<td rowspan="2" class="search_res_img">
									<img src='${contentList.img }'>
								</td>
								<td><a href="${contentList.url }"><b>${contentList.title }</b></a></td>
							</tr>
							<tr>
								<td>${contentList.content }</td>
							</tr>
							
						</c:if>
						
					</c:forEach>
					
				</table>
			</div>
		</div>

	<%@ include file="/WEB-INF/views/form/footer.jsp" %>
	
</body>
</html>