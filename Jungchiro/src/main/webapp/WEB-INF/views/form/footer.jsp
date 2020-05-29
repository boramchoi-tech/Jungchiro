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

			<div id="footer_about">
				About Us<br> <br>
			</div>

			<div id="footer_contact">
				Contact Us<br> <br>
			</div>

			<div id="footer_help">
				Help<br> 
				챗봇 QR코드<br>
				<img src="/poli/resources/images/chatbot.png" style="height: 80px; width:80px;"><br>
				<p onclick="showPopup();" style="cursor: pointer">후원</p>
			</div>

			<div id="footer_copyright">copyright (c) 2020 qclass final 2조 |
				All Rights Reserved.</div>

		</div>
	</div>
</body>
</html>