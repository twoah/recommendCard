<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script>
<link rel="stylesheet" href="resources/css/mypage_personal.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%-- 개인정보 수정 js hide --%>
<script>
		function show(){
		    document.getElementById("showHide").style.display ='block';
		}
		function hide(){
			document.getElementById("showHide").style.display ='none';
		}
</script>
<script>
	function submitFunc() {
	    hide();
	}
</script>
<script>
	$(document).ready(function() {
	    $("#editsubmit").submit(function(e) {
	    	console.log("블라블라");
	        $("#editbody").hide();
	    });
	});
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
	<div class = "down_container">
		<div class="nsb-font user_perform">
			<span>개인 정보 조회</span>
		</div>
		<div class="personal_body_div">
			<div class="personal_table" style="align-items: center">
				<table class="table">
					<thead>
						<tr>
							<th class="ns-font text-center" scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="ns-font text-center" scope="row">이름</th>
							<td class="ns-font">${user.name}</td>
						</tr>
						<tr>
							<th class="ns-font text-center" scope="row">이메일</th>
							<td class="ns-font">${user.email}</td>
						</tr>
						<tr>
							<th class="ns-font text-center" scope="row">핸드폰 번호</th>
							<td class="ns-font">${user.phone_num}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<center>
				<button type="button" class="nsb-font btn btn-danger"
					onclick=show();>개인 정보 수정</button>
			</center>
		</div>
		<div id="showHide" align="middle" style="display: none">

			<div class="nsb-font user_perform">
				<span>개인 정보 수정</span>
			</div>
			<div id="editbody" class="personal_body_div">
				<div class="edit_personal">
					<form id=editsubmit action="update" method="post">
						<center>
						
						 <input type="hidden" id="user_id"
									class="form-control" name="user_id"
									placeholder="Enter your email address" value="${user.user_id }" readonly="readonly"/>
									
						 <input type="hidden" id="name"
									class="form-control" name="name"
									placeholder="Enter your email address" value="${user.name }" readonly="readonly"/>
							
							<div class="ns-font edit_word">
								<span>이메일 수정</span>
							</div>
							<div class="form-group input-group  mb-3">
								
								<span class="input-group-text"> <i class="fa fa-envelope-o"></i>
								</span> <label for="email" class="ns-font visually-hidden">Enter your
									email address</label> <input type="email" id="email"
									class="ns-font form-control" name="email" value="${user.email }"
									placeholder="Enter your email address" required="" autofocus="">
							</div>

							<div class="ns-font edit_word">
								<span>핸드폰 번호 수정</span>
							</div>
							<div class="form-group input-group  mb-3">
								<span class="input-group-text"> <i class="fa fa-phone"></i>
								</span> <label for=phone_num class="ns-font visually-hidden">Phone
									number</label> <input type="text" id="phone_num" class="ns-font form-control"
									name="phone_num" placeholder="Enter your phone number" value="${user.phone_num }"
									required="" autofocus="">
							</div>

						</center>

						<center>
							<button type="submit" class="nsb-font btn btn-outline-danger">제출하기</button>
						</center>
						<!-- onclick="submitFunc()" -->
					</form>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>