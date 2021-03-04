# **BC카드 추천 시스템 - Group 6**

사용자에게 필요한 **맞춤 카드**를 추천해드립니다!
실적 기반 혹은 관심 혜택을 기반으로 본인에게 맞는 카드를 추천 받을 수 있습니다.


## **Directory**


src : **Project source file directory**
> main : **main source file directory**
> > java/com : **java files directory**
> > > config : **Mapper files directory**
> > > > CardMapper.xml / 
> > > > PerformMapper.xml / 
> > > > ReviewMapper.xml / 
> > > > UserCardMapper.xml / 
> > > > UserMapper.xml
> > >
> > > example : **MVC source directory**
> > > > controller : **Controller directory**
> > > > > CardController.java / 
> > > > > CardRecommendController.java / 
> > > > > HttpSessionUtils.java / 
> > > > > MypageController.java / 
> > > > > PerformController.java / 
> > > > > ReviewController.java / 
> > > > > UserCardController.java / 
> > > > > UserController.java
> > > >
> > > > dao : **DAO directory**
> > > > > CardDao.java / 
> > > > > CardDaoImpl.java / 
> > > > > PerformDao.java / 
> > > > > PerformDaoImpl.java / 
> > > > > ReviewDao.java / 
> > > > > ReviewDaoImpl.java / 
> > > > > UserCardDao.java / 
> > > > > UserCardDaoImpl.java / 
> > > > > UserDao.java / 
> > > > > UserDaoImpl.java / 
> > > >
> > > > dto : **VO directory**
> > > > > CardVO.java / 
> > > > > PerformSelectVO.java / 
> > > > > PerformVO.java / 
> > > > > ReviewVO.java / 
> > > > > UserCardVO.java / 
> > > > > UserVO.java / 
> > > >
> > > > service : **Service directory**
> > > > > CardService.java / 
> > > > > CardServiceImpl.java / 
> > > > > PerformService.java / 
> > > > > PerformServiceImpl.java / 
> > > > > ReviewService.java / 
> > > > > ReviewServiceImpl.java / 
> > > > > UserCardService.java / 
> > > > > UserCardServiceImpl.java / 
> > > > > UserService.java / 
> > > > > UserServiceImpl.java / 
> > > > > UserSha256.java / 
> > > >
> > > > BcCardProject1Application.java 
> > 
> > resources : **resource directory**
> > > static : **css, image js directory**
> > > > css : **css directory**
> > > > > detail.css / 
> > > > > main.css / 
> > > > > mypage.css / 
> > > > > mypage_perform.css / 
> > > > > mypage_personal.css / 
> > > > > mypage_summary.css / 
> > > > > signup.css / 
> > > > > style.css / 
> > > >
> > > > image : **image directory**
> > > > js : **js directory**
> > > > > carddetail.js / 
> > > > > cardlist.js / 
> > > > > main.js / 
> > > > > perform.js / 
> > > > > script.js / 
> > > > > signup.js / 
> > > application.properties
> >
> > webapp/WEB-INF/views : **view directory**
> > > carddetail.jsp / 
> > > cardlist.jsp / 
> > > footer.jsp / 
> > > head.jsp / 
> > > login.jsp / 
> > > main.jsp / 
> > > mypage.jsp / 
> > > navbar.jsp / 
> > > perform.jsp / 
> > > perform_month.jsp / 
> > > personal.jsp / 
> > > review_list.jsp / 
> > > signup.jsp / 
> > > summary.jsp / 
> > > user_list.jsp / 
> > > user_writeForm.jsp / 
> > > usercard_detail.jsp / 
> > > usercard_list.jsp / 
> 
traget : **maven build result directory**

> mvn, mvnw.cmd : **maven wrapper**

> pom.xml : **project pom.xml**

## **Development Environment**
- IDE : **STS 3.9.12** / **SpringFramework Boot 2.4.3**
- MVC View : **jsp**
- Servlet Container : **Apache Tomcat 8.5.57**
- DB connection : **MYBATIS**
- DB application : **MYSQL**
- Build : **Apache MAVEN 3.3.9**


## **Gitlab Repository**
- https://devpro.ktds.co.kr:9999/2021/group6/

## **Jenkins**
- http://14.63.223.122:9100/jenkins/view/2021_groups/job/group6/

## **Deploy Server(WAS)**
- Linux version 3.10.0-957.el7.x86_64 (mockbuild@kbuilder.bsys.centos.org) 

(gcc version 4.8.5 20150623 (Red Hat 4.8.5-36) (GCC) ) 
- (ssh) root@14.63.222.111 -p 22

## **Site Map**
- Login(로그인)

http://14.63.222.111:8086/bccard/login
-  SignUp(회원가입) **!로그인 필요**

http://14.63.222.111:8086/bccard/signup
- Main(홈) **!로그인 필요**

http://14.63.222.111:8086/bccard/main
- CardList(카드상품) **!로그인 필요**

http://14.63.222.111:8086/bccard/cardlist
- Mypage(마이BC) **!로그인 필요**

http://14.63.222.111:8086/bccard/mypage

## **Function**

### **Login**
1. ID와 Password를 통한 로그인
2. 회원이 아닐 경우 회원가입 페이지로 이동

### **SignUp**
1. 사용자의 이름, ID(중복검사), Password, Email, 성별, 연락처, 계좌번호, 은행 그리고 관심혜택(1,2,3순위 선택 가능)을 기입하여 회원가입

### **Main**
1. BEST 카드 TOP3를 슬라이드로 표현
2. 회원의 **혜택 기반** 카드 추천 TOP3 
3. 회원의 과거 **실적 기반** 카드 추천 TOP3
4. 실적이 존재하지 않는 신규회원의 경우 관심혜택(회원가입시 작성)을 기반으로 카드 추천
5. 절세 혜택을 위한 유튜브 영상 연동

### **CardList**
1. 카드 전체 리스트를 확인 
2. 카테고리별 혜택을 받을 수 있는 카드 필터링(최대 3개)

#### **Card Detail**
1. 카드 정보(카드 이미지, 혜택, 연회비, 브랜드 등)  표기
2. 카드 신청 및 해지
2-1. 보유한 카드의 경우 해지 신청 버튼 활성화
2-2. 보유하지 않은 카드의 경우 신청 후 카드 생성

#### **Card Review**
1. 카드를 보유한 사용자의 경우 리뷰 작성 가능(최대 100자)
2. 본인이 작성한 리뷰 삭제 가능
3. 리뷰별 좋아요, 싫어요를 통한 의견 공유

### **Mypage**

#### **Summary(요약)**
1. 회원의 전월 카드별 결제 금액 확인
2. 전월 실적 기반 카드 이용 분석
3. 보유 카드 확인 

#### **Perform**
1. 카드별/년월별 실적 조회
2. 전체를 선택했을 경우 모든 카드의 월별 실적을 조회

#### **Personal**
1. 이름, Email, 연락처 조회
2. 개인정보 수정 : Email, 연락처 수정 가능