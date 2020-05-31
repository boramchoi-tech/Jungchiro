<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-164964981-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-164964981-1');
</script>
<meta charset="UTF-8">
<title>정치로</title>
<link rel="stylesheet" type="text/css" href="/poli/resources/css/loginPage.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		$("#authNum").hide(); 
		$("#loginbtn").click(function(){
			if($("#user").val().trim() == ""){
				$("#error_msg").text("아이디를 입력해주세요").css('color','red');
				return false;
			} else if($("#pass").val().trim() == ""){
				$("#error_msg").text("비밀번호를 입력해주세요").css('color','red');
				return false;
			}
		});
		
		$("#signUpbtn").click(function(){
			if($("#regist_id").val().trim() == ""){
				$('#idChk').html('아이디를 입력해주세요').css('color','red');
				return false;
			} else if($("#regist_pw").val().trim() == ""){
				$("#pwChk").text("비밀번호를 입력해주세요").css('color','red');
				return false;
			} else if($("#regist_name").val().trim() == ""){
				$("#nameChk").text("이름을 입력해주세요").css('color','red');
				return false;
			} 
		});
		
		$('#regist_id').keyup(function() {
			var member_id = $("#regist_id").val().trim();
			var ajax = new ComAjax();
			var idChk = {"member_id":member_id}
			ajax.url("/poli/idChk.do");
			ajax.param(idChk);
			ajax.success(function(msg) {
				if(msg.idChk == 1) {
					$('#idChk').html('중복된 아이디가 존재합니다.').css('color','red');
					$('#signUpbtn').attr('disabled','disabled');
				} else {
					$('#idChk').html('사용 가능한 아이디입니다.').css('color','white');
					$('#signUpbtn').removeAttr("disabled")
				}
			});
			ajax.call();
			
		});
		/*이메일 유효성 및 중복 검사*/
		$('#regist_email').keyup(function() {
			var member_email = $("#regist_email").val().trim();

			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if(regExp.test(member_email)){ 	

				var ajax = new ComAjax();
				var emailChk = {"member_email":member_email}
				ajax.url("/poli/emailChk.do");
				ajax.param(emailChk);
				ajax.success(function(msg) {
					console.log(msg.emailChk)
					if(msg.emailChk == 1) {
						$('#emailCheck').html('중복된 이메일이 존재합니다.').css('color','red');
						$('#emailAuth').css('pointer-events','none').css('cursor','auto');
	
					} else {
						$('#emailCheck').html('사용 가능한 이메일입니다.').css('color','white');
						$('#emailAuth').css('pointer-events','auto').css('cursor','pointer');
					}
				});
				ajax.call();
			} else {
				$('#emailCheck').html('올바른 이메일 형식이 아닙니다.').css('color','red');
				$('#signUpbtn').attr('disabled','disabled');
			}
		});
	
		var emailAuthNum;
		 //이메일 인증하기 클릭 시 발생하는 이벤트
		$("#emailAuth").click(function(){
			if($("#regist_email").val().trim() == "") {
				$('#emailCheck').html('이메일을 입력해 주세요').css('color','red');
				return false;
			}
			var ajax = new ComAjax();
			
		 			ajax.url("/poli/emailAuth.do");
		 			var userEmail = $("#regist_email").val().trim();
		 			var data = {
		 					"member_email" : userEmail
		 			}
		 			//입력한 이메일 ajax 파라미터로 보내기
		 			ajax.param(data);
		 			ajax.success(function(data){
		 				alert("메일이 발송되었습니다. 인증번호를 입력해주세요");
		 				emailAuthNum = data.emailAuthNum;
		 			})
		 			
		 			
		 			ajax.call();
		 			
		 	/* 인증번호 입력칸 보이게 */		
			$("#authNum").show(); 
		})
		/*인증번호 확인버튼 클릭 시 발생하는 이벤트*/
		$("#emailConfirm").click(function(){
			var inputNum = $("#inputNum").val().trim();
			if(emailAuthNum == inputNum){
				alert("인증이 완료되었습니다");
				$("#signUpbtn").removeAttr("disabled");
			} else{
				alert("인증번호를 잘못 입력하셨습니다");
			}
		})

	})
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/form/header.jsp" %>
<div class="login-wrap">
    <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">회원가입</label>
        
        <div class="login-form">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="sign-in-htm">
                <div class="group">
                    <label for="user" class="label">아이디</label>
                    <input id="user" type="text" name="loginId" class="input" value="${loginId }">
                </div>
                <div class="group">
                    <label for="pass" class="label">비밀번호</label>
                    <input id="pass" type="password" name="loginPwd" class="input" data-type="password">
                </div>
                <div class="group">
                    <input id="check" type="checkbox" name="remember-me" class="check" checked>
                    <label for="check"><span class="icon"></span> 로그인유지</label>
                    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                    <span id="error_msg">${errorMsg }</span>
                </div>
                <div class="group">
                    <input id ="loginbtn" type="submit" class="button" value="로그인">
                </div>
                <div class="hr"></div>
                <div class="foot-lnk">
                </div>
            </div>
         </form>
          <form action="${pageContext.request.contextPath}/regist.do" method="post">
            <div class="sign-up-htm">
            <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                <div class="group">
                    <label for="member_id" class="label">아이디</label>
                    <input id="regist_id" name="member_id" type="text" class="input">
                    <span id="idChk"></span>
                </div>
                <div class="group">
                    <label for="member_pw" class="label">비밀번호</label>
                    <input id="regist_pw" name="member_pw" type="password" class="input" data-type="password">
                	 <span id="pwChk"></span>
                </div>
                <div class="group">
                    <label for="member_name" class="label">이름</label>
                    <input id="regist_name" name="member_name" type="text" class="input" >
               		 <span id="nameChk"></span>
                </div>
                <div class="group">
                    <label for="pass" class="label">이메일<a id="emailAuth" style="color: white; float: right; text-decoration: underline; pointer-events: none;">이메일 인증하기</a></label>
                    <input id="regist_email" name="member_email" type="text" class="input">
                    <span id="emailCheck"></span>
                </div>
                 <div class="group"  id="authNum">
                    <label for="pass" class="label">인증번호 입력<a id="emailConfirm" style="color: white; float: right; text-decoration: underline;">확인</a></label>
                    <input id="inputNum" type="text" class="input" >
                </div>
                <div class="group" >
                    <input type="submit" class="button" id="signUpbtn" value="회원가입" disabled="disabled">
                </div>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <label for="tab-1">이미 회원이신가요?</a>
                </div>
            </div>
          </form>
        </div>
       
    </div>
</div>
<%@ include file="/WEB-INF/views/form/footer.jsp" %>
</body>
</html>