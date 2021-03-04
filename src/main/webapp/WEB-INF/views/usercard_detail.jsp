<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usercard</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
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
	<div class="container">
		<h2>목록보기</h2>
		<table class="ns-font table table-striped">
			<thead>
				<tr>
					<th>카드ID</th>
					<th>카드번호</th>
					<th>카드이름</th>
					<th>userID</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td>${usercard.card_id}</td>
					<td>${usercard.card_num}</td>
					<td>${usercard.card_name}</td>
					<td>${usercard.user_id}</td>
				</tr>
			</tbody>
		</table>
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

</body>
</html>




