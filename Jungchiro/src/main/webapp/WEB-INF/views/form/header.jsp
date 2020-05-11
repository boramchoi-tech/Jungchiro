<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>
<link rel="stylesheet" type="text/css" href="/poli/resources/css/header.css"/>
</head>
<body>

	<div id="role" class="nanum">
		<a href="#login" class="login-btn">로그인</a>
		 / 
		관리자 페이지
		 / 
		마이 페이지
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
		뉴스&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/poli/map.do">지도</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		의안정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		자유게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		채팅
	</div>
	
	<div class="login-layer">
		<div class="login-Bg"></div>
		
		<div id="login" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<table class="popup">
						<tr>
							<td>아이디</td>
							<td><input type="text" id="member_id" name="member_id"></td>
							<td rowspan="2"><input type="button" value="&nbsp;로그인&nbsp;" onclick="login();" id="loginButton"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="member_pw" name="member_pw"></td>
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
					<table class="popup">
						<tr><td>회원가입</td></tr>
						<!-- <tr>
							<td>아이디</td>
							<td><input type="text" id="member_id" name="member_id"></td>
							<td rowspan="2"><input type="button" value="&nbsp;로그인&nbsp;" onclick="login();" id="loginButton"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" id="member_pw" name="member_pw"></td>
						</tr> -->
					</table>
					
<!-- 					<div class="btn-r">
						<a href="#" class="btn-regist">회원가입</a>
                   		<a href="#" class="btn-layerClose">닫기</a>
                	</div> -->
                	
				</div>
			</div>
		</div>
		
	</div>
	
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
						
					} else {
						$('#loginChk').show();
						$('#loginChk').html('아이디 또는 패스워드를 확인해 주세요').css('color','red');
					}
			    });
			    
			    ajax.call();			//ajax 호출
			}
		}
	</script>
</body>
</html>