/*시퀀스 삭제*/
DROP SEQUENCE BILL_SEQ;

/*테이블 삭제*/
DROP TABLE BILL;

/*시퀀스 생성*/
CREATE SEQUENCE BILL_SEQ;

/*테이블 생성*/
CREATE TABLE BILL(
BILL_NUMBER NUMBER NOT NULL PRIMARY KEY,
BILL_SEQ NUMBER NOT NULL,
BILL_TYPE VARCHAR2(500) NOT NULL,
BILL_NAME VARCHAR2(1000) NOT NULL,
BILL_PROPOSER VARCHAR2(500) NOT NULL,
PROPOSE_DATE DATE NOT NULL,
DECIDE_DATE DATE,
DECIDE_RESULT VARCHAR2(500),
BILL_CONTENT VARCHAR2(10),
CONTENT_ADDRESS VARCHAR2(4000),
BILL_STATUS VARCHAR2(500) NOT NULL
);

/*의안 INSERT*/

INSERT INTO BILL VALUES (2024914, BILL_SEQ.NEXTVAL,'처리의안', '지역사랑상품권 이용 활성화에 관한 법률안(대안)', '위원장', to_date('2020-04-29','yyyy-mm-dd'), to_date('2020-04-29','yyyy-mm-dd'), '원안가결', null, null, '공포');

INSERT INTO BILL VALUES (2024915, BILL_SEQ.NEXTVAL,'처리의안', '도로교통법 일부개정법률안(대안)', '위원장', to_date('2020-04-29','yyyy-mm-dd'), to_date('2020-04-29','yyyy-mm-dd'), '원안가결', null, null, '정부이송');

INSERT INTO BILL VALUES (2024916, BILL_SEQ.NEXTVAL,'처리의안', '주한미군 소속 한국인 근로자의 지원을 위한 특별법안(대안)', '위원장', to_date('2020-04-29','yyyy-mm-dd'), to_date('2020-04-29','yyyy-mm-dd'), '원안가결', '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_J2U0P0L4B2A9K1I0P2J8G4I2E2S4L9', '정부이송');

INSERT INTO BILL VALUES (2024917, BILL_SEQ.NEXTVAL,'처리의안', '양성평등기본법 일부개정법률안(대안)', '위원장', to_date('2020-04-29','yyyy-mm-dd'), to_date('2020-04-30','yyyy-mm-dd'), '원안가결', '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_F2N0V0Q2G2X4H0M9Z5P1R4E1Z8O8L1', '정부이송');

INSERT INTO BILL VALUES (2024918, BILL_SEQ.NEXTVAL,'처리의안', '아동·청소년의 성보호에 관한 법률 일부개정법률안(대안)', '위원장', to_date('2020-04-29','yyyy-mm-dd'), to_date('2020-04-30','yyyy-mm-dd'), '원안가결', '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_V1B8I0Z2H2X0A1V3F2S5U1H6U3K9C8', '정부이송');

INSERT INTO BILL VALUES (2024919, BILL_SEQ.NEXTVAL,'처리의안', '다문화가족지원법 일부개정법률안(대안)', '위원장', to_date('2020-04-29','yyyy-mm-dd'), to_date('2020-04-30','yyyy-mm-dd'), '원안가결', '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_N2R0U0Y2B2P4E0K9E5K2Q2C1A9I7B1', '정부이송');

INSERT INTO BILL VALUES (2024920, BILL_SEQ.NEXTVAL,'처리의안', '여객자동차 운수사업법 일부개정법률안(대안)', '위원장', to_date('2020-04-29','yyyy-mm-dd'), to_date('2020-04-30','yyyy-mm-dd'), '원안가결', '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_Y1H9Z1K1X2D8M0N8B3D4P3A6W8T1O6','정부이송');

INSERT INTO BILL VALUES (2024921, BILL_SEQ.NEXTVAL,'처리의안', '아이돌봄 지원법 일부개정법률안(대안)', '위원장', to_date('2020-04-29','yyyy-mm-dd'), to_date('2020-04-30','yyyy-mm-dd'), '원안가결', '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_Y2N0Y0F2O2E4M0A9G4O9S1F1R4L8S1','정부이송');

INSERT INTO BILL VALUES (2024922, BILL_SEQ.NEXTVAL,'처리의안', '공휴일 본회의 개의에 관한 건', '의장', to_date('2020-04-29','yyyy-mm-dd'), to_date('2020-04-29','yyyy-mm-dd'), '원안가결', null, null,'본회의의결');

