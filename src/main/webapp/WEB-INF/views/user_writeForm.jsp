<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board 글쓰기화면</title>
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
	<div class="container">
		<h2>게시판 글쓰기</h2>
		<form action="write" method="post">
			<div class="form-group">
				<label for="name">이름</label> <input type="text" class="form-control"
					name="name" placeholder="이름을 입력하세요">
			</div>
			<div class="form-group">
				<label for="user_id">아이디</label> <input type="text"
					class="form-control" name="user_id" placeholder="아이디를 입력하세요">
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> <input type="password"
					class="form-control" name="pw" placeholder="비밀번호를 입력하세요">
			</div>

			<div class="form-group">
				<label class="radio-inline"> 
				<input type="radio" name="gender" id="gender" value="남">
					남
				</label>
				 <label class="radio-inline"> 
				 <input type="radio" name="gender" id="gender" value="여">
					여
				</label>
			</div>
			<div class="form-group">
				<label for="email">이메일</label> <input type="text"
					class="form-control" name="email">
			</div>
			<div class="form-group">
				<label for="bank">은행</label> <input type="text" class="form-control"
					name="bank">
			</div>
			<div class="form-group">
				<label for="account">계좌번호</label> <input type="text"
					class="form-control" name="account">
			</div>
			<div class="form-group">
				<label for="phone_num">전화번호</label> <input type="text"
					class="form-control" name="phone_num">
			</div>
			<div class="form-group">
				<label for="benefit1">혜택1</label> <input type="text"
					class="form-control" name="benefit1">
			</div>
			<div class="form-group">
				<label for="benefit2">혜택2</label> <input type="text"
					class="form-control" name="benefit2">
			</div>
			<div class="form-group">
				<label for="benefit3">혜택3</label> <input type="text"
					class="form-control" name="benefit3">
			</div>
			<button type="submit" class="btn btn-default">저장</button>
		</form>
	</div>
</body>
</html>




