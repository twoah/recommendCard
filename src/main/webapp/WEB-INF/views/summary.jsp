<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
	integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script>
<link rel="stylesheet" href="resources/css/mypage_summary.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-
   awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#perform").load("perform");
});
google.charts.load('current', {
	'packages' : [ 'corechart' ]
});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
	var data = google.visualization.arrayToDataTable([
			[ '카테고리', '결제 비율' ],
			<c:forEach items="${performList}" var="perform">
			['${perform.category_name}', ${perform.category_sum}],
			</c:forEach> 
	]);
	console.log(data);
	// Optional; add a title and set the width and height of the chart
	var options = {
		'pieSliceText' : 'label',
		'legend' : {
			position : 'bottom',
			alignment : 'start'
		},
		'width' : 300,
		'height' : 400,
		'colors' : [ '#67b7dc', '#6794dc', '#6771dc', '#8067dc', '#a367dc',
				'#c767dc', '#f667dc' ],
		'chartArea' : {
			width : 300,
			height : 400
		}
	};

	// Display the chart inside the <div> element with id="piechart"
	var chart = new google.visualization.PieChart(document
			.getElementById('piechart'));
	chart.draw(data, options);
}

function goCardDetail(id) {
	console.log(id);
	location.href = "carddetail?card_id=" + id + "&reviewOn=0";
}

function searchDetail(card_name, month){
	console.log(card_name);
	console.log(month);
	var selectData={
            "card_name":card_name,
            "select_month":month,
            "select_year" :2021,
        }
        var formData = $("#select_form").serialize();
        console.log(selectData);
        loadQuery();
        $.ajax({
			url:'/bccard/perform_month',
            //url:'/app/perform_month',
            type:'POST',
            data:selectData,
            datatype:JSON,
            timeout:1000,
            success:function(result){
            	console.log(result);
                $("#user_perform_div").html(result);
                $("#summary").removeClass('active in');
                $(".summaryTab").attr('class','summaryTab');
                $(".summaryhref").attr('aria-expanded', 'false');
                $("#perform").addClass('active in');
                $(".performTab").addClass('active');
                $("#select_card").val(card_name).attr("selected","selected");
				$(window).scrollTop(0);
            },
            complete:function(result){
                console.log(selectData);
            }
        })
}
	
</script>

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
	<div>
		<div id="month">
			<div class="nsb-font user_perform">
				<span>카드결제금액</span>
			</div>
			<div class="perform">
				<div class="perform_word">
					<div class="ns-font perform_word_month">
						<span>2021년 ${month}월</span>
					</div>
					<div class="ns-font perform_word_total">
						<span>총 결제금액 </span><span id="ns-font total">${totalSum}</span><span>원</span> <!-- 제대로 되는지 체크 가현 -->
					</div>
				</div>
				<div class="perform_table">
					<table class="table">
						<thead>
							<tr>
								<th class="ns-font text-center" scope="col">순서</th>
								<th class="ns-font text-center" scope="col">카드 명</th>
								<th class="ns-font text-center" scope="col">월 결제 금액</th>
								<th class="ns-font text-center" scope="col">최종 결제일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userCardList}" var="userCard"
								varStatus="status">
								<tr>
									<th class="ns-font text-center" scope="row">${status.count}</th>
									<td class="ns-font text-center">${userCard.card_name}</td>
									<td class="ns-font text-center">${userCard.prev_sum}</td>
									<td class="ns-font text-center">${userCard.paytime}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="nsb-font user_perform">
				<span>카드이용분석</span>
				<div class="perform">
					<div class="perform_word">
						<div class="ns-font perform_chart_month">
							<span id="ns-font total">${month}</span><span>월 이용실적</span>
						</div>
					</div>
					<div class="user_chart">
						<div id="piechart"></div>
						<div id="rankchart">
							<table class="table">
								<thead>
									<tr>
										<th class="ns-font text-center" scope="col">순위</th>
										<th class="ns-font text-center" scope="col">이용 업종</th>
										<th class="ns-font text-center" scope="col">총 결제 금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${performList}" var="perform"
										varStatus="status">
										<tr>
											<th class="ns-font text-center" scope="row">${status.count}</th>
											<td class="ns-font">${perform.category_name}</td>
											<td class="ns-font">${perform.category_sum}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="ns-font having_content">
					<div class="nsb-font user_card_word">
						<span class=nsb-font>보유카드</span>
					</div>
					<div class="user_card">
						<div id="carouselExampleControls"
							class="carousel slide carousel-fade" data-interval="false">
							<div class="carousel-inner">
								<c:forEach var="userCard" items="${userCardList}"
									varStatus="status">
									<c:choose>
										<c:when test="${status.index eq 0}">
											<div class="carousel-item active">
												<div class="card_content">
													<button class=navbutton
														data-toggle="tab" class="card_content" 
														onclick="searchDetail('${userCard.card_name}', ${month})" >상세조회</button>
												</div>
												<div class="card_list">
													<img class="d-block"
														src="resources/image/${userCard.card_url}"
														alt="First slide">
												</div>
												<div class="card_detail">
													<table class="table">
														<tbody>
															<tr>
																<th class="nsb-font text-center" scope="row">카드명</th>
																<td class="ns-font">${userCard.card_name}</td>
															</tr>
															<tr>
																<th class="nsb-font text-center" scope="row">카드번호</th>
																<td class="ns-font">${userCard.card_num}</td>
															</tr>
														</tbody>
													</table>
													<div class="card_button">
														<button type="button" class="ns-font btn btn-outline-secondary"
															onclick='goCardDetail("${userCard.card_id}")'>카드
															혜택 보기</button>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="carousel-item">
												<div class="card_content">
													<button class=navbutton
														data-toggle="tab" class="card_content" 
														onclick="searchDetail('${userCard.card_name}', ${month})" >상세조회</button>
												</div>
												<div class="card_list">
													<img class="d-block"
														src="resources/image/${userCard.card_url}"
														alt="First slide">
												</div>
												<div class="card_detail">
													<table class="table">
														<tbody>
															<tr>
																<th class="ns-font text-center" scope="row">카드명</th>
																<td>${userCard.card_name}</td>
															</tr>
															<tr>
																<th class="ns-font text-center" scope="row">카드번호</th>
																<td>${userCard.card_num}</td>
															</tr>
														</tbody>
													</table>
													<div class="card_button">
														<button type="button" class="ns-font btn btn-outline-secondary"
															onclick="goCardDetail('${userCard.card_id}')">카드
															혜택 보기</button>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleControls"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleControls"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="ns-font sr-only">Next</span>
							</a>
						</div>
					</div>
					<br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

