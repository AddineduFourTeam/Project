<p align="center"><img src="src/main/resources/static/img/logo.png" width="294" height="255"></p>

# 🌱주말농장예약 플랫폼
도시 거주자들이 자연에 쉽게 접근할 수 있는 기회를 제공하고자 기획되었습니다. 도시 외각에 조그만 땅을 빌리거나 다양한 농장 체험을 원하는 사람들을 위해 ${\textsf{\color{#01b03f}주말 농장 예약 플랫폼}}$을 개발하게 되었습니다.사용자가 편리하게 **주말농장을 검색**하고, **상세 정보 및 사용자 리뷰**를 바탕으로 **예약**할 수 있도록 사용자 친화적인 인터페이스를 제공합니다.

## Key Features
<img width="732" alt="image" src="https://github.com/AddineduFourTeam/Project/assets/83636742/7b141c38-3c16-4a23-8344-23f1ea03a0b2">

- **메인**: 농장의 정보를 리스트로 볼 수 있습니다.
- **예약서비스** : 상세페이지를 보고 바로 주말 농장을 예약할 수 있습니다. 
- **농작물 공유 스토리(커뮤니티)**: 자신의 농작물을 자랑하는 공간입니다. 
- **마이페이지**: 본인의 활동을 한번에 볼 수 있습니다.
- **회원가입, 로그인**

## System Requirements
- 웹 브라우저(권장: 최신 버전의 Chrome, Edge 등)
- 데이터베이스 시스템 : Oracle 21c
- 프레임워크 : Spring boot

## Getting Started
### 설치 및 실행 단계

환경 설정 및 설치 : JDK17, IDE(IntelliJ)

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

## Technology Stack
<img width="688" alt="image" src="https://github.com/AddineduFourTeam/Project/assets/83636742/0db8ea16-d370-4437-aabd-4f3e567838f8">

## Architecture
<details>
<summary>Project Structure</summary>
<div markdown="1">

```

src/
│
├── main/
│   └── java/
│       └── com/
│           └── farm/
│               ├── config/
│               │   └── MemberPasswordEncoder.java
│               ├── controller/
│               │   ├── AddrController.java
│               │   ├── BoardController.java
│               │   ├── FarmController.java
│               │   ├── HomeController.java
│               │   ├── MemberController.java
│               │   ├── MyPageController.java
│               │   ├── OpenApiController.java
│               │   └── StoryController.java
│               ├── domain/
│               │   ├── Board.java
│               │   ├── Farm.java
│               │   ├── Member.java
│               │   ├── Reservation.java
│               │   ├── Review.java
│               │   ├── Story.java
│               │   └── StoryReply.java
│               ├── dto/
│               │   ├── MemberReviewDto.java
│               │   ├── MemInfoDto.java
│               │   └── ReservationFarmDto.java
│               ├── filter/
│               │   ├── CustomInterceptor.java
│               │   └── WebConfig.java
│               ├── other/
│               │   ├── CDataExtractor.java
│               │   └── TestMain.java
│               ├── repository/
│               │   ├── BoardRepository.java
│               │   ├── FarmRepository.java
│               │   ├── MemberRepository.java
│               │   ├── ReservationRepository.java
│               │   ├── ReviewRepository.java
│               │   ├── StoryReplyRepository.java
│               │   └── StoryRepository.java
│               ├── service/
│               │   ├── BoardService.java
│               │   ├── CommonService.java
│               │   ├── KakaoApiExplorer.java
│               │   ├── ListService.java
│               │   ├── MemberService.java
│               │   ├── OpenApiExplorer.java
│               │   ├── OpenApiService.java
│               │   ├── ReservationService.java
│               │   ├── StoryService.java
│               │   ├── ServletInitializer.java
│               │   └── WeekendFarmApplication.java
│
├── resources/
│   ├── static/
│   │   ├── css/
│   │   │   ├── animate.css
│   │   │   ├── font.css
│   │   │   ├── reset.css
│   │   │   └── style.css
│   │   ├── files/
│   │   ├── fonts/
│   │   ├── img/
│   │   └── js/
│   │       ├── aos.min.js
│   │       ├── script.js
│   │       └── wow.min.js
│   ├── application.properties
│   └── webapp/
│       ├── WEB-INF/
│       │   ├── include/
│       │   └── views/
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

## License
MIT License Copyright (c) 2024 eun-su-jeong
