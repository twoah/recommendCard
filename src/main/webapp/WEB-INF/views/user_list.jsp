<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User 목록보기</title>
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
 오니???
 <div class="container">
		<h2> 목록보기</h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>아이디</th>	
					<th>삭제</th>		
				</tr>
			</thead>
			<tbody>
			<c:forEach var="user" items="${userlist}">
				<tr>
				  <td><a href="retrieve?user_id=${user.user_id}">${user.user_id}</a></td>	
				  <td><a href="delete?user_id=${user.user_id}">삭제</a></td>	
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
 
</body>
</html>




