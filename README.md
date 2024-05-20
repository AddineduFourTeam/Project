<p align="center"><img src="src/main/resources/static/img/logo.png" width="294" height="255"></p>

# 🌱주말농장예약 플랫폼
도시 거주자들이 자연에 쉽게 접근할 수 있는 기회를 제공하고자 기획되었습니다. 도시 외각에 조그만 땅을 빌리거나 다양한 농장 체험을 원하는 사람들을 위해 ${\textsf{\color{#01b03f}주말 농장 예약 플랫폼}}$을 개발하게 되었습니다.사용자가 편리하게 **주말농장을 검색**하고, **상세 정보 및 사용자 리뷰**를 바탕으로 **예약**할 수 있도록 사용자 친화적인 인터페이스를 제공합니다.

## Key Features
- 지역주말농장 검색
- 주말농장 예약서비스 
- 농작물 공유 스토리(커뮤니티) 
- 마이페이지
- 회원가입

## Getting Started
### 설치 및 실행 단계
1. **프로젝트 클론하기**
   Git을 사용하여 이 프로젝트를 로컬 시스템으로 클론합니다.
   ```
   https://github.com/AddineduFourTeam/Project.git
   ```
2. **스프링 부트 애플리케이션을 실행하여 웹 서버 시작**
   ```
   ./gradlew bootRun
   ```
3. **웹사이트 접속**

   브라우저를 열고 `http://localhost:1004`로 접속합니다. 애플리케이션의 홈페이지가 표시됩니다.

## 사용법
테스트 아이디, 비밀번호로 로그인하여 진행해 주세요

- **Test ID** : user01

  **Test PW** : 1234

## Architecture
<details>
<summary>Folder Structure</summary>
<div markdown="1">

```

WeekendFarm/
│
├── .gradle/
├── .idea/
├── build/
├── gradle/
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── farm/
│                   ├── config/
│                   │   └── MemberPasswordEncoder.java
│                   ├── controller/
│                   │   ├── AddrController.java
│                   │   ├── BoardController.java
│                   │   ├── FarmController.java
│                   │   ├── HomeController.java
│                   │   ├── MemberController.java
│                   │   ├── MyPageController.java
│                   │   ├── OpenApiController.java
│                   │   └── StoryController.java
│                   ├── domain/
│                   │   ├── Board.java
│                   │   ├── Farm.java
│                   │   ├── Member.java
│                   │   ├── Reservation.java
│                   │   ├── Review.java
│                   │   ├── Story.java
│                   │   └── StoryReply.java
│                   ├── dto/
│                   │   ├── MemberReviewDto.java
│                   │   ├── MemInfoDto.java
│                   │   └── ReservationFarmDto.java
│                   ├── filter/
│                   │   ├── CustomInterceptor.java
│                   │   └── WebConfig.java
│                   ├── other/
│                   │   ├── CDataExtractor.java
│                   │   └── TestMain.java
│                   ├── repository/
│                   │   ├── BoardRepository.java
│                   │   ├── FarmRepository.java
│                   │   ├── MemberRepository.java
│                   │   ├── ReservationRepository.java
│                   │   ├── ReviewRepository.java
│                   │   ├── StoryReplyRepository.java
│                   │   └── StoryRepository.java
│                   ├── service/
│                   │   ├── BoardService.java
│                   │   ├── CommonService.java
│                   │   ├── KakaoApiExplorer.java
│                   │   ├── ListService.java
│                   │   ├── MemberService.java
│                   │   ├── OpenApiExplorer.java
│                   │   ├── OpenApiService.java
│                   │   ├── ReservationService.java
│                   │   ├── StoryService.java
│                   │   ├── ServletInitializer.java
│                   │   └── WeekendFarmApplication.java
│
├── resources/
│   └── static/
│       ├── css/
│       │   ├── animate.css
│       │   ├── font.css
│       │   ├── reset.css
│       │   └── style.css
│       ├── files/
│       └── fonts/
│           ├── AppleSDGothicNeoB.eot
│           ├── AppleSDGothicNeoB.ttf
│           ├── AppleSDGothicNeoB.woff
│           ├── AppleSDGothicNeoB.woff2
│           ├── AppleSDGothicNeoEB.eot
│           ├── AppleSDGothicNeoEB.ttf
│           ├── AppleSDGothicNeoEB.woff
│           ├── AppleSDGothicNeoEB.woff2
│           ├── AppleSDGothicNeoH.eot
│           ├── AppleSDGothicNeoH.ttf
│           ├── AppleSDGothicNeoH.woff
│           ├── AppleSDGothicNeoH.woff2
│           ├── AppleSDGothicNeoL.eot
│           ├── AppleSDGothicNeoL.ttf
│           ├── AppleSDGothicNeoL.woff
│           ├── AppleSDGothicNeoL.woff2
│           ├── AppleSDGothicNeoM.eot
│           ├── AppleSDGothicNeoM.ttf
│           ├── AppleSDGothicNeoM.woff
│           ├── AppleSDGothicNeoM.woff2
│           ├── AppleSDGothicNeoR.eot
│           ├── AppleSDGothicNeoR.ttf
│           ├── AppleSDGothicNeoR.woff
│           ├── AppleSDGothicNeoR.woff2
│           ├── AppleSDGothicNeoSB.eot
│           ├── AppleSDGothicNeoSB.ttf
│           ├── AppleSDGothicNeoSB.woff
│           ├── AppleSDGothicNeoSB.woff2
│           ├── AppleSDGothicNeoT.eot
│           ├── AppleSDGothicNeoT.ttf
│           ├── AppleSDGothicNeoT.woff
│           ├── AppleSDGothicNeoT.woff2
│           └── AppleSDGothicNeoUL.eot
│           ├── AppleSDGothicNeoUL.ttf
│           ├── AppleSDGothicNeoUL.woff
│           └── AppleSDGothicNeoUL.woff2
│       └── img/
│           ├── bg01.jpg
│           ├── bg02.jpg
│           ├── bg03.jpg
│           ├── busan.jpg
│           ├── check.svg
│           ├── chungcheong.jpg
│           ├── favicon.ico
│           ├── favicon.png
│           ├── field.png
│           ├── field_on.png
│           ├── gangwon.jpg
│           ├── gangwon02.jpg
│           ├── gyeonggi.png
│           ├── gyeongsang.png
│           ├── jeolla.jpg
│           ├── jeolla02.jpg
│           ├── location.svg
│           ├── logo.png
│           ├── logo_w.png
│           ├── logoimg.png
│           ├── mainimg.jpg
│           ├── mainimg2.jpg
│           ├── placeholder.png
│           ├── profileImg.png
│           ├── profileImg_w.png
│           ├── seoul.jpg
│           ├── seoul02.jpg
│           └── sprout.png
│       └── js/
│           ├── aos.min.js
│           ├── script.js
│           └── wow.min.js
│   ├── application.properties
│   └── webapp/
│
├── test/
├── .gitignore
├── build.gradle
├── gradlew
├── gradlew.bat
├── README.md
└── settings.gradle

```
</div>
</details>


## 3. 시스템 요구 사항
- 웹 브라우저(권장: 최신 버전의 Chrome, Edge 등)
- 데이터베이스 시스템 : Oracle 21c
- 프레임워크 : Spring boot

## 4. 시작하기
1. 환경 설정 및 설치 : JDK17, IDE(IntelliJ)
2. 의존성 관리 - Gradle, Spring Data JPA 등
3. 데이터베이스 설정 : Oracle 21c 데이터베이스를 사용하며, 연결 정보는 application.properties파일에서 관리
4. 스프링 부트 애플리케이션을 실행하여 웹 서버 시작 - [WeekendFarm](http://localhost:1004)

## 5. 소스 아키텍처
[프로젝트의 소스 아키텍처에 대한 간략한 설명을 여기에 제공하세요. 필요에 따라 그림이나 다이어그램을 추가할 수 있습니다.]

## License
MIT License Copyright (c) 2024 eun-su-jeong
