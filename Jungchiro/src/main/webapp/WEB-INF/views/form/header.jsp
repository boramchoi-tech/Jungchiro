<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="sessionLogin" value="${sessionScope.loginDto }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>정치로</title>
<link rel="stylesheet" type="text/css" href="/poli/resources/css/header.css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- START :: JAVASCRIPT -->
<script type="text/javascript">


	// sse 위한 eventSource 객체 생성
	$(function(){
		
		var member_seq = $("#member_seq").val().trim();
		// console.log(member_seq);
		
		if(member_seq != "" || member_seq != null){
		
			var eventSource = new EventSource('/poli/notification.do?member_seq='+member_seq);
			
			eventSource.addEventListener('open',function(e){
				// console.log('open 됐다!');
			}, false);
			
			eventSource.addEventListener('message', function(e){
				// console.log('message 왔다!');
				var msg = parseInt(e.data);
				// console.log(msg);
			
				if(msg > 0){
					document.getElementById("bell_count").innerHTML = msg+"";
				}

			});
			
			eventSource.addEventListener('error', function(e){
				if(e.readyState == EventSource.CLOSED){
					eventSource.close();
				}
			}, false);		
			
		} else {			
			
			eventSource.close();	
			
		}
		
	});

	
	/*
	*	벨(notification) 누르면 마이페이지로 이동
	*/
	
	function notification(){
		
		var member_seq = $("#member_seq").val().trim();
		console.log(member_seq);
		
		if(member_seq == "" || null){
			return false;
		} else {			
		location.href="/poli/mypage.do?member_seq="+member_seq;			
		}
		
	}
	

</script>
<style type="text/css">
	form{display:inline}
</style>

</head>
<body>	

	<div id="role" class="nanum_m">

		<sec:authorize access="isAuthenticated()">
			<sec:authentication var="principal" property="principal" />
			<input type="hidden" id="member_seq" value="${principal.member_seq }">
				<b>${principal.member_name }님 안녕하세요</b>
			<a href="/poli/mypage.do?member_seq=${principal.member_seq }">마이 페이지</a>
			<form id="logout" action="/poli/logout" method="POST">
			   <input id="logoutBtn" type="submit" value="&nbsp;로그아웃&nbsp;" />
			   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			   <img src="/poli/resources/images/bell.png" id="bell" style="height: 20px; width:20px;" onclick="notification();">
			   <span id="bell_count"></span>
			</form>
		</sec:authorize>

		
		<sec:authorize access="isAnonymous()">
			<a href="/poli/loginPage.do" class="login-btn">로그인</a>
		</sec:authorize>

		<sec:authorize access="hasRole('ROLE_ADMIN')">
			관리자 페이지
		</sec:authorize>
		&nbsp;&nbsp;
	</div>

	<div id="header">
		<div id="header_logo">
			<a href="/poli/main.do"><img src="/poli/resources/images/logo.png" style="height: 80px;"></a>		
		</div>
		<div class="header_search">
		   <div class="search">
		      <input type="text" class="searchTerm" placeholder="뉴스 제목 또는 뉴스 내용 검색하기">
		      <button class="searchButton">
		        <img src="/poli/resources/images/search2.png" style="height: 30px;">
		     </button>
		   </div>
		</div>
	</div>
	
	
	<div id="header_menu" class="nanum">

	    <a href="/poli/news.do">뉴스</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/poli/map.do">지도</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/poli/billlist.do?page=1">의안정보</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/poli/boardlist.do?page=1">자유게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/poli/chat.do?member_seq=${principal.member_seq }">채팅</a>
	</div>
	
	<!-- 여백 -->
	<div style="height: 50px;"></div>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
	<script type="text/javascript">
		
		$('.searchButton').click(function() {
			var keyword = $('.searchTerm').val();
			location.href = "/poli/search.do?keyword=" + keyword;
			
		});
	
	</script>
</body>
</html>