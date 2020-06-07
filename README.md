## 정치로 Jungchiro  
* **KH final project**  
* **URL**: http://52.231.155.109:8080/poli/  
---
* **개요**   
국민들의 정치 참여율이 높아지고 있음. 그러나 정치 정보를 얻을 환경이 제공되지 않아 관련 사이트들의 접근성이 떨어짐. 복잡한 정치 사이트들을 사용자가 원하는 정보를 쉽게 검색할 수 있도록 보완하여 서비스함. 각 홈페이지별(국회 사이트, 의안 정보, 신문사별 정치 뉴스 등)로 분산되어 있는 정치 정보를 한 곳에 모아 제공하고자 함. 사회구성원의 토의를 이끌고 사회적 합의를 이끌어 낼 공론장 역할을 할 환경과 정보 접근성을 높여 정치에 대한 국민의식 제공 및 올바른 정치 문화에 기여할 수 있는 환경을 구축함.   
   
   
* **설계 주안점**   
정치 정보 데이터 시각화를 통해 직관적으로 데이터를 제공함   
홈페이지 내 통합 검색 기능으로 정보 접근성을 높임   
즐겨찾기 기능, 알람 기능, 채팅 기능 등으로 사용자에게 편의성을 제공함   
---
* **프로젝트 구성**   
JAVA, HTML/CSS, Javascript/JQuery, Spring Framework, Spring Boot, JPA
Apache Tomcat, Oracle, MyBatis, MongoDB, Docker, ElasticSearch, Logstash, Eclipse, GitHub, Slack, Microsoft Azure
---
* **프로젝트 구성원 및 구현 기능 상세 설명**

  > **팀 이름**: 국민을  
  > **총 4주간 진행**  
   * **최보람(조장)**: 서버 구축 및 배포, 다대다 채팅, 뉴스 검색 기능   
     * Microsoft Azure 사용하여 Linux 환경에서 서버 구축 및 프로젝트 배포 - jdk, Apache Tomcat  
     * Docker 설치, docker-compose 사용하여 MongoDB - ElasticSearch container 생성  
     * Python 파일 백그라운드 작업  
     * Logstash 사용하여 파이프라인 실행, MongoDB 데이터 -> ElasticSearch 데이터 삽입, ElasticSearch CRUD  
     * ElasticSearch로 뉴스 검색 기능 구현 (메인의 워드클라우드 클릭 시 검색 기능과 똑같이 적용)  
     * ajax 모듈화 (ajaxCommon.js) 후 프로젝트에 적용
     * Spring Websocket 사용하여 다대다 채팅 구현
     * 전체 채팅방 목록, 내가 참여한 채팅방 목록 ajax 사용
   * **김로운**: 자유게시판, 의안 페이지, 후원 페이지  
     * 의안 정보 페이지 구현 (페이징)
     * 자유게시판 CRUD, 글 검색, 페이징, 댓글 ajax 사용하여 출력
     * 카카오페이 api 사용하여 후원 페이지 구현
   * **이민경**: 워드클라우드, 지도 페이지, 로그인/회원가입, Spring Security
     * 회원가입 - 아이디/이메일 유효성 검사, 이메일 인증 (SMTP), Spring Security 비밀번호 암호화
     * Spring Security 사용하여 권한 분리, 인증 Token 사용
     * MongoDB의 news 최근 데이터 100개 추출 후 가장 많이 나온 단어 50개 추출, Konlpy로 한글 자연어 처리
     * 자연어 처리한 데이터 json 파일 저장 -> amchart.js에 적용시켜 워드클라우드 생성
     * geoJSON, geolocation으로 지도 기능 구현, 투표 정보에 따른 시각화 -> 지도 클릭 시 주변 5km 투표소 시각화 (서울)
   * **이성우**: Python 뉴스 크롤링, 뉴스 페이지, 관리자 페이지  
     * Python으로 3개 신문사의 데이터 크롤링 (threading, timer 사용하여 자동화) -> 중복 데이터 필터링 후 MongoDB 저장
     * 뉴스 페이지 - MongoDB에 저장된 날짜순으로 정렬, 카카오 api를 통해 공유 기능 구현
     * Spring boot, JPA - Hibernate로 관리자 페이지 구현 (차단 회원 검색, 차단 해제)
     * 차단 회원 목록 Drag & Drop으로 신고 내역 확인
     * Google Analytics api로 방문자 로그 (세션 유지 시간, 페이지에 머무른 시간, 세션별 페이지 등) 시각화
     * footer의 QR code 인식 시 카카오톡 채널로 넘어감
   * **전영태**: 자유게시판, 댓글 알림, 마이 페이지  
     * 댓글 알림: SSE (Server sent event) 사용
     * Quartz 사용하여 스케줄러 사용 (10초에 한번씩 알림 업데이트)
     * 자유게시판 - CKEditor 사용 / 즐겨찾기 기능 ajax 사용 / 쿠키 사용하여 조회수 중복 제한 (하루에 한 번)
     * 전체 즐겨찾기 데이터는 더보기(페이징) 사용하여 데이터 출력
     * 마이페이지 비밀번호 변경 (Spring Security 비밀번호 암호화), 마이페이지 회원 탈퇴 기능 구현
