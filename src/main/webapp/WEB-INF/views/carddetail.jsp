<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Card Detail Page</title>
<link href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="resources/css/detail.css">
<script type="text/javascript" src="resources/js/carddetail.js"></script>

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

</head>
<script>
window.onload = function(){
	card_detail_review_ajax(${cardDetail.card_id});
	
	if(${reviewOn.get(0)} == false){
		
		$('#nav-home-tab').attr('class', 'ns-font nav-link active btn btn-light');
		$('#nav-profile-tab').attr('class', 'ns-font nav-link btn btn-light');
		
		$('#nav-home-tab').attr('aria-selected','true');
		$('#nav-profile-tab').attr('aria-selected','false');
		
		$('#nav-home').attr('class','tab-pane fade show active');
		$('#nav-profile').attr('class','tab-pane fade');
	}
	else{
		$('#nav-home-tab').attr('class', 'ns-font nav-link btn btn-light');
		$('#nav-profile-tab').attr('class', 'ns-font nav-link active btn btn-light');
		
		$('#nav-home-tab').attr('aria-selected','false');
		$('#nav-profile-tab').attr('aria-selected','true');
		
		$('#nav-home').attr('class','tab-pane fade');
		$('#nav-profile').attr('class','tab-pane fade show active');
	}
	user_card_ajax('${user.user_id}',${cardDetail.card_id});
	set_current_userID('${user.user_id}');
}



$(document).ready(function() {
    $('#comment').on('keyup', function() {
        $('#review_text_cnt').html("("+$(this).val().length+" / 100)");
 
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('#review_text_cnt').html("(100 / 100)");
        }
    });
});



function reviewCheck(){
	if($('#comment').val().length == 0){
		alert("내용을 입력하세요.");
		return false;
	}
	else {
		return true;
	}
}

</script>



<body>
	<c:if test="${user !=null }">
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
                
                    <!-- <a class="ns-font nav-link" href="logout"><button class="btn btn-outline-primary btn-sm" >로그아웃</button></a> -->
                    <a class="ns-font nav-link" href="logout"><p class="text-primary"><U>로그아웃</U></p></a>
                </li>
                
            </ul>
        </div>
    </nav>
</div>
		<div class="container">

			<div class="row">
				<div class="col">
					<img src="resources/image/${cardDetail.card_id}_detail.png" alt=""
						class="card-img" />
				</div>

			</div>

			<div class="row" id="carddiv">
				<input type="button" class="nsb-font btn btn-outline-danger mt-2 mb-4" id="create_card" value="카드 신청" 
				onclick="create_card(this.value,'${user.user_id}',${cardDetail.card_id})" style="float:none; margin:0 auto; width: 226px;">
			</div>



			<nav class="nav-pills mt-3" id="btn-tabContent">
				<div class="nav nav-tabs nav-justified" id="nav-tab" role="tablist">
					<button class="nav-link active" id="nav-home-tab"
						data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
						role="tab" aria-controls="nav-home" aria-selected="true">Benefit</button>
					<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
						data-bs-target="#nav-profile" type="button" role="tab"
						aria-controls="nav-profile" aria-selected="false">Review</button>
				</div>
			</nav>

			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">
					<div class="row mt-3">
						<div class="col">
							<img src="resources/image/${cardDetail.card_id}_benefit.png"
								alt="" class="mt-3 card-img" />
						</div>
					</div>
				</div>
				<div class="tab-pane fade " id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">
					<form class="form-horizontal" action="reviewWrite" method="post"
						onsubmit='return reviewCheck();'>
						<div class="nsb-font form-group mt-3">
							<h4 id="write_review_title">Write Review</h4>
							<div class="input-group mb-3">
								<textarea name="body" id="comment" msg cols="30" rows="5"
									class="form-control"></textarea>
								<input type="hidden" name="user_id" class="ns-font form-control"
									value="${user.user_id}"> <input type="hidden"
									name="card_id" class="ns-font form-control"
									value="${cardDetail.card_id}">
							</div>
							<div>
								<div id="review_text_cnt">(0 / 100)</div>
								<button id="add_review" type="submit" class="ns-font btn btn-success">등록</button>
							</div>
						</div>
					</form>



					<form class="ns-font mt-3" id="allReview">
						<h4>All Reviews</h4>
					</form>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog"></div>





		</div>

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
      console.log('접속 실패');
      alert('로그인 후 사용 가능합니다.');
      location.href= "login";
   </script>


	</c:if>

</body>
</html>