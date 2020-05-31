<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정치로</title>
<link rel="stylesheet" type="text/css"
	href="/poli/resources/css/footer.css" />
</head>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
	function showPopup() {
		window.open("/poli/paymentpopup.do", "paymentpopup",
				"width=700, height=600, left=300, top=50");
	}
</script>

<body>
	<!-- 여백 -->
	<div style="height: 50px;"></div>

	<div id="footer">

		<div id="footer_inner">
			<div id="footer_contact">
				Contact Us<br>
				<p><a onclick="showPopup();" style="cursor: pointer">후원하기</a><br><br></p>
			</div>

			<div id="footer_help">
 				Help<br>
				<img src="/poli/resources/images/chatbot.png" style="height: 80px; width:80px;">
			</div>

			<div id="footer_copyright"><br><br>copyright (c) 2020 qclass 국민을 | All Rights Reserved.<br><br></div>

		</div>
	</div>
</body>
</html>