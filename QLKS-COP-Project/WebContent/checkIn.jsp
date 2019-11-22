<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Check-in</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
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
		style="visibility: hidden; z-index: -100; position: fixed; top: 0px; left: 0px; overflow: hidden; height: 408px; width: 1349px;">
		<img class="parallax-slider" src="homepage/images/footer.jpg"
			style="position: absolute; height: 491px; width: 1349px; max-width: none;">
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
				<div class="col-md-2">
					<div class="chamber-filter">
						<h2>Giá</h2>
						<div class="form-check">
							<label class="form-check-label"> <a
								href="/check-in?p=0&t=${currentType}"> <input
									<c:if test="${checkPrice0 == true}">checked</c:if> type="radio"
									class="form-check-input" name="price"
									onclick="javascript: return false;">Dưới 500.000đ
							</a>
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label"> <a
								href="/check-in?p=1&t=${currentType}"> <input type="radio"
									class="form-check-input" name="price"
									onclick="javascript: return false;"
									<c:if test="${checkPrice1 == true}">checked</c:if>>Từ
									500.000đ - 1.000.000đ
							</a>
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label"> <a
								href="/check-in?p=2&t=${currentType}"> <input type="radio"
									class="form-check-input" name="price"
									<c:if test="${checkPrice2 == true}">checked</c:if>
									onclick="javascript: return false;">Trên 1.000.000đ
							</a>
							</label>
						</div>
					</div>
					<div class="chamber-filter">
						<h2>Loại</h2>
						<div class="form-check">
							<label class="form-check-label"> <a
								href="/check-in?p=${currentPrice}&t=0"> <input type="radio"
									class="form-check-input" name="type"
									<c:if test="${checkType0 == true}">checked</c:if>
									onclick="javascript: return false;" checked="checked">Phòng
									đơn
							</a>
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label"> <a
								href="/check-in?p=${currentPrice}&t=1"> <input type="radio"
									class="form-check-input" name="type"
									<c:if test="${checkType1 == true}">checked</c:if>
									onclick="javascript: return false;">Phòng đôi
							</a>
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label"> <a
								href="/check-in?p=${currentPrice}&t=2"> <input type="radio"
									class="form-check-input" name="type"
									<c:if test="${checkType2 == true}">checked</c:if>
									onclick="javascript: return false;">Phòng gia đình
							</a>
							</label>
						</div>
					</div>
				</div>
				<div class="col-md-10">
					<div class=" chamber-content">
						<ul class="row">
							<c:forEach var="chamber" items="${chambers}">
								<li class="item col-md-3">
									<div class="item-content rounded show-info">
										<img src="images/chamber.png" alt="Chamber">
										<div class="number">${chamber.number}</div>
										<div class="price">
											<span style="font-size: 15px; color: red">đ </span><span>${chamber.price}</span>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												id="check-vip"
												<c:if test="${chamber.isVip() == true}">checked</c:if>>
											<label class="form-check-label" for="check-vip"> Vip
											</label>
										</div>
										<input style="display: none;" type="checkbox"
											id="check-status" checked="checked"> <span
											style="display: none">${chamber.chamber_id}</span>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<p class="float-left" style="margin-top: 30px">
						Số phòng : <span style="color: red; font-weight: bold;">${requestScope.totalChamber}</span>
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
										href="/check-in?page=1&p=${currentPrice}&t=${currentType}">First</a></li>
									<li class="page-item"><a class="page-link"
										href="/check-in?page=${requestScope.page - 1}&p=${currentPrice}&t=${currentType}">«</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach var="page" begin="${requestScope.min}"
								end="${requestScope.max}" step="1">
								<c:choose>
									<c:when test="${requestScope.page == pageScope.page}">
										<li class="page-item active"><a class="page-link"
											href="/check-in?page=${pageScope.page}&p=${currentPrice}&t=${currentType}">${pageScope.page}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item "><a class="page-link"
											href="/check-in?page=${pageScope.page}&p=${currentPrice}&t=${currentType}">${pageScope.page}</a></li>
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
										href="/check-in?page=${requestScope.page + 1}&p=${currentPrice}&t=${currentType}">»</a></li>
									<li class="page-item"><a class="page-link"
										href="/check-in?page=${requestScope.lastPage}&p=${currentPrice}&t=${currentType}">Last</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>
			</div>

			<div class="modal fade bd-example-modal-lg" tabindex="-1"
				id="check-in" role="dialog" aria-labelledby="myLargeModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<form id="check-in-form">
						<div class="modal-content">
							<div class="modal-header">
								<h3 class="modal-title" style="font-weight: bold;">Đặt
									phòng</h3>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body row" style="margin-left: 0;">
								<div class="col-md-8"
									style="border-right: #000 1px dotted; padding-right: 0;">
									<h4>Thông tin khách hàng</h4>
									<div class="row">
										<div class="form-group col-md-6">
											<label for="name" class="title-input">Họ tên<sup
												class="required-field">*</sup></label> <input type="text"
												class="form-control" placeholder="Họ tên..." required=""
												id="name" name="name">
										</div>
										<div class="form-group col-md-6">
											<label for="card" class="title-input">Căn cước<sup
												class="required-field">*</sup></label> <input type="number"
												class="form-control" placeholder="Số căn cước..." id="card"
												name="card" required="">
										</div>
										<div class="form-group col-md-6">
											<label for="birth" class="title-input">Ngày sinh<sup
												class="required-field">*</sup></label> <input type="date"
												class="form-control" placeholder="Ngày sinh..." id="birth"
												name="birth" required="">
										</div>
										<div class="form-group col-md-6">
											<label for="passport" class="title-input">Mã hộ
												chiếu(nếu có)</label> <input type="text" class="form-control"
												placeholder="Mã hộ chiếu..." id="passport" name="passport">
										</div>
										<div class="form-group col-md-6">
											<label for="nationality" class="title-input">Giới
												tính<sup class="required-field">*</sup>
											</label><select class="custom-select" name="gender" id="gender">
												<option disabled="disabled" selected="selected">Vui
													lòng chọn giới tính...</option>

												<option value=false>Nam</option>

												<option value=true>Nữ</option>

											</select>
										</div>
										<div class="form-group col-md-6">
											<label for="phone" class="title-input">Số điện thoại<sup
												class="required-field">*</sup></label> <input type="number"
												class="form-control" placeholder="Số điện thoại..."
												id="phone" name="phone" required="">
										</div>
										<div class="form-group col-md-6">
											<label for="address" class="title-input">Địa chỉ</label> <input
												type="text" class="form-control" placeholder="Địa chỉ..."
												id="address" name="address" required="">
										</div>
										<div class="form-group col-md-6">
											<label for="email" class="title-input">Email(nếu có)</label>
											<input type="email" class="form-control"
												placeholder="Email..." id="email" name="email">
										</div>
									</div>
								</div>
								<div class="col-md-4" style="padding-left: 20px;">
									<h4>Thông tin khác</h4>
									<div class="form-group" style="margin-top: 40px">
										<input type="text" class="form-control" id="chamber_number"
											name="chamber_number" readonly="">
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="chamber_price"
											name="chamber_price" readonly="">
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="chamber_type"
											name="chamber_type" readonly="">
									</div>
									<div class="form-group">
										<label for="note">Ghi chú</label>
										<textarea class="form-control" id="note" name="note" rows="4"></textarea>
									</div>
									<div class="form-group" style="display: none;">
										<input type="text" class="form-control" id="chamber_id"
											name="chamber_id">
									</div>
								</div>
							</div>
							<div class="modal-footer" style="width: 100%">
								<button type="submit" class="btn btn-primary"
									id="check_in_button">Lưu</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Đóng</button>
							</div>
						</div>
					</form>
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
		$(document)
				.ready(
						function() {
							$('.show-info')
									.click(
											function(e) {
												e.preventDefault();//ngan trinh duyet ko xu ly nhu mac dinh
												var chamberId = $(this)
														.children('span')
														.text();
												var href = "/find-chamber?id="
														+ chamberId;

												if ($('#check-status').prop(
														'checked')) {
													$
															.get(
																	href,
																	function(
																			chamber,
																			status) {
																		var chambers = $
																				.parseJSON(chamber);
																		$(
																				'#chamber_id')
																				.val(
																						chambers.chamber_id);
																		$(
																				'#chamber_number')
																				.val(
																						"Số phòng : "
																								+ chambers.number);
																		$(
																				'#chamber_price')
																				.val(
																						"Giá: "
																								+ chambers.price
																								+ " đ/ngày");
																		switch (chambers.type) {
																		case 0:
																			$(
																					'#chamber_type')
																					.val(
																							"Loại phòng : Đơn");
																			break;
																		case 1:
																			$(
																					'#chamber_type')
																					.val(
																							"Loại phòng : Đôi");
																			break;
																		default:
																			$(
																					'#chamber_type')
																					.val(
																							"Loại phòng : Gia đình");
																		}
																	});

													$('#check-in').modal();
												} else {
													alert("Phòng này đang có người ở! Vui lòng chọn phòng khác!");
												}

											});

							$('input').click(function() {
								this.select();
							});

							$("#check-in-form").submit(function(event) {
								event.preventDefault();
								ajaxCheckIn();
							});

						});

		function ajaxCheckIn() {

			var checkIn = new Object();
			checkIn["fullName"] = $("#name").val();
			checkIn["idNo"] = $("#card").val();
			checkIn["birth"] = $("#birth").val();
			checkIn["passport"] = $("#passport").val();
			checkIn["address"] = $("#address").val();
			checkIn["gender"] = $("#gender").val();
			checkIn["phone"] = $("#phone").val();
			checkIn["note"] = $("#note").val();
			checkIn["chamberId"] = $("#chamber_id").val();
			checkIn["email"] = $('#email').val();

			$("#check_in_button").prop("disabled", true);

			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/rent-chamber",
				data : JSON.stringify(checkIn),
				dataType : 'json',
				cache : false,
				timeout : 600000,
				success : function(data) {
					console.log("Success : ", data);
					alert(data.message);
					$("#check_in_button").prop("disabled", false); // enabled save button
					$("#check-in-form")[0].reset(); // reset modal element
					$('#check-in').modal('toggle'); //close modal
					location.reload(); //reload this page
				},
				error : function(data) {
					console.log("Error : ", data);
					alert("Lỗi hệ thống vui lòng thử lại sau!");
					$("#check_in_button").prop("disabled", false);
				}
			});

		}
	</script>

</body>
</html>