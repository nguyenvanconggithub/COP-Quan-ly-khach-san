<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Check-out</title>
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
				<div class="col-md-5">
					<div class="row rounded"
						style="border: black 2px groove; padding: 15px;">
						<h3 style="color: red;">Thông tin phòng</h3>
						<input type="text" id="billId" style="display: none"> <input
							type="text" id="chamberId" style="display: none">
						<div class="form-group col-md-12">
							<label for="number" class="title-input">Số phòng</label> <select
								class="custom-select" name="chamber_number" id="chamber_number">
								<option disabled="disabled" selected="selected">Vui
									lòng chọn phòng...</option>
								<c:forEach var="chamberNumber" items="${chambers}">
									<option value="${chamberNumber}">${chamberNumber}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group col-md-12">
							<label for="number" class="title-input">Loại phòng</label> <input
								type="text" class="form-control" id="type" readonly="readonly">
						</div>
						<div class="form-group col-md-12">
							<label for="phone_number" class="title-input">Giá(VND)</label> <input
								type="text" class="form-control" id="price" readonly="readonly">
						</div>
						<div class="form-check col-md-12"
							style="padding-left: 40px; padding-bottom: 10px;">
							<input class="form-check-input" type="checkbox" id="vip"
								onclick="javascript: return false;"> <label
								class="form-check-label" for="vip">Vip </label>
						</div>
					</div>
					<div class="row rounded"
						style="border: black 2px groove; padding: 15px; margin-top: 20px;">
						<h3 style="color: red;">Thông tin khách hàng</h3>
						<div class="row" style="margin-left: 0px">
							<div class="form-group col-md-6">
								<label for="name" class="title-input">Họ tên</label> <input
									type="text" class="form-control" required id="name" name="name"
									readonly="readonly">
							</div>
							<div class="form-group col-md-6">
								<label for="card" class="title-input">Căn cước</label> <input
									type="number" class="form-control" id="card" name="card"
									required="" readonly="readonly">
							</div>
							<div class="form-group col-md-6">
								<label for="nationality" class="title-input">Giới tính </label>
								<input type="text" class="form-control" id="gender"
									name="gender" required readonly="readonly">
							</div>
							<div class="form-group col-md-6">
								<label for="passport" class="title-input">Mã hộ chiếu</label> <input
									type="text" class="form-control" id="passport" name="passport"
									readonly="readonly">
							</div>
							<div class="form-group col-md-6">
								<label for="birth" class="title-input">Ngày sinh</label> <input
									type="text" class="form-control" id="birth" name="birth"
									required="" readonly="readonly">
							</div>
							<div class="form-group col-md-6">
								<label for="address" class="title-input">Địa chỉ</label> <input
									type="text" class="form-control" id="address" name="address"
									required="" readonly="readonly">
							</div>



							<div class="form-group col-md-6">
								<label for="phone" class="title-input">Số điện thoại</label> <input
									type="number" class="form-control" id="phone" name="phone"
									required="" readonly="readonly">
							</div>
							<div class="form-group col-md-6">
								<label for="email" class="title-input">Email</label> <input
									type="email" class="form-control" id="email" name="email"
									readonly="readonly">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-7">
					<div class="row rounded"
						style="border: black 2px groove; padding: 15px; height: 815px;">
						<div class="col-md-12" style="text-align: center;">
							<h2 style="color: red;">Thông tin thuê phòng</h2>
						</div>
						<div class="form-group col-md-8">
							<label for="address" class="title-input">Ngày đặt phòng</label> <input
								type="text" class="form-control" id="check-in-date"
								name="check-in-date" required="" readonly="readonly">
						</div>
						<div class="form-group col-md-4">
							<label for="address" class="title-input">Số ngày ở</label> <input
								type="text" class="form-control" id="stay" name="stay"
								required="" readonly="readonly">
						</div>
						<div class="col-md-12 form-inline" style="margin-bottom: 8px">
							<label for="address" class="title-input">Sinh hoạt phí</label>
						</div>
						<div class="col-md-12">
							<div class="form-inline"
								style="border: black 1px dotted; padding: 0 15px">
								<div class="form-group" style="width: 100%; padding: 15px 0">
									<label for="address" class="title-input col-md-4">Thuê
										phòng(VND):</label> <input type="text" class="form-control col-md-8"
										id="rent" name="rent" required="" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="col-md-12" style="margin-top: 20px">
							<div class="form-group">
								<label for="address" class="title-input">Ghi chú đặt
									phòng</label>
								<textarea class="form-control" id="note" name="note" rows="3"
									readonly="readonly" style="resize: none"></textarea>
							</div>
						</div>
						<div class="form-group col-md-5">
							<label for="address" class="title-input">Phụ phí (cộng
								thêm)</label> <input type="text" class="form-control"
								placeholder="Nhập phụ phí..." id="up" name="up">

						</div>
						<div class="form-group col-md-5">
							<label for="address" class="title-input">Khuyến mại (giảm
								bớt)</label> <input type="text" class="form-control" id="down"
								name="down" placeholder="Nhập giảm trừ...">
						</div>
						<div class="form-group col-md-2">
							<button type="submit" class="btn btn-warning"
								style="margin-top: 30px" onclick="calculateTotalPayment(true)">
								<i class="fas fa-cash-register">Tính</i>
							</button>
						</div>
						<div class="form-group col-md-12">
							<label for="address" class="title-input">Tổng thanh
								toán(VND)</label> <input type="text" class="form-control" id="total-pay"
								name="total-pay" required readonly="readonly"> <input
								type="text" class="form-control" id="total" name="total"
								required readonly="readonly" style="display: none">
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div style="margin: 30px 30px; float: right;">
						<button type="submit" class="btn btn-primary" id="checkOut">
							<i class="fas fa-print"></i> Thanh toán
						</button>
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
		$(document).ready(function() {
			$('#chamber_number').change(function() {
				var url = "/check-out/get-check-out-info?n=" + this.value;
				$.get(url, function(checkOut, status) {
					var data = $.parseJSON(checkOut);
					switch (data.type) {
					case 0:
						$('#type').val("Đơn");
						break;
					case 1:
						$('#type').val("Đôi");
						break;
					case 2:
						$('#type').val("Gia đình");
						break;
					default:
						$('#type').val("");
					}
					if (data.gender) {
						$('#gender').val("Nữ");
					} else {
						$('#gender').val("Nam");
					}
					if (data.isVip) {
						$('#vip').prop('checked', true);
					} else {
						$('#vip').prop('checked', false);
					}
					$('#billId').val(data.billId);
					$('#chamberId').val(data.chamberId);
					$('#price').val(data.price);
					$('#name').val(data.fullName);
					$('#card').val(data.idNo);
					$('#birth').val(data.birth);
					$('#passport').val(data.passport);
					$('#address').val(data.address);
					$('#phone').val(data.phone);
					$('#email').val(data.email);
					$('#check-in-date').val(data.checkInDate);
					$('#stay').val(data.stayDays);
					$('#rent').val(data.rentMoney);
					$('#total-pay').val(data.rentMoney);
					$('#total').val(data.rentMoney);
					$('#note').val(data.note);

					$('#price').simpleMoneyFormat();
					$('#rent').simpleMoneyFormat();
					$('#total-pay').simpleMoneyFormat();
				});
			});

			$('input').click(function() {
				this.select();
			});

			$("#checkOut").click(function(e) {
				ajaxCheckOut();
			});

		});

		function ajaxCheckOut() {
			var checkOut = new Object();
			checkOut["total"] = $("#total-pay").val();
			checkOut["chamberNumber"] = $("#chamber_number option:selected")
					.text();
			checkOut["billId"] = $("#billId").val();
			checkOut["chamberId"] = $("#chamberId").val();
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/check-out/payment",
				data : JSON.stringify(checkOut),
				dataType : "json",
				cache : false,
				timeout : 600000,
				success : function(data) {
					alert(data.message);
					location.reload();
				},
				error : function(data) {
					alert("Lỗi hệ thống vui lòng thử lại sau!");
				}
			});
		}

		function calculateTotalPayment(value) {
			var total = 0;
			var up = 0;
			var down = 0;
			if ($("#total").val() != '') {
				total = parseInt($("#total").val())
			}
			if ($('#up').val() != '') {
				up = parseInt($('#up').val());
			}
			if ($('#down').val() != '') {
				down = parseInt($('#down').val());
			}
			if (value == true) {
				if ((total + up - down) < 0) {
					alert('Sai thông tin vui lòng kiểm tra lại!');
				} else {
					$('#total-pay').val(total + up - down);
					$('#total-pay').simpleMoneyFormat();
				}
			}
		}
	</script>

</body>
</html>