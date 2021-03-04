<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	Review
	<div class="container">
		<form method="post" action="review_write">
		<h2>Review</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>제목</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${reviewlist}">
					<tr>
						<td>${review.title}</td>
						<td>${review.body}</td>
						<td><a href="statusGoodcnt?review_id=${review.review_id}">좋아요(${review.status_good })</a></td>
						<td><a href="statusBadcnt?review_id=${review.review_id}">싫어요(${review.status_bad })</a></td>
						<td><a href="review_delete?review_id=${review.review_id}">삭제</a></td>
					</tr>
				</c:forEach>

				<tr>
					<td><textarea rows="1" cols="15" name="title"></textarea></td>
					<td><textarea rows="3" cols="40" name="body"></textarea></td>
					<td><input type="submit" value="Review 쓰기"></td>
				</tr>
			</tbody>
	

		</table>
		</form>
	</div>

</body>
</html>




