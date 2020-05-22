<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- START :: CSS -->
<style type="text/css">

</style>
<!-- START :: JAVASCRIPT -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/poli/resources/js/ajaxCommon.js"></script>
<script type="text/javascript">

			

</script>
<!-- END :: JAVASCRIPT -->
</head>
<body>

	<div class="container">
	
		<form action="signOutForm.do" method="post">
			<input type="hidden" id="member_id" value="${loginDto.member_id }">
		</form>
		
			<div>
				<div><p>비밀번호를 입력해주시기 바랍니다.</div>
				<div><input type="password" id="member_pw"></div>
			</div>
			
			<div>
				<input type="button" value="확인" onclick="confirmPW();">
			</div>
	
	</div>

	<!-- START :: JAVASCRIPT -->	
	<script type="text/javascript">

		function confirmPW(){
			
			var member_id = $("#member_seq").val().trim();
			var member_pw = $("member_pw").val().trim();
			
			var ajax = new ComAjax();
			
			if(member_pw == null || member_pw == ""){
				alert("비밀번호를 입력해주세요.");
			} else {
				
				var checkPW = {
						"member_id" : member_id,
						"member_pw" : member_pw
				}
				
				ajax.url("/poli/login.do");
				ajax.param(checkPW);
				
				ajax.success(function(msg){
					if(msg.loginCheck == true){
						var isSingOut = window.confirm();
						
						if(isSignOut){
							
							var ajax = new ComAjax();
							
							var singOut = {
									"member_id" : member_id,
									"member_pw" : member_px
							}
							
							ajax.url("/poli/dropId.do?");
							ajax.param(isSignOut);
							
							ajax.success(function(res){
								
								if(res == true){
									alert("탈퇴 성공하셨습니다!");
									location.href="/poli/main.do";
								}
								
							})

						}
					}
				});
				
				ajax.call(); 			// ajax 호출
				
			}
			
		}	

	</script>
<!-- END :: JAVASCRIPT -->

</body>
</html>