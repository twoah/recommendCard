<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/head.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Main Page</title>
<script type="text/javascript" src="resources/js/main.js"></script>
<!-- 마이페이지 소환 -->
<style>
/*나눔스퀘어 웹 폰트 지정*/
@import
	url(//cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);

.ns-font {
	font-family: 'NanumSquare', serif;
}

.nsb-font {
	font-family: 'NanumSquare', serif;
	font-weight: bold;
}


</style>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
<c:if test="${user !=null }">	
<div class="navcontainer">
<nav class="navbar navbar-expand-lg navbar-mainbg">
        <a class="navbar-brand navbar-logo" href="main"><img
				src="resources/image/BCcard_logo.png" width="110" height="30" alt=""></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                
                <li class="nav-item active">
                    <a class="ns-font nav-link" href="main"><i class="fas fa-tachometer-alt"></i>홈</a>
                </li>
                                <li class="nav-item">
                    <a class="ns-font nav-link" href="cardlist"><i class="far fa-clone"></i>카드상품</a>
                </li>
                <li class="nav-item">
                    <a class="ns-font nav-link" href="mypage"><i class="far fa-chart-bar"></i>마이BC</a>
                </li>
                <li class="nav-item ">
                
                    <!-- <a class="nav-link" href="logout"><button class="btn btn-outline-danger btn-sm" >로그아웃</button></a> -->
                    <a class="ns-font nav-link" href="logout"><p class="text-primary"><U>로그아웃</U></p></a>
                </li>
                
            </ul>
        </div>
    </nav>
</div>

	<div class="row mt-2" style="background:#FDF5E6;">
		<div class="col align-self-center">
			<div id="carouselExampleCaptions" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="3" aria-label="Slide 4"></button>
					<button type="button" data-bs-target="#carouselExampleCaptions"
						data-bs-slide-to="4" aria-label="Slide 5"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="resources/image/bestcard_1.png" class="d-block w-100"
							alt="...">
						
					</div>
					<div class="carousel-item">
						<img src="resources/image/bestcard_2.png" class="d-block w-100"
							alt="...">
						
					</div>
					<div class="carousel-item">
						<img src="resources/image/bestcard_3.png" class="d-block w-100"
							alt="...">
						
					</div>
					<div class="carousel-item">
						<img src="resources/image/bestcard_4.png" class="d-block w-100"
							alt="...">

					</div>
		
						<div class="carousel-item">
							<img src="resources/image/bestcard_5.png" class="d-block w-100"
								alt="...">

						</div>
					</div>
               <button class="carousel-control-prev" type="button"
                  data-bs-target="#carouselExampleCaptions" data-bs-slide="prev" >
				  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                 
                  <span class="visually-hidden">Previous</span>
               </button>
               <button class="carousel-control-next" type="button"
                  data-bs-target="#carouselExampleCaptions" data-bs-slide="next" >
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
               </button>

					
				</div>
			</div>
		</div>

	<div class="ns-font container" style="margin-top:60px">
		<h2><span style="font-weight:bold;color:#FF6347">${user.name}</span>님! 이 카드 어떠세요?</h2>
<div class="btn-toolbar justify-content-end mb-3" role="toolbar" >
    <button type="button" id = 'btnBenefit' class="btn btn-outline-danger mr-1">혜택추천</button>
    <button type="button" id = 'btnPerform' class="btn btn-outline-danger ml-1 mr-3">실적추천</button>
</div>
		<div class="row" id="main-card" style="margin:0 auto;">
			<div class="col-4" style="margin: 0 auto;">
					<div class="flip-box">
						<div class="flip">
							<div class="front">
								<div class="card">
									<img
										src="resources/image/${benefit_recommend_card_id.get(0)}_card.png"
										class="card-img-top" alt="...">
									<div class="ns-font card-body">
										<p class="card-text">${benefit_recommend_card_note.get(0)}</p>
									</div>
								</div>

							</div>
							<div class="back">
								<div class="card">
									<div class="card-body">
										<img
											src="resources/image/${benefit_recommend_card_id.get(0)}_hover.png"
											class="card-img-top" alt="..."><br>
									</div>
										<a href="carddetail?card_id=${benefit_recommend_card_id.get(0)}&reviewOn=0" class="btn btn-light">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4" style="margin: 0 auto;">
					<div class="flip-box">
						<div class="flip">
							<div class="front">
								<div class="card">
									<img
										src="resources/image/${benefit_recommend_card_id.get(1)}_card.png"
										class="card-img-top" alt="...">
									<div class="ns-font card-body">
										<p class="card-text">${benefit_recommend_card_note.get(1) }</p>
									</div>
								</div>

							</div>
							<div class="back">
								<div class="card">
									<div class="card-body">
										<img
											src="resources/image/${benefit_recommend_card_id.get(1)}_hover.png"
											class="card-img-top" alt="..."><br>
									</div>
										<a href="carddetail?card_id=${benefit_recommend_card_id.get(1)}&reviewOn=0" class="btn btn-light">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4" style="margin: 0 auto;">

					<div class="flip-box">
						<div class="flip">
							<div class="front">
								<div class="card">
									<img
										src="resources/image/${benefit_recommend_card_id.get(2)}_card.png"
										class="card-img-top" alt="...">
									<div class="ns-font card-body">
										<p class="card-text">${benefit_recommend_card_note.get(2) }</p>
									</div>
								</div>

							</div>
							<div class="back">
								<div class="card">
									<div class="card-body">
										<img
											src="resources/image/${benefit_recommend_card_id.get(2)}_hover.png"
											class="card-img-top" alt="..."><br>
									</div>
										<a href="carddetail?card_id=${benefit_recommend_card_id.get(2)}&reviewOn=0" class="btn btn-light">상세보기</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="row" id="benefit-card" style="margin: 0 auto;">
				<div class="col-4" style="margin: 0 auto;">

					<div class="flip-box">
						<div class="flip">
							<div class="front">
								<div class="card">
									<img
										src="resources/image/${benefit_recommend_card_id.get(0)}_card.png"
										class="card-img-top" alt="...">
									<div class="ns-font card-body">
										<p class="card-text"">${benefit_recommend_card_note.get(0) }</p>
									</div>
								</div>

							</div>
							<div class="back">
								<div class="card">
									<div class="card-body">
										<img
											src="resources/image/${benefit_recommend_card_id.get(0)}_hover.png"
											class="card-img-top" alt="..."><br>
									</div>
										<a href="carddetail?card_id=${benefit_recommend_card_id.get(0)}&reviewOn=0" class="btn btn-light">상세보기</a>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-4" style="margin: 0 auto;">
					<div class="flip-box">
						<div class="flip">
							<div class="front">
								<div class="card">
									<img
										src="resources/image/${benefit_recommend_card_id.get(1)}_card.png"
										class="card-img-top" alt="...">
									<div class="ns-font card-body">
										<p class="card-text">${benefit_recommend_card_note.get(1) }</p>
									</div>
								</div>

							</div>
							<div class="back">
								<div class="card">
									<div class="card-body">
										<img
											src="resources/image/${benefit_recommend_card_id.get(1)}_hover.png"
											class="card-img-top" alt="..."><br>
									</div>
										<a href="carddetail?card_id=${benefit_recommend_card_id.get(1)}&reviewOn=0" class="btn btn-light">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4" style="margin: 0 auto;">

					<div class="flip-box">
						<div class="flip">
							<div class="front">
								<div class="card">
									<img
										src="resources/image/${benefit_recommend_card_id.get(2)}_card.png"
										class="card-img-top" alt="...">
									<div class="ns-font card-body">
										<p class="card-text">${benefit_recommend_card_note.get(2) }</p>
									</div>
								</div>

							</div>
							<div class="back">
								<div class="card">
									<div class="card-body">
										<img
											src="resources/image/${benefit_recommend_card_id.get(2)}_hover.png"
											class="card-img-top" alt="..."><br>
									</div>
										<a href="carddetail?card_id=${benefit_recommend_card_id.get(2)}&reviewOn=0" class="btn btn-light">상세보기</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="row" id="perform-card" style="margin: 0 auto;">
				<div class="col-4" style="margin: 0 auto;">

					<div class="flip-box">
						<div class="flip">
							<div class="front">
								<div class="card">
									<img
										src="resources/image/${perform_recommend_card_id.get(0)}_card.png"
										class="card-img-top" alt="...">
									<div class="ns-font card-body">
										<p class="card-text"">${perform_recommend_card_note.get(0) }</p>
									</div>
								</div>

							</div>
							<div class="back">
								<div class="card">
									<div class="card-body">
										<img
											src="resources/image/${perform_recommend_card_id.get(0)}_hover.png"
											class="card-img-top" alt="..."><br>
									</div>
										<a href="carddetail?card_id=${perform_recommend_card_id.get(0)}&reviewOn=0" class="btn btn-light">상세보기</a>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-4" style="margin: 0 auto;">
					<div class="flip-box">
						<div class="flip">
							<div class="front">
								<div class="card">
									<img
										src="resources/image/${perform_recommend_card_id.get(1)}_card.png"
										class="card-img-top" alt="...">
									<div class="ns-font card-body">
										<p class="card-text">${perform_recommend_card_note.get(1) }</p>
									</div>
								</div>

							</div>
							<div class="back">
								<div class="card">
									<div class="card-body">
										<img
											src="resources/image/${perform_recommend_card_id.get(1)}_hover.png"
											class="card-img-top" alt="..."><br>
									</div>
										<a href="carddetail?card_id=${perform_recommend_card_id.get(1)}&reviewOn=0" class="btn btn-light">상세보기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4" style="margin: 0 auto;">

					<div class="flip-box">
						<div class="flip">
							<div class="front">
								<div class="card">
									<img
										src="resources/image/${perform_recommend_card_id.get(2)}_card.png"
										class="card-img-top" alt="...">
									<div class="ns-font card-body">
										<p class="card-text">${perform_recommend_card_note.get(2) }</p>
									</div>
								</div>

							</div>
							<div class="back">

								<div class="card">
									<div class="card-body">
										<img
											src="resources/image/${perform_recommend_card_id.get(2)}_hover.png"
											class="card-img-top" alt="..."><br>
									</div>
										<a href="carddetail?card_id=${perform_recommend_card_id.get(2)}&reviewOn=0" class="btn btn-light">상세보기</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

      <hr style="border: solid 1px gray; margin-top: 500px;">
      
      <div class="ns-font container" style="margin-top: 60px">
         <h2 style="margin-bottom:1em">
            <span style="font-weight: bold; color: #5180ed;">절세 혜택</span>을 위한 팁!
         </h2>
         <div class="video-container" style="display: inline-block; margin-left:3%; margin-right:3%;"> 
            <iframe src="https://www.youtube.com/embed/YXa4b-HeBEA" frameborder="0" width="300" height="250"></iframe> 
         </div>
         
         <div class="video-container" style="display: inline-block; margin-left:3%; margin-right:3%;"> 
            <iframe src="https://www.youtube.com/embed/Lcm0v9A74ZM" frameborder="0" width="300" height="250"></iframe> 
         </div>
      
         <div class="video-container" style="display: inline-block; margin-left:3%; margin-right:3%;"> 
            <iframe src="https://www.youtube.com/embed/drRKpylSj8c" frameborder="0" width="300" height="250"></iframe> 
         </div>
      </div>
	
	<hr style="border: solid 1px gray; margin-top: 80px;">

	  <footer class="text-center text-lg-start">
	  <!-- Copyright -->
		<div class="text-center p-3 ;">
			<img src="resources/image/footer.png" class="d-block w-100"
		                     alt="...">
		</div>
	  <!-- Copyright -->
	</footer>
	
	</c:if>
	<c:if test="${user==null }">

	<!-- 우선수위가  JSP태그 후 HTML 태그를 먹는다.... -->
	
	<script type="text/javascript">
		console.log('접속 실패');
		alert('로그인 후 사용가능합니다.');
		location.href= "login";
	</script>
	</c:if>

</body>
</html>