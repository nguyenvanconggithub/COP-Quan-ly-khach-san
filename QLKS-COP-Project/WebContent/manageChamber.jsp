<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>Quản lý phòng</title>
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
								<li><a href="viewChamber">Quản lý phòng</a></li>
								<li><a href="employee.html">Quản lý nhân viên</a></li>
								<li><a href="employee.html">Quản lý tài khoản</a></li>
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
			<c:if test="${requestScope.addSuccess == true}">
				<div class="alert alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong class="text-center" id="messageInfomation">Thực hiện
						Thành Công</strong>
				</div>
			</c:if>
			<c:if test="${requestScope.addSuccess == false}">
				<div class="alert alert-danger" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong class="text-center" id="messageInfomation">Thực hiện
						Thất Bại</strong>
				</div>
			</c:if>
			<c:if test="${requestScope.roomExists }">
				<div class="alert alert-danger" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong class="text-center" id="messageInfomation">Thực hiện
						Thất Bại, Phòng ${requestScope.roomNum } đã có trong hệ thống</strong>
				</div>
			</c:if>
			<div class="row">
				<div class="col-md-6" style="float: left;">
					<button type="button" class="btn btn-success addChamber">
						<i class="fas fa-hotel"></i> Thêm
					</button>
				</div>
				<form class="col-md-6" action="" method="get">
					<div class="form-group" style="width: 75%; float: right;">
						<input type="search" class="form-control" id="search-box"
							aria-describedby="search-box" placeholder="Search..."
							name="search-text">
					</div>
				</form>
				<table class="table table-hover table-bordered">
					<thead class="thead-light">
						<tr>
							<th style="text-align: center">Stt</th>
							<th style="text-align: center; display: none">ID</th>
							<th style="text-align: center">Số phòng</th>
							<th style="text-align: center">Loại phòng</th>
							<th style="text-align: center">Giá</th>
							<th style="text-align: center">Diện tích</th>
							<th style="text-align: center">Ghi chú</th>
							<th style="text-align: center">Vip</th>
							<th style="text-align: center">Còn trống</th>
							<th style="text-align: center">Sửa</th>
							<th style="text-align: center">Xóa</th>
						</tr>
					</thead>

					<tfoot class="thead-light">
						<tr>
							<th style="text-align: center">Stt</th>
							<th style="text-align: center; display: none">ID</th>
							<th style="text-align: center">Số phòng</th>
							<th style="text-align: center">Loại phòng</th>
							<th style="text-align: center">Giá</th>
							<th style="text-align: center">Diện tích</th>
							<th style="text-align: center">Ghi chú</th>
							<th style="text-align: center">Vip</th>
							<th style="text-align: center">Còn trống</th>
							<th style="text-align: center">Sửa</th>
							<th style="text-align: center">Xóa</th>
						</tr>
					</tfoot>

					<tbody>
						<c:set var="STT"
							value="${requestScope.page*requestScope.itemsPerPage - requestScope.itemsPerPage + 1 }"></c:set>
						<c:forEach var="oneChamber" items="${requestScope.listChamber }">
							<tr>
								<td style="text-align: center; font-weight: bold;">${pageScope.STT }</td>
								<td style="display: none;">${pageScope.oneChamber.getChamber_id() }</td>
								<td style="text-align: center">${pageScope.oneChamber.getNumber() }</td>
								<c:choose>
									<c:when test="${pageScope.oneChamber.getType() == 0}">
										<td style="text-align: center">Single</td>
									</c:when>
									<c:when test="${pageScope.oneChamber.getType() == 1}">
										<td style="text-align: center">Couple</td>
									</c:when>
									<c:when test="${pageScope.oneChamber.getType() == 2}">
										<td style="text-align: center">Family</td>
									</c:when>
								</c:choose>
								<td style="text-align: center">${pageScope.oneChamber.getPrice() }</td>
								<td style="text-align: center">${pageScope.oneChamber.getArea() }</td>
								<td class="text-truncate" style="max-width: 200px">${pageScope.oneChamber.getNote() }</td>
								<td style="text-align: center">
									<div class="form-check">
										<c:choose>
											<c:when test="${pageScope.oneChamber.isVip() }">
												<input class="form-check-input position-static"
													type="checkbox" onclick="javascript: return false;"
													checked="checked">
											</c:when>
											<c:otherwise>
												<input class="form-check-input position-static"
													type="checkbox" onclick="javascript: return false;">
											</c:otherwise>
										</c:choose>
									</div>
								</td>
								<td style="text-align: center">
									<div class="form-check">
										<c:choose>
											<c:when test="${pageScope.oneChamber.isEmpty() }">
												<input class="form-check-input position-static"
													type="checkbox" onclick="javascript: return false;"
													checked="checked">
											</c:when>
											<c:otherwise>
												<input class="form-check-input position-static"
													type="checkbox" onclick="javascript: return false;">
											</c:otherwise>
										</c:choose>
									</div>
								</td>
								<c:choose>
									<c:when test="${pageScope.oneChamber.isEmpty() }">
										<td style="text-align: center"><a
											class="btn btn-primary text-white editChamber"><i
												class="fas fa-pencil-alt"></i></a></td>
										<td style="text-align: center"><a
											class="btn btn-danger text-white removeChamber"><i class="fas fa-trash"></i></a></td>
									</c:when>
									<c:otherwise>
										<td style="text-align: center"><a
											class="btn btn-primary text-white disabled"><i
												class="fas fa-pencil-alt"></i></a></td>
										<td style="text-align: center"><a
											class="btn btn-danger text-white disabled"><i
												class="fas fa-trash"></i></a></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<c:set var="STT" value="${pageScope.STT + 1 }"></c:set>
						</c:forEach>

					</tbody>
				</table>
				<div class="col-md-6"
					style="float: left; margin-top: 26px; font-size: 17px">
					<p>
						Số phòng : <span
							style="color: red; font-weight: bold;">${requestScope.totalChamber }</span>
					</p>
				</div>
				<nav class="col-md-6" aria-label="..." style="margin-top: 20px;">
					<ul class="pagination" style="float: right;">
						<c:choose>
							<c:when test="${requestScope.page == 1}">
								<li class="page-item disabled "><a class="page-link">First</a></li>
								<li class="page-item disabled "><a class="page-link">«</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="viewChamber?page=1">First</a></li>
								<li class="page-item"><a class="page-link"
									href="viewChamber?page=${requestScope.page - 1}">«</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="page" begin="${requestScope.min}"
							end="${requestScope.max}" step="1">
							<c:choose>
								<c:when test="${requestScope.page == pageScope.page}">
									<li class="page-item active"><a class="page-link"
										href="viewChamber?page=${pageScope.page}">${pageScope.page}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item "><a class="page-link"
										href="viewChamber?page=${pageScope.page}">${pageScope.page}</a></li>
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
									href="viewChamber?page=${requestScope.page + 1}">»</a></li>
								<li class="page-item"><a class="page-link"
									href="viewChamber?page=${requestScope.lastPage}">Last</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>

			<div class="modal fade" id="updateData" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document"
					style="margin-top: 50px">
					<div class="modal-content">
						<form method="post" action="" id="idFormChamber">
							<input type="hidden" id="currentPage" name="page">
							<div class="modal-header">
								<h5 class="modal-title" style="font-weight: bold;">Cập nhật
									thông tin phòng</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body" style="margin-left: 0;">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="number" class="title-input">Số phòng</label> <input
												type="text" class="form-control" placeholder="Số phòng..."
												required="" id="number" name="number" type="number">
										</div>
										<div class="form-group">
											<label for="price" class="title-input">Giá</label> <input
												type="number" class="form-control" placeholder="Giá..."
												id="price" name="price" required="required">
										</div>
										<div class="form-group">
											<label for="area" class="title-input">Diện tích</label> <input
												type="text" class="form-control" placeholder="Diện tích..."
												id="area" name="area" required="required" type="number">
										</div>
										<div class="form-check"
											style="padding-left: 30px; padding-top: 10px;">
											<input class="form-check-input" type="checkbox" name="vip"
												id="vip"> <label class="form-check-label" for="vip">
												Vip </label>
										</div>
										<div class="form-group" style="display: none;">
											<input type="text" class="form-control" id="id" name="id">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="number" class="title-input">Loại phòng</label> <select
												class="custom-select" name="type" id="type"
												required="required">
												<option value="single">Single</option>
												<option value="couple">Couple</option>
												<option value="family">Family</option>
											</select>
										</div>
										<div class="form-group">
											<label for="note" class="title-input">Ghi chú</label>
											<textarea class="form-control" id="note" name="note" rows="7"></textarea>
										</div>
									</div>
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
			<!--Delete Modal -->
			<div class="modal fade" tabindex="-1" id="deleteModal" role="dialog">
				<div class="modal-dialog" role="document" style="margin-top: 100px">
					<form action="removeChamber" method="post">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Xác nhận xóa</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<p>
									<i class="fas fa-exclamation-triangle text-warning"
										style="margin-right: 5px"></i>Bạn có chắc chắn muốn xóa phòng
									này không? <input type="text" name="id" id="delete_id"
										style="display: none;">
										<input type="hidden" name="page" id="currentPageRemove">
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success"
									data-dismiss="modal">Hủy</button>
								<button type="submit" class="btn btn-danger">Xóa</button>
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
	<script src="js/image_style.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.addChamber').click(function(e) {
				e.preventDefault();
				$("#currentPage").val($('.pagination li.active a').text());
				$('#number').val('');
				$('#number').prop('readonly',false);
				$('#type').val('');
				$('#price').val('');
				$('#area').val('');
				$('#note').val('');
				$('#id').val('');
				$('#vip').prop("checked", false);
				$('#idFormChamber').attr("action", "addChamber");
				$('#updateData').modal();
			});
			$('.editChamber').click(function(e){
				e.preventDefault();
				var trTag = $(this).parent().parent();
				$("#currentPage").val($('.pagination li.active a').text());
				$('#number').val($(trTag.find('td:nth-child(3)')).text());
				$('#number').attr('readonly',true);
				$('#type').val($(trTag.find('td:nth-child(4)')).text().toLowerCase());
				$('#price').val($(trTag.find('td:nth-child(5)')).text());
				$('#area').val($(trTag.find('td:nth-child(6)')).text());
				$('#note').val($(trTag.find('td:nth-child(7)')).text());
				$('#id').val($(trTag.find('td:nth-child(2)')).text());
				$('#vip').prop("checked",$(trTag.find('td:nth-child(8) input')).is(':checked'));
				$('#idFormChamber').attr("action", "editChamber");
				$('#updateData').modal();
			});

			$('.removeChamber').click(function(e){
				e.preventDefault();
				var trTag = $(this).parent().parent();
				$('#delete_id').val($(trTag.find('td:nth-child(2)')).text());
				$("#currentPageRemove").val($('.pagination li.active a').text());
				$('#deleteModal').modal();
			})

		});
	</script>

</body>

</html>