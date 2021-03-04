<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/head.jsp" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>

	<div class="container">
		<nav class="navbar navbar-light mb-1">
			<a class="navbar-brand" href="#"> <img
				src="resources/image/BCcard_logo.png" width="110" height="30" alt="">
			</a>
			<a href="logout" role="button" style="text-decoration:none;" >로그아웃</a>
		</nav>
		<ul class="nav nav-pills nav-fill mb-5">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="main">홈</a></li>
			<li class="nav-item"><a class="nav-link" href="cardlist">카드상품</a></li>
			<li class="nav-item"><a class="nav-link" href="mypage">마이BC</a></li>


		</ul>
	</div>


</body>
</html>