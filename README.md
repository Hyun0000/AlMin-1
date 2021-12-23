# 우리가 어떤 민족입니까? [알바의 민족]
팀원: 채선혜(조장), 김현영, 김진주, 고성화

[WAR 배포 링크](http://112.221.156.36:8090/almin) ✔Click

## Contents 
1. 개요
2. 설계의 주안점
3. 사용기술 및 개발환경
4. 프로젝트 기능 구현
5. 주요기능
6. Document
***
## 개요
* 아르바이트 구인구직 사이트 
* 위드코로나와 함께 구직자와 업장 모두 아르바이트를 구할 수 있는 중개 플랫폼
***
## 설계의 주안점
* Spring Legacy Project(MVC 구조)
* Restful한 설계방식
***
## 사용기술 및 개발환경

Language | Java 8, Servlet/JSP, HTML5, CSS3, JavaScript, XML 
------------ | ------------- 
Browser | Chrome, Whale 
Web Application Server | Apache Tomcat 8.5
Database|Oracle 11g Express Edition
Framework & Open Api|Spring, MyBatis, Ajax, jQuery, Bootstrap, FullCalendar, Google Calendar, Chart.js, Naver 로그인, Kakao 로그인, Facebook 로그인, Kakao 지도, Daum 주소찾기, Selenium, 국세청 사업자번호조회, CKEditor
설계분석도구|erdCloud, oven, draw.io
IDE|STS 3.9.12 / sqldeveloper
Version Control System|Git / github
***
## 프로젝트 기능 구현

* #### 채선혜
  *  크롤링
      * Selenium 사용하여 알바몬 채용공고 크롤링 
  * 암호화(properties 활용)
     * DBCP 암호화
     * g메일 계정 암호화
  * 인터셉터
    * 로그인 세션체크
    * 권한체크(관리자/개인회원/기업회원) 
  * 로그인 페이지
    * 네이버, 카카오, 페이스북 로그인 API 사용
  * 회원가입 페이지
    * 국세청 사업자번호 조회, 다음 주소찾기 API 사용
    * Spring-security 비밀번호 암호화
    * 이메일 인증(gmail)
  * 아이디 찾기
  * 비밀번호 찾기
  * 마이페이지
    * 회원정보 조회/수정
    * 비밀번호 변경
* #### 김현영
  * 지원자 조회(지원시 이력서 선택)
  * 공고 지원자 조회 및 지원자 상세 경력 조회
    * Chart.js API 사용
  * 기업 후기 등록/수정/삭제/조회(Ajax)
  * Drag&Drop 방식을 이용한 기업 후기 등록/수정
  * 각 공고별 가장 많이 선택된 키워드 조회
  * 지원&면접 일자 조회/등록/수정/삭제(Ajax)
  * 근무일자 조회/등록/수정/삭제(Ajax)
     * Fullcalendar API 사용
     * Google Calendar API 사용
     * MDTimePicker, js-calendar Library 사용
     * Drag&Drop 방식을 통한 일정 수정 가능  
  * 월별 구직&근무 Chart 데이터 조회
  * 개인 경력 Chart 데이터 조회
     * Chart.js API 사용
  * 근무 매장별 월별 총 급여 계산
* #### 김진주
  * 채용공고 목록 & 검색
  * 인재정보 목록 & 검색
  * 의심공고 신고
  * 개인서비스
    * 관심 채용정보 찜
    * 맞춤공고 추천
  * 기업서비스
    * 관심 인재 찜
  * 관리자 기능
    * 회원 조회/검색
    * 회원 강제탈퇴
    * 의심공고 조회/삭제
*  #### 고성화
    *  채용공고 상세조회
        * Kakao 지도 API 사용  
    *  인재정보 상세조회
    *  채용공고 등록/수정/삭제
        * 공고 공개/비공개  
        * 개인 공고 조회
        * CKEditor API 사용  
    *  이력서 등록/수정/삭제
       * 이력서 공개/비공개  
       * 개인 이력서 조회
       * 이력서 출력
    *  공고 지원하기
***
## 주요 기능
* [UI 설계서 링크](https://xd.adobe.com/view/d7cc2dbc-4a1b-4f36-947f-331cb5543744-829f/) ✔Click
<img src="https://user-images.githubusercontent.com/89828294/147194493-3efb5df4-dff3-4b09-a3e1-a945fee03112.png">
<img src="https://user-images.githubusercontent.com/89828294/147194438-79dd0bb5-d655-4e59-b477-1e1635052d69.png">
<img src="https://user-images.githubusercontent.com/89828294/147194462-6a445b96-7449-4c11-b3a7-97b8e9537605.png">
<img src="https://user-images.githubusercontent.com/89828294/147194468-38375c67-db12-490d-86c3-fc48393deb54.png">
<img src="https://user-images.githubusercontent.com/89828294/147194529-5fdef865-9c3f-42d5-ace0-581c3eaf77d6.png">
<img src="https://user-images.githubusercontent.com/89828294/147194479-4a8742a0-30a2-414e-bca6-1e7a68baeed9.png">
<img src="https://user-images.githubusercontent.com/89828294/147194573-3b25f5c2-b180-4eb7-9503-7825958bc7c8.png">
<img src="https://user-images.githubusercontent.com/89828294/147194578-7d9cf684-096a-472c-a3d1-47fab962d593.png">
<img src="https://user-images.githubusercontent.com/89828294/147194579-bfae85dc-bb77-4209-80de-32665817b8d8.png">

***
## Document
1. 유스케이스
<img src="https://user-images.githubusercontent.com/89828294/147045092-4e5bef5f-b9e0-4e48-86c2-a42d8f2e41eb.png">

2. ERD
<img src="https://user-images.githubusercontent.com/89828294/147045496-4f8b6c82-3aa0-440f-96e2-7b5ae9a02559.png">

3. SQL문  
[[알바의 민족] Oracle DB 계정생성.txt](https://github.com/Seonhea/AlMin/files/7760540/Oracle.DB.txt)  
[Dclass_almin_almin2021.txt](https://github.com/Seonhea/AlMin/files/7760493/Dclass_almin_almin2021.txt)

4. 보고서 및 발표PPT  
[[알바의 민족] 기획보고서.pdf](https://github.com/Seonhea/AlMin/files/7760484/default.pdf)  
[[알바의 민족] DB설계보고서.pdf](https://github.com/Seonhea/AlMin/files/7760485/DB.pdf)  
[[알바의 민족] 클래스 설계보고서.pdf](https://github.com/Seonhea/AlMin/files/7760486/default.pdf)  
[[알바의 민족] 파이널 발표자료.pdf](https://github.com/Seonhea/AlMin/files/7760479/default.pdf)


