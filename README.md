# 정치로 Jungchiro  
KH final project  
url: http://52.231.155.109:8080/poli/ (Microsoft Azure 사용하여 서버 구축)  

* 개요   
국민들의 정치 참여율이 높아지고 있음. 그러나 정치 정보를 얻을 환경이 제공되지 않아 관련 사이트들의 접근성이 떨어짐. 복잡한 정치 사이트들을 사용자가 원하는 정보를 쉽게 검색할 수 있도록 보완하여 서비스함. 각 홈페이지별(국회 사이트, 의안 정보, 신문사별 정치 뉴스 등)로 분산되어 있는 정치 정보를 한 곳에 모아 제공하고자 함. 사회구성원의 토의를 이끌고 사회적 합의를 이끌어 낼 공론장 역할을 할 환경과 정보 접근성을 높여 정치에 대한 국민의식 제공 및 올바른 정치 문화에 기여할 수 있는 환경을 구축함.   
   
* 구현 기능   
회원 가입 및 로그인, 이메일 인증, 뉴스, 지도, 의안 정보, 자유 게시판, 채팅, 마이 페이지, 관리자 페이지, 후원 페이지, 통합 검색   
   
* 설계 주안점   
- 정치 정보 데이터 시각화를 통해 직관적으로 데이터를 제공함   
- 홈페이지 내 통합 검색 기능으로 정보 접근성을 높임   
- 즐겨찾기 기능, 알람 기능, 채팅 기능 등으로 사용자에게 편의성을 제공함   

* 사용 기술 및 개발 환경   
기본 개발툴: Eclipse JAVA EE IDE   
협업 툴: Github, Slack   

공통: Microsoft Azure (서버), Spring Security (권한 및 인증), ajax 모듈화
Python 크롤링, MongoDB, amchart.js, Konlpy, geoJSON, Geolocation, CKEditor, Spring websocket, Spring boot, JPA, 카카오페이 api, ElasticSearch
