<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<!-- START :: JAVASCRIPT -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>

<!-- END :: JAVASCRIPT -->
<style type="text/css">
@use postcss-cssnext;
/* helpers/align.css */

.align {
  align-items: center;
  display: flex;
  justify-content: center;
}

/* helpers/grid.css */

:root {
  --gridMaxWidth: 24em;
  --gridWidth: 90%;
}

.grid {
  margin-left: auto;
  margin-right: auto;
  max-width: var(--gridMaxWidth);
  width: var(--gridWidth);
}

/* helpers/icon.css */

.icon {
  display: inline-block;
  height: 1.25em;
  line-height: 1.25em;
  margin-right: 0.625em;
  text-align: center;
  vertical-align: middle;
  width: 1.25em;
}

.icon--info {
  background-color: #e5e5e5;
  border-radius: 50%;
}

/* layout/base.css */

:root {
  --bodyBackgroundColor: #eaeaea;
  --bodyColor: #999;
  --bodyFontFamily: 'Helvetica', 'Arial';
  --bodyFontFamilyFallback: sans-serif;
  --bodyFontSize: 0.875rem;
  --bodyFontWeight: 400;
  --bodyLineHeight: 1.5;
}

*,
*::before,
*::after {
  box-sizing: inherit;
}

html {
  box-sizing: border-box;
  height: 100%;
}

body {
  background-color: #BFC9CA/* var(--bodyBackgroundColor) */;
  font-family: var(--bodyFontFamily), var(--bodyFontFamilyFallback);
  font-size: var(--bodyFontSize);
  font-weight: var(--bodyFontWeight);
  line-height: var(--bodyLineHeight);
  margin: 0;
  min-height: 100%;
}

/* modules/anchor.css */

:root {
  --anchorColor: inherit;
  --anchorHoverColor: #1dabb8;
}

a {
  color: var(--anchorColor);
  text-decoration: none;
  transition: color 0.3s;
}

a:hover {
  color: var(--anchorHoverColor);
}

/* modules/form.css */

fieldset {
  border: none;
  margin: 0;
}

input {
  appearance: none;
  border: none;
  font: inherit;
  margin: 0;
  outline: none;
  padding: 0;
}

input[type='submit'] {
  cursor: pointer;
}

.form input[type='email'],
.form input[type='password'] {
  width: 100%;
}

/* modules/login.css */

:root {
  --loginBorderRadius: 0.25em;
  --loginHeaderBackgroundColor: #282830;

  --loginInputBorderRadius: 0.25em;
}

.login__header {
  background-color: var(--loginHeaderBackgroundColor);
  border-top-left-radius: var(--loginBorderRadius);
  border-top-right-radius: var(--loginBorderRadius);
  color: #fff;
  padding: 1.5em;
  text-align: center;
  text-transform: uppercase;
}

.login__title {
  font-size: 1rem;
  margin: 0;
}

.login__body {
  background-color: #fff;
  padding: 1.5em;
  position: relative;
}

.login__body::before {
  background-color: #fff;
  content: '';
  height: 0.5em;
  left: 50%;
  margin-left: -0.25em;
  margin-top: -0.25em;
  position: absolute;
  top: 0;
  transform: rotate(45deg);
  width: 0.5em;
}

.login input[type='email'],
.login input[type='password'] {
  border: 0.0625em solid #e5e5e5;
  padding: 1em 1.25em;
}

.login input[type='email'] {
  border-top-left-radius: var(--loginInputBorderRadius);
  border-top-right-radius: var(--loginInputBorderRadius);
}

.login input[type='password'] {
  border-bottom-left-radius: var(--loginInputBorderRadius);
  border-bottom-right-radius: var(--loginInputBorderRadius);
  border-top: 0;
}

.login input[type='submit'] {
  background-color: #1dabb8;
  border-radius: var(--loginInputBorderRadius);
  color: #fff;
  font-weight: 700;
  order: 1;
  padding: 0.75em 1.25em;
  transition: background-color 0.3s;
  
}

.login input[type='submit']:focus,
.login input[type='submit']:hover {
  background-color: #198d98;
}

.login__footer {
  align-items: center;
  background-color: #fff;
  border-bottom-left-radius: var(--loginBorderRadius);
  border-bottom-right-radius: var(--loginBorderRadius);
  display: flex;
  justify-content: space-between;
  padding-bottom: 1.5em;
  padding-left: 1.5em;
  padding-right: 1.5em;
}

.login__footer p {
  margin: 0;
}

.profile{
	font-family: 'Do Hyeon', sans-serif; 
	font-size: 22px;
}

input{
	font-family: 'Do Hyeon', sans-serif; 
	font-size: 18px;
}

.form__field{
	width: 300px;
}

#memberPw{
	width: 100%;
}



</style>
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/form/header.jsp" %>
	
	<br><br><br><br><br>
	
	
	<div class="align">

  		<div class="grid">
    	
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
			<input type="hidden" id="memberId" value="${principal.username }">
	
		    <header class="login__header">
        		  <span class="profile login__title">비밀번호 변경하기</span>
      	    </header>
	
	        <div class="login__body">
	
	        <div class="form__field">
	          <input type="password" id="memberPw" placeholder="비밀번호를 입력해주세요." required="required">
	        </div>
	
	        </div>
	
		    <footer class="login__footer">
		        <input type="button" class="btn btn-light" onclick="changePassword();" value="변경" id="change">
		        <input type="button" class="btn btn-primary" value="취소" id="cancle" onclick="location.href='/poli/main.do'">
		    </footer>

  		</div>
 
	</div>
	
	<br><br><br><br><br>
	
	<%@ include file="/WEB-INF/views/form/footer.jsp" %>
	
	<script type="text/javascript">
	
	function changePassword(){

		var member_id = $("#memberId").val().trim();
		var member_pw = $("#memberPw").val().trim();
		
		console.log("member_id : " + member_id + "  member_pw : " + member_pw);
		
		if(member_id == null || member_id == "" || member_pw == null || member_pw == ""){
			alert("비밀번호를 입력해주세요.");
		}
	
		var ajax = new ComAjax();
		
		var updatePassword = {
				
				"member_id" : member_id,
				"member_pw" : member_pw
		}
		
		ajax.url("/poli/updatePassword.do");
		ajax.param(updatePassword);
		
		ajax.success(function(msg){
			
			if(msg.isChange == true){
				
				alert("비밀번호가 성공적으로 수정되었습니다.");
				location.href="/poli/main.do"
				
			} else {
				
				location.reload();
			}
			
		})
		
		ajax.call();
		
	}
	
	</script>

</body>
</html>