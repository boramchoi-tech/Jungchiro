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
<!-- START :: JAVASCRIPT -->
<script type="text/javascript">


	// sse 위한 eventSource 객체 생성
	$(function(){
		
		var member_seq = $("#member_seq").val().trim();
		console.log(member_seq);
		
		if(member_seq != "" || member_seq != null){
		
			var eventSource = new EventSource('/poli/notification.do?member_seq='+member_seq);
			
			eventSource.addEventListener('open',function(e){
				console.log('open 됐다!');
			}, false);
			
			eventSource.addEventListener('message', function(e){
				console.log('message 왔다!');
				var msg = parseInt(e.data);
				console.log(msg);
			
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

	<div id="role" class="nanum">

		<sec:authorize access="isAuthenticated()">
			<sec:authentication var="principal" property="principal" />
			<input type="hidden" id="member_seq" value="${principal.member_seq }">
			${principal.member_name }님 안녕하세요
			<a href="/poli/mypage.do?member_seq=${principal.member_seq }">마이 페이지</a>
			<form id="logout" action="/poli/logout" method="POST">
			   <input id="logoutBtn" type="submit" value="Logout" />
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
		
		<div id="header_search">
			검색창
		</div>
	</div>
	
	<div id="header_menu" class="nanum">

	    <a href="/poli/news.do">뉴스</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/poli/map.do">지도</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/poli/billlist.do?page=1">의안정보</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/poli/boardlist.do?page=1">자유게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/poli/chat.do?member_seq=${principal.member_seq }">채팅</a>
	</div>
	
	<div class="login-layer">
		<div class="login-Bg"></div>
		
		<div id="login" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<table class="popup">
						<tr>
							<td>아이디</td>
							<td><input type="text" id="member_id"></td>
							<td rowspan="2"><input type="button" value="&nbsp;로그인&nbsp;" onclick="login();" id="loginButton"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="member_pw"></td>
						</tr>
					</table>
					
					<!-- 로그인 체크 -->
					<div id="loginChk"></div>
					
					<!-- SNS 로그인 합치면 바꿀 곳 -->
					<div class="btn-r">
						<a href="#" class="btn-naver">NAVER</a>
						<a href="#" class="btn-kakao">KAKAO</a>
						<a href="#" class="btn-google">GOOGLE</a>
					</div>
					
					<div class="btn-r">
						<a href="#regist" class="btn-regist">회원가입</a>
                   		<a href="#" class="btn-layerClose">닫기</a>
                	</div>
                	
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="regist-layer">
		<div class="regist-Bg"></div>
		
		<div id="regist" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<form action="regist.do" method="post">
						<table class="popup" id="registForm">
							<colgroup>
								<col width="100px"/>
							</colgroup>
							<tr>
								<th rowspan="2">아이디</th>
								<td colspan="2"><input type="text" id="registid" name="member_id"></td>
							</tr>
							<tr>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td colspan="2"><input type="password" id="pw1" name="member_pw"></td>
							</tr>
							<tr>
								<th rowspan="2">비밀번호 확인</th>
								<td colspan="2"><input type="password" id="pw2"></td>
							</tr>
							<tr>
								<td colspan="2" id="pwdChk"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td colspan="2"><input type="text" name="member_name"></td>
							</tr>
							<tr>
								<th rowspan="2">이메일</th>
								<td><input type="text" id="member_email" name="member_email"></td>
								<td>
									<a href="#" class="btn-regist">인증</a>
								</td>
							</tr>
							<tr>
								<td colspan="2" id="emailChk"></td>
							</tr>
							<tr>
								<th rowspan="2">인증번호 입력</th>
								<td colspan="2"><input type="text"></td>
							</tr>
							<tr>
								<td colspan="2">인증번호 유효성</td>
							</tr>
						</table>
							<div class="btn-r">
								<a href="#back" class="btn-regist">뒤로가기</a>
								<input type="submit" id="reg_submit" value="가입하기" class="btn0" style="cursor: pointer;">
							</div>
					</form>
					
				</div>
			</div>
		</div>
		
		
	</div>
	
	<!-- 여백 -->
	<div style="height: 50px;"></div>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
	<script type="text/javascript">
	
		$('.login-btn').click(function() {
			var $href = $(this).attr('href');
			layer_popup($href);
		});
		
		$('.btn-regist').click(function() {
			var $href = $(this).attr('href');
			layer_popup($href);
		});
		
		function layer_popup(el) {
			var $el = $(el);
			var isBg = $el.prev().hasClass('login-Bg');
			var isRegist = $el.prev().hasClass('regist-Bg');
			
			//로그인 클릭 시
			if (el == '#login') {
				isBg ? $('.login-layer').fadeIn() : $el.fadeIn();
				
				var $elWidth = ~~($el.outerWidth()),
		        $elHeight = ~~($el.outerHeight()),
		        docWidth = $(document).width(),
		        docHeight = $(document).height();
				
				// 화면 중앙에 팝업 띄우기
				if ($elHeight < docHeight || $elWidth < docWidth) {
			        $el.css({
			            marginTop: -$elHeight /2,
			            marginLeft: -$elWidth/2
			        })
			    } else {
			        $el.css({top: 0, left: 0});
			    }
				
				//닫기 버튼을 클릭하면 레이어가 닫힘
				$el.find('a.btn-layerClose').click(function(){
			        isBg ? $('.login-layer').fadeOut() : $el.fadeOut();
			        return false;
			    });
				
			} else if (el == '#regist') {		// 회원가입 클릭 시
				$('.login-layer').fadeOut();	// 로그인 폼을 닫고
				isRegist ? $('.regist-layer').fadeIn() : $el.fadeIn();	// 회원가입 폼을 열음
				
				var $elWidth = ~~($el.outerWidth()),
		        $elHeight = ~~($el.outerHeight()),
		        docWidth = $(document).width(),
		        docHeight = $(document).height();
				
				// 화면 중앙에 팝업 띄우기
				if ($elHeight < docHeight || $elWidth < docWidth) {
			        $el.css({
			            marginTop: -$elHeight /2,
			            marginLeft: -$elWidth/2
			        })
			    } else {
			        $el.css({top: 0, left: 0});
			    }
				
			} else if (el == '#back') {
				$('.regist-layer').fadeOut();
				$('.login-layer').fadeIn();
			}
			
			
		}
		
		function login(){
			var member_id = $("#member_id").val().trim();
			var member_pw = $("#member_pw").val().trim();
			
		    var ajax = new ComAjax();		// ajaxCommon.js에 있는 ComAjax() 호출
		    
		    if (member_id == null || member_id == "" || member_pw == null || member_pw == "") {
				$('#loginChk').html('아이디와 패스워드를 입력해 주세요').css('color','red');
				$("#member_id").focus();
				
			} else {
				
				var loginVal = {
						"member_id":member_id,
						"member_pw":member_pw
				}
				
			    ajax.url("/poli/login.do");
			    ajax.param(loginVal);
			    
			    ajax.success(function(msg){
			    	if (msg.loginCheck == true) {
						$('.login-layer').fadeOut();		//로그인 성공
						location.reload();
					} else {
						$('#loginChk').show();
						$('#loginChk').html('아이디 또는 패스워드를 확인해 주세요').css('color','red');
					}
			    });
			    
			    ajax.call();			//ajax 호출
			}
		}
		
		$(function() {
			$("#reg_submit").attr("disabled", true);
			
			$('#pw2').keyup(function(){
				if($('#pw1').val() != $('#pw2').val()){
					if($('#pw2').val()!=''){
						$('#pwdChk').html('비밀번호가 일치하지 않습니다.').css('color','red');
				    }
				} else {
					$('#pwdChk').html('비밀번호가 일치합니다.').css('color','black');
				}
			});
			
			
			

			
			/*
				input에 빈칸 없는지 체크해야 함
			*/
		});
		

		
		
	</script>
</body>
</html>