<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Thông tin khách hàng</title>
<meta charset="UTF-8">
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
<style type="text/css">
.row {
	width: 100%;
}
</style>
</head>
<body>
	<div class="parallax-mirror"
		style="visibility: hidden; z-index: -100; position: fixed; top: 0px; left: 0px; overflow: hidden; height: 408px; width: 1349px; transform: translate3d(0px, 663px, 0px);">
		<img class="parallax-slider" src="homepage/images/footer.jpg"
			style="position: absolute; height: 491px; width: 1349px; max-width: none; transform: translate3d(0px, -124.6px, 0px);">
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
								<li><a href="/check-out">Trả phòng</a></li>
								<li><a href="/order">Đặt món</a></li>
								<li><a href="/guest">Khách hàng</a></li>
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
			<div class="row">
				<div class="col-md-12">
					<form class="col-md-4" style="float: right;" action="/guest?page=1"
						method="get">
						<div class="form-group">
							<input type="search" class="form-control" id="search-box"
								aria-describedby="search-box" value="${textSearch}"
								placeholder="...họ tên...số căn cước...mã hộ chiếu..." name="s">
						</div>
					</form>

					<table class="table table-hover table-bordered"
						style="font-size: 15px">
						<thead class="thead-light">
							<tr>
								<th style="text-align: center; display: none;">id</th>
								<th style="text-align: center">Họ tên</th>
								<th style="text-align: center">Ngày sinh</th>
								<th style="text-align: center">Giới tính</th>
								<th style="text-align: center">Địa chỉ</th>
								<th style="text-align: center">Số điện thoại</th>
								<th style="text-align: center">Số căn cước</th>
								<th style="text-align: center">Email</th>
								<th style="text-align: center"><i class="fas fa-cogs"></i></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="guest" items="${guests}">
								<tr>
									<td>${guest.fullName}</td>
									<td>${guest.birth}</td>
									<c:choose>
										<c:when test="${guest.gender == true}">
											<td>Nữ</td>
										</c:when>
										<c:otherwise>
											<td>Nam</td>
										</c:otherwise>
									</c:choose>
									<td>${guest.address}</td>
									<td>${guest.phone}</td>
									<td>${guest.idNo}</td>
									<td>${guest.email}</td>
									<td style="text-align: center"><a
										class="btn btn-primary text-white eBtn"
										href="/guest/find-guest?id=${guest.guestId}"><i
											class="fas fa-user-edit"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<p class="float-left" style="margin-top: 30px">
						Số lượng khách : <span style="color: red; font-weight: bold;">${requestScope.totalGuest}</span>
					</p>
					<nav aria-label="..."
						style="float: right; margin-top: 20px; margin-right: 40px">
						<ul class="pagination" style="float: right;">
							<c:choose>
								<c:when test="${requestScope.page == 1}">
									<li class="page-item disabled "><a class="page-link">First</a></li>
									<li class="page-item disabled "><a class="page-link">«</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="/guest?page=1&s=${textSearch}">First</a></li>
									<li class="page-item"><a class="page-link"
										href="/guest?page=${requestScope.page - 1}&s=${textSearch}">«</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="page" begin="${requestScope.min}"
								end="${requestScope.max}" step="1">
								<c:choose>
									<c:when test="${requestScope.page == pageScope.page}">
										<li class="page-item active"><a class="page-link"
											href="/guest?page=${pageScope.page}&s=${textSearch}">${pageScope.page}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item "><a class="page-link"
											href="/guest?page=${pageScope.page}&s=${textSearch}">${pageScope.page}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${requestScope.page == requestScope.lastPage}">
									<li class="page-item disabled "><a class="page-link">»</a></li>
									<li class="page-item disabled "><a class="page-link">Last</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="/guest?page=${requestScope.page + 1}&s=${textSearch}">»</a></li>
									<li class="page-item"><a class="page-link"
										href="/guest?page=${requestScope.lastPage}&s=${textSearch}">Last</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>

			</div>
			<div class="modal fade" id="exampleModalCenter" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document"
					style="margin-top: 50px">
					<div class="modal-content">
						<form method="post" action="/guest/update">
							<div class="modal-header">
								<h5 class="modal-title" style="font-weight: bold;">Cập nhật
									thông tin khách</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body row" style="margin-left: 0;">
								<div class="form-group col-md-6">
									<label for="name" class="title-input">Họ tên</label> <input
										type="text" class="form-control" placeholder="Họ tên..."
										required="" id="name" name="name">
								</div>
								<div class="form-group col-md-6">
									<label for="card" class="title-input">Căn cước </label> <input
										type="number" class="form-control"
										placeholder="Số căn cước..." id="card" name="card">
								</div>
								<div class="form-group col-md-6">
									<label for="nationality" class="title-input">Giới tính<sup
										class="required-field">*</sup>
									</label><select class="custom-select" name="gender" id="gender">
										<option disabled="disabled" selected="selected">Vui
											lòng chọn giới tính...</option>

										<option value=false>Nam</option>

										<option value=true>Nữ</option>

									</select>
								</div>
								<div class="form-group col-md-6">
									<label for="passport" class="title-input">Mã hộ chiếu</label> <input
										type="text" id="passport" class="form-control" name="passport"
										placeholder="Mã hộ chiếu...">
								</div>
								<div class="form-group col-md-6">
									<label for="birth" class="title-input">Ngày sinh</label> <input
										type="date" class="form-control" placeholder="Ngày sinh..."
										id="birth" name="birth">
								</div>

								<div class="form-group col-md-6">
									<label for="address" class="title-input">Địa chỉ</label> <input
										type="text" class="form-control" placeholder="Địa chỉ..."
										id="address" name="address">
								</div>
								<div class="form-group col-md-6">
									<label for="phone" class="title-input">Số điện thoại</label> <input
										type="number" class="form-control"
										placeholder="Số điện thoại..." id="phone" name="phone">
								</div>
								<div class="form-group col-md-6">
									<label for="email" class="title-input">Email</label> <input
										type="email" class="form-control" placeholder="Email..."
										id="email" name="email">
								</div>
								<div class="form-group col-md-6" style="display: none;">
									<input type="text" class="form-control" id="id" name="id">
								</div>
							</div>
							<div class="modal-footer" style="width: 100%">
								<button type="submit" class="btn btn-primary">Lưu</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Đóng</button>
							</div>
						</form>
					</div>
				</div>
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
	<script type="text/javascript">
		$(document).ready(
				function() {

					$('.eBtn').click(
							function(e) {
								e.preventDefault();
								var href = $(this).attr('href');
								$.get(href, function(data, status) {
									var guests = $.parseJSON(data);
									if (guests.gender) {
										$("#gender option[value=true]").prop(
												'selected', true);
									} else {
										$("#gender option[value=false]").prop(
												'selected', true);
									}
									$('#id').val(guests.guestId).hide();
									$('#name').val(guests.fullName);
									$('#birth').val(formatDate(guests.birth));
									$('#card').val(guests.idNo);
									$('#passport').val(guests.passport);
									$('#address').val(guests.address);
									$('#phone').val(guests.phone);
									$('#email').val(guests.email);
								});
								$('#exampleModalCenter').modal();
							});

					$('input').click(function() {
						this.select();
					});
				});

		function formatDate(date) {
			var d = new Date(date), month = '' + (d.getMonth() + 1), day = ''
					+ d.getDate(), year = d.getFullYear();

			if (month.length < 2)
				month = '0' + month;
			if (day.length < 2)
				day = '0' + day;

			return [ year, month, day ].join('-');
		}
	</script>

</body>
</html>