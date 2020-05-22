<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">

	$(function() {

		$("#payment").click(function() {

			var IMP = window.IMP; // 생략해도 ok

			IMP.init('imp99583202'); // 가맹점 식별 코드

			IMP.request_pay({ // 결제창 호출
				pg : 'kakaopay', // 결제 방법
				/* 	html5_inicis(이니시스웹표준)
					inicis(이니시스ActiveX결제창)
					kcp(NHN KCP)
					kcp_billing(NHN KCP 정기결제)
					uplus(LGU+)
					nice(나이스페이)
					jtnet(JTNet)
					kakaopay(카카오페이)
					danal(다날휴대폰소액결제)
					danal_tpay(다날일반결제)
					mobilians(모빌리언스 휴대폰소액결제)
					settle(세틀뱅크)
					syrup(시럽페이)
					payco(페이코)
					paypal(페이팔)
					eximbay(엑심베이)
					naverco(주문형-네이버페이)
					naverpay(결제형-네이버페이)
					smilepay(스마일페이) */
				pay_method : 'card', //결제 수단
				/* card(신용카드)
				trans(실시간계좌이체)
				vbank(가상계좌)
				phone(휴대폰소액결제)
				samsung(삼성페이 / 이니시스, KCP 전용)
				kpay(KPay앱 직접호출 / 이니시스 전용)
				cultureland(문화상품권 / KG이니시스, KCP, LGU+ 지원)
				smartculture(스마트문상 / KG이니시스, KCP, LGU+ 지원)
				happymoney(해피머니 / KG이니시스, KCP지원)
				booknlife(도서문화상품권 / KG이니시스, KCP, LGU+지원) */

				merchant_uid : 'merchant_' + new Date().getTime(), //주문번호
				customer_uid : 'your_customer_1234',

				name : '주문명 : 정치로 개발팀 후원', // 
				//결제창에서 보여질 이름
				amount : 100,
				//가격

				buyer_email : '', // session값 으로 입력
				buyer_name : '', // session값 으로 입력
				buyer_tel : '', // session값 으로 입력
				buyer_addr : '', // api 사용 입력
				buyer_postcode : '', // api 사용 입력
				m_redirect_url : ''
			/*
			모바일 결제시,
			결제가 끝나고 랜딩되는 URL을 지정
			(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
			 */
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;

					$.ajax({
						url : "https://www.myservice.com/payments/complete", // 가맹점 서버
						method : "POST",
						headers : {
							"Content-Type" : "application/json"
						},
						data : {
							imp_uid : rsp.imp_uid,
							merchant_uid : rsp.merchant_uid
						}
					/* 가맹점 서버에 imp_uid(거래 고유 번호)를 전달하면 
					아임포트 서버에서 imp_uid로 결제 정보를 조회가능,
					가맹점에서 관리하는 주문번호인 merchant_uid로 가맹점의 데이터베이스에서 주문 정보를 조회
					조회한 정보들을 통해 결제 위변조 여부를 검증하고, 서비스의 데이터베이스에 저장 */

					}).done(function(data) {
						// 가맹점 서버 결제 API 성공시 로직
						alert("결제에 성공하였습니다.");
					})
				} else {
					alert("결제에 실패하였습니다 : " + rsp.error_msg);
				}

				console.log(msg);
			});

			/* curl -H "Content-Type: application/json" \   
			 -X POST -d '{"card_number":"1234-1234-1234-1234", "expiry":"2019-01", "birth":"801231", "pwd_2digit":"00"}' \
			 https://api.iamport.kr/subscribe/customers/your-customer-unique-id */
		});

	})
</script>

<body>
<h1>정치로 개발자 후원 페이지</h1>
	<!-- 결제버튼 -->
	<button id="payment" type="button">후원</button>
	<!-- 결제버튼 -->
	<input type="button" value="닫기" onclick="self.close();" />
</body>
</html>