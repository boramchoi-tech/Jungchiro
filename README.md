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
JAVA, HTML/CSS, Javascript/JQuery, Spring, Spring Boot, JPA   
Apache Tomcat, Oracle, MongoDB, Docker, ElasticSearch, Logstash, Eclipse, GitHub, Slack, Microsoft Azure   
---
* **프로젝트 구성원 및 구현 기능 상세 설명**
  > **팀 이름**: 국민을  
  > **총 4주간 진행**  
   * **최보람(조장)**: 서버 구축 및 배포, 다대다 채팅, 뉴스 검색 기능   
     * Microsoft Azure 사용하여 Linux 환경에서 서버 구축 및 프로젝트 배포 - jdk, Apache Tomcat  
     * Docker 설치, docker-compose 사용하여 MongoDB - ElasticSearch container 생성  
     * Python 파일 백그라운드 작업  
     * Logstash 사용하여 파이프라인 실행, MongoDB -> ElasticSearch 데이터 CRUD  
     * ElasticSearch로 뉴스 검색 기능 구현 (메인의 워드클라우드 클릭 시 검색 기능과 똑같이 적용)  
     * Spring Websocket 사용하여 다대다 채팅 구현  
   * **김로운**: 자유게시판, 의안 페이지, 후원 페이지  
   * **이민경**: 워드클라우드, 지도 페이지, 로그인/회원가입, Spring Security  
   * **이성우**: Python 뉴스 크롤링, 뉴스 페이지, 관리자 페이지  
   * **전영태**: 댓글 알림, 마이 페이지  
