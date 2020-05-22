<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="/poli/resources/css/loginPage.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
		$("#loginbtn").click(function(){
			if($("#user").val() == ""){
				$("#error_msg").text("아이디를 입력해주세요");
				return false;
			} else if($("#pass").val() == ""){
				$("#error_msg").text("비밀번호를 입력해주세요");
				return false;
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
                    <p id="error_msg">${errorMsg }</p>
                </div>
                <div class="group">
                    <input id ="loginbtn" type="submit" class="button" value="로그인">
                </div>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <a href="#forgot">비밀번호 찾기</a>
                </div>
            </div>
            <div class="sign-up-htm">
                <div class="group">
                    <label for="user" class="label">아이디</label>
                    <input id="user" type="text" class="input">
                </div>
                <div class="group">
                    <label for="pass" class="label">비밀번호</label>
                    <input id="pass" type="password" class="input" data-type="password">
                </div>
                <div class="group">
                    <label for="pass" class="label">비밀번호 확인</label>
                    <input id="pass" type="password" class="input" data-type="password">
                </div>
                <div class="group">
                    <label for="pass" class="label">이메일</label>
                    <input id="pass" type="text" class="input">
                </div>
                <div class="group">
                    <input type="submit" class="button" value="회원가입">
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