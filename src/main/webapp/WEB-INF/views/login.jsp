<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/head.jsp"%>

<!DOCTYPE html>

<html>
<head>
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
	
	<c:if test="${msg==false }">
	<script type="text/javascript">
			alert("아이디 또는 비밀번호가 틀렸습니다.");
		</script>
	</c:if>
	
		<div class="container h-100">
			<div class="d-flex justify-content-center align-items-center h-100">
				<div class="col-6">
					<img class="ml-5 mb-5 mr-3" src="resources/image/BCcard_logo.png" alt=""
						width="30%" height="30%" style="float:left">
					<p class="ns-font text-left mt-3" style="white-space:nowrap">BC카드 홈페이지에 로그인하시고 다양한 서비스를 이용해보세요.</p>
					
					<img class="mb-5 ml-2" src="resources/image/duck.png" alt=""
						width="75%" height="75%">
				</div>
				<div class="col-6">
					<main class="form-signin">

						<form action="signin" method="post">
							<label for="user_id" class="mt-5 nsb-font visually-hidden"
								style="font-weight: bold;">ID</label> <input type="text"
								id="user_id" class="mt-5 ns-font form-control" placeholder="ID" required=""
								autofocus="" name="user_id"> <label for="pw"
								class="nsb-font mt-2 visually-hidden" style="font-weight: bold;">Password</label>
							<input type="password" id="pw" class="mt-3 form-control"
								placeholder="Password" required="" name="pw">

							<div class="row">
								<div class="col">
									<button class="nsb-font btn btn-outline-danger mt-4 mb-3 w-100 btn btn-lg" type="submit">Login</button>
								</div>

							</div>
						</form>
						<hr style="border: 1px solid gray">
						<div class="row">
							<div class="col-6 align-self-center">
								<p class="ns-font text-center" style="margin: 0 auto;">아직 회원이 아니신가요?</p>
							</div>
							<div class="col-6">
								<a href="signup">
									<button class="ns-font mt-3 w-100 btn btn-outline-secondary" onclick="check()" href="signup">Signup</button>
								</a>
							</div>
						</div>
					</main>
				</div>
			</div>
		</div>
	
	<c:if test="${user!=null}">
		<%
			response.sendRedirect("main");
		%>
	</c:if>
</body>
</html>