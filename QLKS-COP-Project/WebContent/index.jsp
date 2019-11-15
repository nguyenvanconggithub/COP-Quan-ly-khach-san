<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Home Page</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Marimar Hotel template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="homepage/styles/bootstrap-4.1.2/bootstrap.min.css">
<link
	href="homepage/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="homepage/plugins/OwlCarousel2-2.3.4/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="homepage/plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="homepage/plugins/OwlCarousel2-2.3.4/animate.css">
<link href="homepage/plugins/jquery-datepicker/jquery-ui.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="homepage/styles/main_styles.css">
<link rel="stylesheet" type="text/css"
	href="homepage/styles/responsive.css">
</head>
<body>
	<div class="super_container">

		<!-- Header -->

		<header class="header">
			<div
				class="header_content d-flex flex-column align-items-center justify-content-lg-end justify-content-center">

				<!-- Logo -->
				<div class="logo">
					<a href="#"> <img class="logo_1"
						src="homepage/images/logo1.png" alt=""> <img class="logo_2"
						src="images/logo1.png" alt=""> <img class="logo_3"
						src="images/logo1.png" alt="">
					</a>
				</div>

				<!-- Main Nav -->
				<nav class="main_nav">
					<ul
						class="d-flex flex-row align-items-center justify-content-start">
						<c:if test="${sessionScope.role != null }">
							<li><a href="home">Trang chủ</a></li>
							<c:if test="${sessionScope.role == 0 }">
								<li><a href="manage-hotel">Quản lý khách sạn</a></li>
								<li><a href="chamber.html">Quản lý phòng</a></li>
								<li><a href="employee.html">Quản lý nhân viên</a></li>
							</c:if>
							<c:if test="${sessionScope.role == 1 }">
								<li><a href="check_in.html">Đặt phòng</a></li>
								<li><a href="check_out.html">Trả phòng</a></li>
								<li><a href="service.html">Đặt món</a></li>
								<li><a href="guest.html">Khách hàng</a></li>
							</c:if>
							<c:if test="${sessionScope.role == 2 }">
								<li><a href="manage_service.html">Quản lý thực đơn</a></li>
								<li><a href="manage_service.html">Quản lý đơn</a></li>
							</c:if>
							<li><a href="logout">${sessionScope.username}, Đăng xuất</a></li>
						</c:if>

					</ul>
				</nav>
			</div>
			<!-- Social -->

		</header>


		<div>
			<!-- Logo Overlay -->

			<div class="logo_overlay">
				<div
					class="logo_overlay_content d-flex flex-column align-items-center justify-content-center">
					<div class="logo">
						<a href="#"><img src="homepage/images/logo_3.png" alt=""></a>
					</div>
				</div>
			</div>

			<!-- Menu Overlay -->

			<div class="menu_overlay">
				<div
					class="menu_overlay_content d-flex flex-row align-items-center justify-content-center">

					<div>
						<a href="#"><img src="homepage/images/logo_3.png" alt=""></a>
					</div>

				</div>
			</div>

			<!-- Menu -->

			<div class="menu">
				<div
					class="menu_container d-flex flex-column align-items-center justify-content-center">

					<!-- Menu Navigation -->


					<!-- Menu Social -->
					<div class="social menu_social">
						<ul
							class="d-flex flex-row align-items-center justify-content-start">
							<li><a href="#"><i class="fa fa-pinterest"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-facebook"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-behance"
									aria-hidden="true"></i></a></li>
						</ul>
					</div>

				</div>
			</div>
			<!-- Home -->

			<div class="home">
				<div class="parallax_background parallax-window"
					data-parallax="scroll" data-image-src="homepage/images/home.jpg"
					data-speed="0.8"></div>
				<div
					class="home_container d-flex flex-column align-items-center justify-content-center">
					<div class="home_title">
						<h1>Matxa Hotel Management</h1>
					</div>
					<div class="home_text text-center">Trang quản lý khách sạn 5
						sao Matxa</div>
					<c:if test="${sessionScope.role == null }">
						<div class="button home_button">
							<a href="login">Đăng nhập</a>
						</div>
					</c:if>
				</div>
			</div>


			<!-- Footer -->

			<footer class="footer">
				<div class="parallax_background parallax-window"
					data-parallax="scroll" data-image-src="homepage/images/footer.jpg"
					data-speed="0.8"></div>
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="footer_logo text-center">
								<a href="#"><img src="homepage/images/logo1.png" alt=""></a>
							</div>
							<div class="footer_content">
								<div class="row">
									<div class="col-lg-4 footer_col">
										<div
											class="footer_info d-flex flex-column align-items-lg-end align-items-center justify-content-start">
											<div class="text-center">
												<div>Phone:</div>
												<div>+546 990221 123</div>
											</div>
										</div>
									</div>
									<div class="col-lg-4 footer_col">
										<div
											class="footer_info d-flex flex-column align-items-center justify-content-start">
											<div class="text-center">
												<div>Address:</div>
												<div>Main Str, no 23, New York</div>
											</div>
										</div>
									</div>
									<div class="col-lg-4 footer_col">
										<div
											class="footer_info d-flex flex-column align-items-lg-start align-items-center justify-content-start">
											<div class="text-center">
												<div>Mail:</div>
												<div>hotel@contact.com</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="footer_bar text-center">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright ©
								<script>
									document.write(new Date().getFullYear());
								</script>
								2019 All rights reserved | This template is made with <i
									class="fa fa-heart-o" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</div>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="homepage/js/jquery-3.3.1.min.js"></script>
	<script src="homepage/styles/bootstrap-4.1.2/popper.js"></script>
	<script src="homepage/styles/bootstrap-4.1.2/bootstrap.min.js"></script>
	<script src="homepage/plugins/greensock/TweenMax.min.js"></script>
	<script src="homepage/plugins/greensock/TimelineMax.min.js"></script>
	<script src="homepage/plugins/scrollmagic/ScrollMagic.min.js"></script>
	<script src="homepage/plugins/greensock/animation.gsap.min.js"></script>
	<script src="homepage/plugins/greensock/ScrollToPlugin.min.js"></script>
	<script src="homepage/plugins/OwlCarousel2-2.3.4/owl.carousel.js"></script>
	<script src="homepage/plugins/easing/easing.js"></script>
	<script src="homepage/plugins/progressbar/progressbar.min.js"></script>
	<script src="homepage/plugins/parallax-js-master/parallax.min.js"></script>
	<script src="homepage/plugins/jquery-datepicker/jquery-ui.js"></script>
	<script src="homepage/js/custom.js"></script>

</body>
</html>
