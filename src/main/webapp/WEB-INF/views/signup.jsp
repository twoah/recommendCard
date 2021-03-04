<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/css/signup.css">
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

<script type="text/javascript" src="resources/js/signup.js">
	
</script>

<script>
	function benefitCheck() {

		console.log(count);
		if (count == 0) {
			swal("", "카테고리를 하나 이상 선택해주세요.", "error");
		}
	}

	function dCheck() {
		console.log(cnt);
		if (cnt == 0) {
			swal("", "중복체크를 실행해주세요.", "warning");
		}
	}

	function btnSearchClick() {
		if ($("#name").val() == '' || $("#user_id").val() == ''
				|| $("#pw").val() == '' || $("#email").val() == ''
				|| $("#gender").val() == 'Select Gender'
				|| $("#phone_num").val() == '' || $("#account").val() == ''
				|| $("#benefit1").val() == ''
				|| $("#bank").val() == 'Select Bank') {
			swal({
				title : "해당 필드를 입력해주세요.",
				type : "warning",
			})
		} else {
			swal({
				title : "회원가입이 완료되었습니다.",
				type : "success",
			}).then(function() {
				document.getElementById('customForm').submit();
			});
		}
	}
</script>
</head>
<body>
	<div class="container">

		<form action="signup" method="post" id="customForm">

			<h2 class="nsb-font mb-3" style="text-align: left;">회원가입</h2>
			<div class="form-group input-group mb-3">

				<span class="input-group-text"> <i class="fa fa-user"></i>
				</span> <label for="name" class="visually-hidden">Name</label> <input
					type="text" id="name" class="ns-font form-control" name="name"
					placeholder="Enter your name" required="" autofocus="">
			</div>

			<div class="form-group input-group mb-3">

				<span class="input-group-text"> <i class="fas fa-id-card"></i>
				</span><label for="user_id" class="visually-hidden">ID</label> <input
					type="text" id="user_id" class="ns-font form-control"
					name="user_id" placeholder="Enter your ID" required="" autofocus="" />

				<button class="ns-font btn btn-danger id_check" type="button"
					id="id_check" onclick="doublecheck()">중복확인</button>

			</div>

			<p class="ns-font" id="error_id" style="text-align: left;"></p>
			<div class="form-group input-group  mb-3">

				<span class="input-group-text"><i class="fas fa-key"></i> </span> <label
					for="pw" class="visually-hidden">Password</label> <input
					type="password" id="pw" class="form-control" name="pw"
					placeholder="Enter your password" onclick="dCheck()" required=""
					autofocus="">
			</div>
			<div class="form-group input-group  mb-3">

				<span class="input-group-text"> <i class="fas fa-envelope"></i>
				</span> <label for="email" class="visually-hidden">Enter your email
					address</label> <input type="email" id="email" class="ns-font form-control"
					name="email" placeholder="Enter your email address" required=""
					autofocus="">
			</div>

			<div class="form-group input-group  mb-3">

				<span class="input-group-text"> <i class="fa fa-building"></i>
				</span> <label for="gender" class="visually-hidden">Enter your
					email address</label> <select class="ns-font form-control" name="gender"
					id="gender" required="" autofocus="">
					<option selected="">Select Gender</option>
					<option name="gender" value="Man">Man</option>
					<option name="gender" value="Woman">Woman</option>

				</select>
			</div>
			<div class="form-group input-group  mb-3">

				<span class="input-group-text"> <i class="fa fa-phone"></i>
				</span> <label for=phone_num class="visually-hidden">Phone number</label> <input
					type="text" id="phone_num" class="ns-font form-control"
					name="phone_num" placeholder="Enter your phone number" required=""
					autofocus="">
			</div>
			<div class="form-group input-group  mb-3">

				<span class="input-group-text"><i
					class="far fa-money-bill-alt"></i> </span><label for=account
					class="visually-hidden">Account</label> <input type="text"
					id="account" class="ns-font form-control" name="account"
					placeholder="Enter your account number" required="" autofocus="">
			</div>

			<p class="ns-font" style="text-align: left;">* 카테고리는 최대 3개까지
				선택가능합니다.</p>
			<div class="row mb-3">
				<div class="col-3">
					<input type="checkbox" class="btn-check" name="benefit" id="life"
						onclick=test_checkbox(0) value="생활"> <label
						class="ns-font btn btn-outline-secondary" for="life">생활</label>
				</div>

				<div class="col-3">
					<input type="checkbox" class="btn-check" name="benefit"
						id="culture" onclick=test_checkbox(1) value="문화"> <label
						class="ns-font btn btn-outline-secondary" for="culture">문화</label>
				</div>
				<div class="col-3">
					<input type="checkbox" class="btn-check" name="benefit"
						id="education" onclick=test_checkbox(2) value="교육"> <label
						class="ns-font btn btn-outline-secondary" for="education">교육</label>
				</div>
				<div class="col-3">
					<input type="checkbox" class="btn-check" name="benefit"
						id="shopping" onclick=test_checkbox(3) value="쇼핑"> <label
						class="ns-font btn btn-outline-secondary" for="shopping">쇼핑</label>
				</div>

			</div>


			<div class="row mb-3">
				<div class="col-3">
					<input type="checkbox" class="btn-check" name="benefit" id="dinner"
						onclick=test_checkbox(4) value="외식"> <label
						class="ns-font btn btn-outline-secondary" for="dinner">외식</label>
				</div>

				<div class="col-3">
					<input type="checkbox" class="btn-check" name="benefit" id="car"
						onclick=test_checkbox(5) value="자동차"> <label
						class="ns-font btn btn-outline-secondary" for="car">자동차</label>
				</div>
				<div class="col-3">
					<input type="checkbox" class="btn-check" name="benefit"
						id="telecom" onclick=test_checkbox(6) value="통신"> <label
						class="ns-font btn btn-outline-secondary" for="telecom">통신</label>
				</div>
				<div class="col-3">
					<input type="checkbox" class="btn-check" name="benefit"
						id="traffic" onclick=test_checkbox(7) value="교통"> <label
						class="ns-font btn btn-outline-secondary" for="traffic">교통</label>
				</div>

			</div>
			<div class="row mt-3">
				<div class="col-3 align-self-center">
					<button type="button" class="nsb-font btn btn-light">1순위</button>
				</div>
				<div class="ns-font col-2 align-self-center vertical-align-left">
					<p id="benefit1_p" style="font-weight: bold; margin: 0 auto"></p>
				</div>
			</div>

			<div class="row mt-3">
				<div class="col-3 align-self-center">
					<button type="button" class="nsb-font btn btn-light">2순위</button>
				</div>
				<div class="ns-font col-2 align-self-center vertical-align-left">
					<p id="benefit2_p" style="font-weight: bold; margin: 0 auto"></p>
				</div>
			</div>

			<div class="row mt-3">
				<div class="col-3 align-self-center">
					<button type="button" class="nsb-font btn btn-light">3순위</button>
				</div>
				<div class="ns-font col-2 align-self-center vertical-align-left">
					<p id="benefit3_p" style="font-weight: bold; margin: 0 auto"></p>
				</div>
			</div>
			<p id="alertStart"></p>
			<input type="hidden" name="benefit1" id="benefit1"
				style="text-align: left;" readonly="readonly"> </br> <input
				type="hidden" name="benefit2" id="benefit2"
				style="text-align: left;" readonly="readonly"></br> <input
				type="hidden" name="benefit3" id="benefit3"
				style="text-align: left;" readonly="readonly"></br>

			<div class="form-group input-group mb-3">


				<span class="input-group-text"> <i class="fa fa-building"></i>
				</span> <select name="bank" id="bank" class="ns-font form-control"
					required="" autofocus="" onclick="benefitCheck()">

					<option selected="">Select Bank</option>
					<option>IBK기업은행</option>
					<option>우리은행</option>
					<option>DGB대구은행</option>
					<option>NH농협은행</option>
					<option>BNK부산은행</option>
					<option>BC카드</option>

				</select>
			</div>

			<button type="button" class="btn btn-danger nsb-font"
				onclick="btnSearchClick()" id="success">submit</button>
		</form>


	</div>

</body>
</html>
