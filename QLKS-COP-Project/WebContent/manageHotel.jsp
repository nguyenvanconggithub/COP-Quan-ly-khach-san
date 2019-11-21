<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>Quản lý thông tin khách sạn</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Marimar Hotel template project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="homepage/styles/bootstrap-4.1.2/bootstrap.min.css">
<link href="homepage/fontawesome/css/all.css" rel="stylesheet"
	type="text/css">
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/image_style.css">
<style type="text/css">
.row {
	width: 100%;
}
</style>
</head>

<body>
	<div class="parallax-mirror"
		style="visibility: hidden; z-index: -100; position: fixed; top: 0px; left: 0px; overflow: hidden; height: 408px; width: 1349px; transform: translate3d(0px, 635px, 0px);">
		<img class="parallax-slider" src="homepage/images/footer.jpg"
			style="position: absolute; height: 491px; width: 1349px; max-width: none; transform: translate3d(0px, -119px, 0px);">
	</div>
	<div class="super_container">
		<header class="header">
			<div
				class="header_content d-flex flex-column align-items-center justify-content-lg-end justify-content-center">

				<!-- Logo -->
				<div class="logo">
					<a href="#"> <img class="logo_1"
						src="homepage/images/logo1.png" alt="Logo"> <img
						class="logo_2" src="homepage/images/logo1.png" alt="Logo"> <img
						class="logo_3" src="homepage/images/logo1.png" alt="Logo">
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
								<li><a href="employee.html">Nhân viên</a></li>
							</c:if>
							<c:if test="${sessionScope.role == 1 }">
								<li><a href="/check-in">Đặt phòng</a></li>
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
		</div>
		<div class="container" style="margin-top: 350px; margin-bottom: 50px">
			<div class="container">
				<div class="font-weight-bold lead my-5 text-shadow-blur">Thông
					tin khách sạn:</div>
				<form method="POST" class="form">
				<input type="hidden" name="listRemoveImage" id="listRemoveImage" value="">
					<div class="row form-group">
						<label for="tenKhachSan" class="col-sm-12 col-md-2">Tên
							khách sạn</label>
						<c:if test="${requestScope.alreadyHaveData }">
							<input type="text" name="tenKhachSan" id="tenKhachSan"
								value="${requestScope.HotelInfo.getHotelName() }"
								class="form-control col-sm-12 col-md-6" required>
						</c:if>
						<c:if test="${!requestScope.alreadyHaveData }">
							<input type="text" name="tenKhachSan" id="tenKhachSan"
								class="form-control col-sm-12 col-md-6" required>
						</c:if>
					</div>
					<div class="row form-group">
						<label for="tenKhachSan" class="col-sm-12 col-md-2">Địa
							chỉ</label>
						<c:if test="${requestScope.alreadyHaveData }">
							<input type="text" name="diaChi" id="diaChi"
								value="${requestScope.HotelInfo.getAddress() }"
								class="form-control col-sm-12 col-md-8" required>
						</c:if>
						<c:if test="${!requestScope.alreadyHaveData }">
							<input type="text" name="tenKhachSan" id="tenKhachSan"
								class="form-control col-sm-12 col-md-6" required>
						</c:if>
					</div>
					<div class="row form-group">
						<label for="tenKhachSan" class="col-sm-12 col-md-2">Số sao</label>

						<div class="col-sm-12 col-md-8">
							<span class="text-warning lead cursor-pointer" id="oneStar">&bigstar;</span>
							<span class="text-warning lead cursor-pointer" id="twoStar">&bigstar;</span>
							<span class="text-warning lead cursor-pointer" id="threeStar">&bigstar;</span>
							<span class="text-warning lead cursor-pointer" id="fourStar">&bigstar;</span>
							<span class="text-warning lead cursor-pointer" id="fiveStar">&bigstar;</span>
						</div>
						<c:if test="${requestScope.alreadyHaveData }">
							<input type="hidden" name="star" id="star"
								class="form-control col-sm-12 col-md-8"
								value="${requestScope.HotelInfo.getStar() }" max="5" min="1">
						</c:if>
						<c:if test="${!requestScope.alreadyHaveData }">
							<input type="hidden" name="star" id="star"
								class="form-control col-sm-12 col-md-8" value="0" max="5"
								min="1">
						</c:if>
					</div>
					<div id="service">
						<c:if test="${requestScope.alreadyHaveData }">
							<c:forEach var="service" items="${requestScope.serviceNames }"
								varStatus="status">
								<c:choose>
									<c:when test="${requestScope.serviceNames.size() == 1}">
										<div class="row form-group">
											<label for="service" class="col-sm-12 col-md-2">Dịch
												vụ</label> <input type="text" name="services" value="${service }"
												class="form-control col-sm-12 col-md-4" required>
											<button type="button" onclick="addMoreInput(this)"
												class="btn btn-primary col-sm-12 col-md-1">Thêm</button>
										</div>
									</c:when>
									<c:when test="${status.first }">
										<div class="row form-group">
											<label for="service" class="col-sm-12 col-md-2">Dịch
												vụ</label> <input type="text" name="services" value="${service }"
												class="form-control col-sm-12 col-md-4" required="">

											<button type="button" onclick="deleteInput(this)"
												class="btn btn-danger col-sm-12 col-md-1">Xóa</button>
										</div>
									</c:when>
									<c:when test="${status.last }">
										<div class="row form-group">
											<label for="service" class="col-sm-12 col-md-2"></label> <input
												type="text" name="services" value="${service }"
												class="form-control col-sm-12 col-md-4" required="">

											<button type="button" onclick="addMoreInput(this)"
												class="btn btn-primary col-sm-12 col-md-1">Thêm</button>
										</div>
									</c:when>
									<c:otherwise>
										<div class="row form-group">
											<label for="service" class="col-sm-12 col-md-2"></label> <input
												type="text" name="services" value="${service }"
												class="form-control col-sm-12 col-md-4" required="">

											<button type="button" onclick="deleteInput(this)"
												class="btn btn-danger col-sm-12 col-md-1">Xóa</button>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
						<c:if test="${!requestScope.alreadyHaveData }">
							<div class="row form-group">
								<label for="service" class="col-sm-12 col-md-2">Dịch vụ</label>
								<input type="text" name="services"
									class="form-control col-sm-12 col-md-4" required>
								<button type="button" onclick="addMoreInput(this)"
									class="btn btn-primary col-sm-12 col-md-1">Thêm</button>
							</div>
						</c:if>

					</div>

					<div class="lead text-shadow-blur font-weight-bold">Thêm ảnh
						của khách sạn ở đây:</div>
					<div class="row justify-content-center form-group">
						<c:forEach var="oneImage" items="${requestScope.hotelImage}">
							<span class="bg-dark d-flex align-items-center justify-content-center position-relative square-150x150 m-2 previewer"
								id="image-element-loaded"> 
								<img src="${pageScope.oneImage.getLink()}"
								class="square-150x150 position-absolute" id="preload-img-add">
								<input type="file" name="imageList"
								class="square-150x150 position-absolute opacity-0"
								id="${pageScope.oneImage.getImageId()}"
								onchange="addMoreImage(this)"> 
								<span class="position-absolute text-danger cursor-pointer font-weight-bold"
								style="top: 0; right: 5%" onclick="deleteImage(this)">X</span>
							</span>

						</c:forEach>
						<span
							class="bg-dark d-flex align-items-center justify-content-center opacity-50-100 position-relative square-150x150 m-2"
							id="image-element-add"> <img src="images/add_button.PNG"
							class="square-150x150 position-absolute" id="preload-img-add">
							<input type="file" name="imageList"
							class="square-150x150 position-absolute opacity-0" id=""
							onchange="addMoreImage(this)"> <span
							class="position-absolute text-danger invisible cursor-pointer font-weight-bold"
							style="top: 0; right: 5%" onclick="deleteImage(this)">X</span>
						</span>
					</div>

					<button class="btn btn-primary form-control my-3">Cập nhật</button>

				</form>
			</div>
		</div>
	</div>
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
						Copyright © 2019 All rights reserved | This template is made with
						<i class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
				</div>
			</div>
		</div>
	</footer>
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
	<script src="css/simple.money.format.js"></script>
	<script src="JS/image_style.js"></script>
	<script src="JS/star_rate.js"></script>
	<script src="JS/multi_Input.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$('.eBtn,.aBtn').click(function(e) {
				e.preventDefault();
				var href = $(this).attr('href');
				var text = $(this).text();
				if (text == '') {
					$.get(href, function(chamber, status) {
						$('#number').val(chamber.chamberNumber);
						$('#type').val(chamber.chamberType);
						$('#price').val(chamber.priceDay);
						$('#area').val(chamber.chamberArea);
						$('#note').val(chamber.note);
						if (chamber.isVip == 'true') {
							$('#vip').prop('checked', true);
						} else {
							$('#vip').prop('checked', false);
						}
						$('#id').val(chamber.chamberId);
					});
					$('#updateData').modal();
				} else {
					$('#number').val('');
					$('#type').val('');
					$('#price').val('');
					$('#area').val('');
					$('#note').val('');
					$('#id').val('-1');
					$('#updateData').modal();
				}
			});

			$('.dBtn').click(function(e) {
				e.preventDefault();
				var href = $(this).attr('href');
				$.get(href, function(chamber, status) {
					$('#delete_id').val(chamber.chamberId);
				});
				$('#deleteModal').modal();
			});

			$('input').click(function() {
				this.select();
			});

		});
	</script>

</body>

</html>