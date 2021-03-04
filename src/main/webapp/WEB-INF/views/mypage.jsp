<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#summary").load("summary"); 
	});
</script>
<script>
	$(document).ready(function() {
		$("#perform").load("perform");
	});
</script>
<script>
	$(document).ready(function() {
		$("#personal").load("personal");
	});
</script>
<script>
	
</script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="resources/js/summary.js"></script>
<link rel="stylesheet" href="resources/css/mypage.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<style>
	/*나눔스퀘어 웹 폰트 지정*/
	@import url(//cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
	
	.ns-font{
		font-family:'NanumSquare', serif;
	}
	
	.nsb-font{
		font-family:'NanumSquare', serif;
		font-weight: bold;
	}
	</style>
</head>


<body>
	<c:if test="${user!=null }">
<div class="navcontainer">
<nav class="navbar navbar-expand-lg" style="padding:0;">
        <a class="navbar-brand" href="main" style="padding-top:10px;"><img
				src="resources/image/BCcard_logo.png" width="110" height="30" alt=""></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-bars text-white"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav navbar-right">
                
                <li class="nav-item ">
                    <a class="ns-font nav-link" href="main"><i class="fas fa-tachometer-alt"></i>홈</a>
                </li>
                                <li class="nav-item">
                    <a class="ns-font nav-link" href="cardlist"><i class="far fa-clone"></i>카드상품</a>
                </li>
                <li class="nav-item active">
                    <a class="ns-font nav-link" href="mypage"><i class="far fa-chart-bar"></i>마이BC</a>
                </li>
               <li class="nav-item " style="height:20px;">
                
                    <a class="ns-font nav-link" href="logout"><p class="text-primary"><U>로그아웃</U></p></a>
                </li>
                
            </ul>
        </div>
    </nav>
</div>

		<div class="container">

			<div class="wrapper">
				<!-- Sidebar -->
				<nav id="sidebar">
					<div class="sidebar-header">
						<h3><span class="nsb-font username;" style="color:#FF6347;">${user.name}</span>님의<br>정보입니다</h3>
					</div>
					<ul class="nsb-font list-unstyled componenets">
						<li class="summaryTab active">
						<a class="nsb-font navbutton summaryhref" data-toggle="tab"
							href="#summary" aria-expanded="true">요약</a></li>
						<li class="performTab"><a class="nsb-font navbutton" data-toggle="tab" href="#perform">카드상세</a></li>
						<li class=""><a class="nsb-font navbutton" data-toggle="tab" href="#personal">개인정보</a></li>
					</ul>
				</nav>

				<!-- Page Content -->
				<div class="tab-content">
					<div class="tab-pane fade active in" id="summary"></div>
					<div class="tab-pane" id="perform"></div>
					<div class="tab-pane" id="personal"></div>
				</div>
			</div>
		</div>
		
	 <hr style="border: solid 1px gray;">
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
			console.log('접속실패');
			alert('로그인 후 사용가능합니다.');
			location.href = "login";
		</script>

	</c:if>

</body>