INSERT INTO BILL VALUES (2024923, BILL_SEQ.NEXTVAL,'처리의안', '정보통신망 이용촉진 및 정보보호 등에 관한 법률 일부개정법률안(이원욱의원 등 13인)', '의원', to_date('2020-05-04','yyyy-mm-dd'), to_date('2020-05-20','yyyy-mm-dd'), '대안반영폐기', '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_U2N0H0M5V0I4T1X8V1U3I4E1Y4J3S0','대안반영폐기');


INSERT INTO BILL VALUES (2024924, BILL_SEQ.NEXTVAL,'처리의안', '전기통신사업법 일부개정법률안(이원욱의원 등 13인)', '의원', to_date('2020-05-04','yyyy-mm-dd'), to_date('2020-05-20','yyyy-mm-dd'), '대안반영폐기', '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_V2Y0V0X5K0W4D1D8O1V7S4L9F6K0Y3','대안반영폐기');

INSERT INTO BILL VALUES (2024928, BILL_SEQ.NEXTVAL,'처리의안', '2019년도 국정감사 결과보고서 채택의 건', '위원장', to_date('2020-05-06','yyyy-mm-dd'), to_date('2020-05-20','yyyy-mm-dd'), '원안가결', null, null,'본회의의결');

INSERT INTO BILL VALUES (2024925, BILL_SEQ.NEXTVAL,'계류의안', '특정강력범죄의 처벌에 관한 특례법 일부개정법률안(권미혁의원 등 11인)', '의원', to_date('2020-05-07','yyyy-mm-dd'), null, null, '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_Y2U0L0C5Q0D7F1C0T4Y8D4P0I6N6V1', '소관위접수');

INSERT INTO BILL VALUES (2024926, BILL_SEQ.NEXTVAL,'계류의안', '아동·청소년의 성보호에 관한 법률 일부개정법률안(권미혁의원 등 11인)', '의원', to_date('2020-05-07','yyyy-mm-dd'), null, null, '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_L2E0G0K5P0W7B1S0I5N5O2L2Q9L8Y3', '소관위접수');

INSERT INTO BILL VALUES (2024927, BILL_SEQ.NEXTVAL,'처리의안', '산업안전보건법 일부개정법률안(임이자의원 등 10인)', '의원', to_date('2020-05-07','yyyy-mm-dd'), to_date('2020-05-20','yyyy-mm-dd'), '수정가결', '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_M2S0J0G5R0Y7J1Q6C1Y5B2R2H4I6K4', '본회의의결');

INSERT INTO BILL VALUES (2024929, BILL_SEQ.NEXTVAL,'처리의안', '2019년도 국정감사 결과보고서 채택의 건', '위원장', to_date('2020-05-08','yyyy-mm-dd'), to_date('2020-05-20','yyyy-mm-dd'), '원안가결', null, null,'본회의의결');

INSERT INTO BILL VALUES (2024930, BILL_SEQ.NEXTVAL,'처리의안', '2019년도 국정감사 결과보고서 채택의 건', '위원장', to_date('2020-05-08','yyyy-mm-dd'), to_date('2020-05-20','yyyy-mm-dd'), '원안가결', null, null,'본회의의결');

INSERT INTO BILL VALUES (2024931, BILL_SEQ.NEXTVAL,'계류의안', '건설기술 진흥법 일부개정법률안(송석준의원 등 11인)', '의원', to_date('2020-05-11','yyyy-mm-dd'), null, null, '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_S2F0R0V5W1L1H1Q8K3D1G2L1D3V9M6','소관위접수');

INSERT INTO BILL VALUES (2024932, BILL_SEQ.NEXTVAL,'계류의안', '자원의 절약과 재활용촉진에 관한 법률 일부개정법률안(문진국의원 등 11인)', '의원', to_date('2020-05-12','yyyy-mm-dd'), null, null, '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_P2J0Q0D5N1R2O1L7Y1E2M0D1S8T1I9', '소관위접수');

INSERT INTO BILL VALUES (2024933, BILL_SEQ.NEXTVAL,'계류의안', '상장회사법안(채이배의원 등 10인)', '의원', to_date('2020-05-18','yyyy-mm-dd'), null, null, '보기', 'http://likms.assembly.go.kr/bill/summaryPopup.do?billId=PRC_Z2T0H0A5G1H8J1M0Q4W4S0F4E6G6Y4', '회부');





/*SELECT 구문*/
SELECT * FROM BILL ORDER BY BILL_SEQ DESC;

SELECT A.* FROM
	(SELECT B.*, ROWNUM AS RNUM FROM (SELECT * FROM BILL ORDER BY BILL_SEQ DESC)B)A
WHERE RNUM BETWEEN 1 AND 10
ORDER BY BILL_SEQ DESC



