<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="login/images/icons/favicon.ico">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="login/css/util.css">
<link rel="stylesheet" type="text/css" href="login/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('login/images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="login" method="post">
					<span class="login100-form-logo"> <img src="login/images/m.jpg" height="80" width="90" style="border-radius: 20%">
					</span> <span class="login100-form-title p-b-34 p-t-27"> Log in </span>
					<c:if test="${requestScope.notExists}">
					<span class="text-danger">Tài khoản hoặc mật khẩu không chính xác</span>
					</c:if>
					
					<div class="wrap-input100 validate-input" data-validate="Enter username">
						<input class="input100 has-val" type="text" name="username" placeholder="Username"> <span class="focus-input100" data-placeholder=""></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100 has-val" type="password" name="pass" placeholder="Password"> <span class="focus-input100" data-placeholder=""></span>
					</div>

					<div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me"> <label class="label-checkbox100" for="ckb1"> Remember me </label>
					</div>

					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">Login</button>
					</div>


				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="login/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="login/vendor/bootstrap/js/popper.js"></script>
	<script src="login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="login/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="login/vendor/daterangepicker/moment.min.js"></script>
	<script src="login/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="login/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="login/js/main.js"></script>


</body></html>