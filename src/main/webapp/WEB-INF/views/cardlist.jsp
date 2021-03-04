<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/head.jsp" %>
<!DOCTYPE html>

<html>
<head>

<title>Card List</title>
<link rel="stylesheet" href="resources/css/main.css">

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


<script type="text/javascript" src="resources/js/cardlist.js">
</script>


	<style>
.even-large-badge {
    font-size : 1em;
}

</style>
</head>

<body>
<c:if test="${user!=null}">
<div class="navcontainer">
<nav class="navbar navbar-expand-lg navbar-mainbg">
        <a class="navbar-brand navbar-logo" href="main"><img
				src="resources/image/BCcard_logo.png" width="110" height="30" alt=""></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-bars text-white"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
               
                <li class="nav-item">
                    <a class="ns-font nav-link" href="main"><i class="fas fa-tachometer-alt"></i>홈</a>
                </li>
                                <li class="nav-item active">
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

   <div class="mt-4 ns-font container">
      <p style="text-align: left; margin-left:5em">* 카테고리는 최대 3개까지 선택가능합니다.</p>
      <div class="mt-3 row no-gutters mb-3">
         <div class="col-3">
            <input type="checkbox" class="btn-check" name="benefit" id="life"
               onclick=test_checkbox() value="생활"> <label
               class="btn btn-outline-secondary" for="life">생활</label>
         </div>

         <div class="col-3">
            <input type="checkbox" class="btn-check" name="benefit" id="culture"
               onclick=test_checkbox() value="문화"> <label
               class="btn btn-outline-secondary" for="culture">문화</label>
         </div>
         <div class="col-3">
            <input type="checkbox" class="btn-check" name="benefit"
               id="education" onclick=test_checkbox() value="교육"> <label
               class="btn btn-outline-secondary" for="education">교육</label>
         </div>
         <div class="col-3">
            <input type="checkbox" class="btn-check" name="benefit"
               id="shopping" onclick=test_checkbox() value="쇼핑"> <label
               class="btn btn-outline-secondary" for="shopping">쇼핑</label>
         </div>
      </div>


      <div class="row mb-3">
         <div class="col-3">
            <input type="checkbox" class="btn-check" name="benefit" id="dinner"
               onclick=test_checkbox() value="외식"> <label
               class="btn btn-outline-secondary" for="dinner">외식</label>
         </div>

         <div class="col-3">
            <input type="checkbox" class="btn-check" name="benefit" id="car"
               onclick=test_checkbox() value="자동차"> <label
               class="btn btn-outline-secondary" for="car">자동차</label>
         </div>
         <div class="col-3">
            <input type="checkbox" class="btn-check" name="benefit" id="telecom"
               onclick=test_checkbox() value="통신"> <label
               class="btn btn-outline-secondary" for="telecom">통신</label>
         </div>
         <div class="col-3">
            <input type="checkbox" class="btn-check" name="benefit" id="traffic"
               onclick=test_checkbox() value="교통"> <label
               class="btn btn-outline-secondary" for="traffic">교통</label>
         </div>

      </div>
      <div class="mt-4 cardlist"></div>

   </div>
   
      <hr style="border: solid 1px gray margin-bottom: 0px;;">
	  <footer class="text-center text-lg-start">
	  <!-- Copyright -->
		<div class="text-center p-1  padding-top: 0px  padding-bottom: 0px;">
			<img src="resources/image/footer.png" class="d-block w-100"
		                     alt="...">
		</div>
	  <!-- Copyright -->
	</footer>  

   </c:if>
   <c:if test="${user==null }">
      <!-- 우선수위가  JSP태그 후 HTML 태그를 먹는다.... -->

      <script type="text/javascript">
         console.log('?????');
         alert('로그인 후 사용 가능합니다.');
         location.href = "login";
      </script>

   </c:if>

</body>
</html>