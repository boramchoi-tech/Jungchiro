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
		지도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
					
					<!-- SNS 로그인 합치면 바꿀 곳 -->
					<div class="btn-r">
						<a href="#" class="btn-regist">NAVER 로그인</a><br><br>
						<a href="#" class="btn-regist">KAKAO 로그인</a><br><br>
						<a href="#" class="btn-regist">GOOGLE 로그인</a>
					</div>
					
					<div class="btn-r">
						<a href="#" class="btn-regist">회원가입</a>
                   		<a href="#" class="btn-layerClose">닫기</a>
                	</div>
                	
				</div>
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$('.login-btn').click(function() {
			var $href = $(this).attr('href');
			layer_popup($href);
		});
		
		function layer_popup(el) {
			var $el = $(el);
			var isBg = $el.prev().hasClass('login-Bg');
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

			//회원가입 버튼 클릭 시
			
			
			
		}
		
		function login() {
			var member_id = $("#member_id").val().trim();
			var member_pw = $("#member_pw").val().trim();
			
			if (member_id == null || member_id == "" || member_pw == null || member_pw == "") {
				alert ("ID와 PW를 다시 확인해 주세요")
				$("#member_id").focus();
				
			} else {
				
				var loginVal = {
						"member_id":member_id,
						"member_pw":member_pw
				}
				
				$.ajax({
					type: "post",
					url: "/poli/login.do",
					data: JSON.stringify(loginVal),
					contentType: "application/json",
					dataType: "json",
					success: function(msg) {
						
						if (msg.loginCheck == true) {
							alert('로그인 성공');
							$('.login-layer').fadeOut();
							
						} else {
							$('#loginChk').show();
							$('#loginChk').html('ID 또는 PW가 잘못되었습니다').css('color','red');
						}
						
					}, error: function(msg) {
						alert('통신 실패');
					}
					
				});
				
			}
			
		}
		
	</script>

<!-- 	
	
	<script type="text/javascript">
		$('.login-btn').click(function(){
		    var $href = $(this).attr('href');
		    console.log($href);
		    layer_popup($href);
		});
		
		function layer_popup(href) {
			var $href = $(href);
			var isBg = $href.prev().hasClass('login-Bg');
			
			isBg ? $('.login-layer').fadeIn() : $href.fadeIn();
			
		    var $elWidth = ~~($href.outerWidth()),
		    	$elHeight = ~~($href.outerHeight()),
		    	docWidth = $(document).width(),
		    	docHeight = $(document).height();
		    
		    // 화면 가운데에 로그인 창 띄우기
		    if ($elHeight < docHeight || $elWidth < docWidth) {
		    	$href.css({
		    		marginTop: -$elHeight/2,
		    		marginLeft: -$elWidth/2
		    	});
		    } else {
		    	$href.css({top: 0, left: 0});
		    }
		    
		    // 닫기 버튼 클릭 시
		    $href.find('a.close-btn').click(function() {
		    	isBg ? $('.login-layer').fadeOut() : $href.fadeOut();
		    	return false;
		    });
		    
		    // 회원가입
		    
		    // 로그인 폼이 아닌 곳을 눌렀을 경우 로그인 폼이 꺼짐
		    $('.login-layer .login-Bg').click(function() {
		    	$('.login-layer').fadeOut();
		    	return false;
		    });
		    
		}
		
	</script>
	
	
	<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
            <table>
		<tr>
			<th>ID</th>
			<td><input type="text" id="member_id"></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="password" id="member_pw"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="로그인" onclick="login();">
				<input type="button" value="regist" onclick="regist();">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" id="loginchk"></td>
		</tr>
	</table>
	
                content //
     <form action="login.do" method="post" id="formbg">
		<input type="hidden" name="command" value="login">
		<table style="width: 100%;">
			<col width="100"/>
			<col width="100"/>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="member_id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="member_pw"></td>
			</tr>		
			<tr>
				<td colspan="2" align="center">
				    <input type="submit" value="&nbsp;로그인&nbsp;" id="btn1"><br><br>
				</td>
			</tr>
		</table>
	</form>

                <div class="btn-r">
                    <a href="#" class="btn-layerClose">Close</a>
                </div>
                // content
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$('.btn-example').click(function(){
    var $href = $(this).attr('href');
    layer_popup($href);
});

$(function(){

function login() {
	var member_id = $("#member_id").val().trim();
	var member_pw = $("#member_pw").val().trim();
	console.log(member_id + "/" + member_pw);
	
	if (member_id == null || member_id == "" || member_pw == null || member_pw == "") {
		alert ("ID와 PW를 다시 확인해 주세요")
		$("#member_id").focus();
	} else {
		var loginVal = {
				"member_id" : member_id,
				"member_pw" : member_pw
		}
		
		$.ajax({
			type: 'POST',
			url: 'login.do',
			data: JSON.stringify(loginVal),
			contentType: 'application/json',
			dataType: 'json',
			success: function(msg) {
				
				if (msg.check == true) {
					location.href='main.do';
				} else {
					$('#loginchk').show();
					$('#loginchk').html('ID 또는 PW가 잘못되었습니다').css('color','red');
				}
				
			}, error: function(msg) {
				alert('통신 실패');
			}
		})
		
	}
	
}

}); */

function layer_popup(el){

    var $el = $(el);        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });
    
    //회원가입 버튼
    $el.find('a.btn-regist').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut();
        var $layer1 = $(layer1);
        layer_popup($layer1);
        return false;
    });
    
    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });

}
</script> -->
</body>
</html>