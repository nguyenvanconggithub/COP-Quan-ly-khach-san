<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="APIurlEdit" value="/food"/>
<!DOCTYPE html>
<html>
<head>
	<title>Quản lý dịch vụ</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Marimar Hotel template project">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="homepage/styles/bootstrap-4.1.2/bootstrap.min.css">
	<link href="homepage/fontawesome/css/all.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="homepage/plugins/OwlCarousel2-2.3.4/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="homepage/plugins/OwlCarousel2-2.3.4/owl.theme.default.css">
	<link rel="stylesheet" type="text/css" href="homepage/plugins/OwlCarousel2-2.3.4/animate.css">
	<link href="homepage/plugins/jquery-datepicker/jquery-ui.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="homepage/styles/main_styles.css">
	<link rel="stylesheet" type="text/css" href="homepage/styles/responsive.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<style type="text/css">
		.row {
			width: 100%;
		}
	</style>
</head>

<body class="" style="">
	<div class="parallax-mirror"
		style="visibility: hidden; z-index: -100; position: fixed; top: 0px; left: 0px; overflow: hidden; height: 408px; width: 1349px;">
		<img class="parallax-slider" src="homepage/images/footer.jpg"
			style="position: absolute; height: 491px; width: 1349px; max-width: none;"></div>
	<div class="super_container">
		<header class="header">
			<div
				class="header_content d-flex flex-column align-items-center justify-content-lg-end justify-content-center">

				<!-- Logo -->
				<div class="logo">
					<a href="#">
						<img class="logo_1" src="homepage/images/logo1.png" alt="Logo">
						<img class="logo_2" src="homepage/images/logo1.png" alt="Logo">
						<img class="logo_3" src="homepage/images/logo1.png" alt="Logo">
					</a>
				</div>

				<!-- Main Nav -->
				<nav class="main_nav">
					<ul class="d-flex flex-row align-items-center justify-content-start">
						<li><a href="home.html">Trang chủ</a></li>
						<li><a href="check_in.html">Đặt phòng</a></li>
						<li><a href="check_out.html">Trả phòng</a></li>
						<li><a href="service.html">Dịch vụ</a></li>
						<li><a href="guest.html">Khách hàng</a></li>
						<li><a href="hotel.html">Quản lý khách sạn</a></li>
						<li><a href="chamber.html">Quản lý phòng</a></li>
						<li><a href="manage_service.html">Quản lý dịch vụ</a></li>
						<li><a href="employee.html">Nhân viên</a></li>
						<li><a href="#">Đăng xuất</a></li>
					</ul>
				</nav>
			</div>
			<!-- Social -->

		</header>
		<div>

			<!-- Menu -->

			<div class="menu">
				<div class="menu_container d-flex flex-column align-items-center justify-content-center">

					<!-- Menu Navigation -->


					<!-- Menu Social -->
					<div class="social menu_social">
						<ul class="d-flex flex-row align-items-center justify-content-start">
							<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
		<div class="container" style="margin-top: 350px; margin-bottom: 50px; height: 1000px">
			<div class="row" style="padding: 20px 0 50px;">
				<ul class="nav nav-tabs" style="font-weight: bold;">
					<li class="nav-item"><a class="nav-link active" href="#" id="tab1">Quản lý món ăn</a></li>
					<li class="nav-item"><a class="nav-link" href="#" id="tab2">Quản lý đơn</a></li>
				</ul>
			</div>
			<div class="row" id="tab1-table" style=" margin-bottom: 150px">
				<div class="col-md-6" style="float: left;">
					<button type="button" class="btn btn-success aBtn">
						<i class="fas fa-hamburger"></i> Thêm
					</button>
				</div>
				<div style="height: 700px; overflow: auto; border: #dee2e6 1px solid; border-radius: 3px; width: 100%">
				<table id="tbltest" class="table table-hover table-bordered">
					<thead class="thead-light">
						<tr>
							<th style="text-align: center">Ảnh</th>
							<th style="text-align: center">Tên</th>
							<th style="text-align: center">Giá</th>
							<th style="text-align: center">Miêu tả</th>
							<th style="text-align: center">Thể loại</th>
							<th style="text-align: center">Sửa</th>
							<th style="text-align: center">Xóa</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${model.listFood}">
						<tr >
							<td style="text-align: center"> <img id = "flink${item.foodId}" src = "${item.link}"/> </td>
							<td style="text-align: center" id = "fname${item.foodId}">${item.name}</td>
							<td style="text-align: center" id="fprice${item.foodId}">${item.price}</td>
							<td style="text-align: center" id="fdescription${item.foodId}">${item.description}</td>
							<td style="text-align: center" id="ftype${item.foodId}">${item.type}</td>
							<td style="text-align: center" onclick ="edit(${item.foodId})"><span class="btn btn-primary text-white eBtn">
							<i class="fas fa-pencil-alt"></i></span></td>
							<td style="text-align: center" onclick="btndeleteFood(${item.foodId})"><a class="btn btn-danger text-white dBtn">
							<i class="fas fa-trash"></i></a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
			<!--Start Tab2-->

			<div class="row" id="tab2-table" style="display: none;">
				<div class="col-md-6" style="float: left;">
					<button type="button" class="btn btn-success aBtn-S" style="margin-bottom: 10px">
						<i class="fas fa-spa"></i> Thêm
					</button>
				</div>
				<div style="height: 700px; overflow: auto; border: #dee2e6 1px solid; border-radius: 3px; width: 100%">
					<table class="table table-hover table-bordered">
						<thead class="thead-light">
							<tr>
								<th style="text-align: center; position: sticky; top: 0;">Tên Khách hàng</th>
								<th style="text-align: center; position: sticky; top: 0;">SĐT</th>
								<th style="text-align: center; position: sticky; top: 0;">Phòng</th>
								<th style="text-align: center; display: none">ID</th>
								<th style="text-align: center; position: sticky; top: 0;">Tên món ăn</th>
								<th style="text-align: center; position: sticky; top: 0;">Giá SP</th>
								<th style="text-align: center; position: sticky; top: 0;">Ngày đặt hàng</th>
								<th style="text-align: center; position: sticky; top: 0;">Số lượng</th>
								<th style="text-align: center; position: sticky; top: 0;">Số người</th>
								<th style="text-align: center; position: sticky; top: 0;">Ghi chú sp</th>
								<th style="text-align: center; position: sticky; top: 0;">thanh toán</th>
								<th style="text-align: center; position: sticky; top: 0;">Sửa</th>
								<th style="text-align: center; position: sticky; top: 0;">Xóa</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="item" items="${modelOrder.listOrder}">
						<tr >
							<td style="text-align: center">${item.fullName}</td>
							<td style="text-align: center">${item.phone}</td>
							<td style="text-align: center" >${item.number}</td>
							<td style="text-align: center" >${item.name}</td>
							<td style="text-align: center">${item.price}</td>
							<td style="text-align: center" >${item.time}</td>
							<td style="text-align: center" >${item.orderQuantity}</td>
							<td style="text-align: center" >${item.people}</td>
							<td style="text-align: center" >${item.note}</td>
							<td style="text-align: center" ></td>
							<td style="text-align: center" onclick ="editQLDon()"><span class="btn btn-primary text-white eBtnOder">
							<i class="fas fa-pencil-alt"></i></span></td>
							<td style="text-align: center" onclick="btndeleteQLDon()"><a class="btn btn-danger text-white dBtn">
							<i class="fas fa-trash"></i></a></td>
						</tr>
						</c:forEach>
					</tbody>
					</table>
				</div>
			</div>
			<!--End Tab2-->

			<!--thêm món ăn  -->
			<div class="modal fade" id="updateData" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document" style="margin-top: 50px">
					<div class="modal-content">
						<form id="frm" method="POST" action="<c:url value='/image-api' />" enctype="multipart/form-data" >
							<div class="modal-header">
								<h5 class="modal-title" style="font-weight: bold;">Thêm món ăn</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body row" style="margin-left: 0;">
								<div class="col-md-6">
									<div class="form-group">
										<label for="name" class="title-input" id='lbltenmon'>Tên món</label> 
										<input type="text" class="form-control"  name="nameadd">
									</div>
									<div class="form-group">
										<label for="category" class="title-input">Thể loại</label> 
										<input type="text" class="form-control" id="theloai" name="typeadd">
									</div>
									<div class="form-group">
										<label for="price" class="title-input">Giá</label> 
										<input type="number" class="form-control" id="price" name="priceadd" min="1" onkeypress="return (event.charCode != 45)">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="description">Miêu tả</label>
										<textarea class="form-control" id="description" name="descriptionadd" rows="9"></textarea>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
											<input id="tepduocchon" type="file" accept="image/*" id="real" name="real" />
											<input name = "link" type = "text" style ="visibility:hidden" id="linkAdd"/>
									</div>
								</div>
							</div>
							<div class="modal-footer" style="width: 100%">
								<button id="btnAddImageFood" type="submit" class="btn btn-primary">Thêm</button>
								<button id="btnHuyImageFood" type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
							</div>
						 </form>
					</div>
				</div>
			</div>
			
			<!-- sửa món ăn -->
			<div class="modal fade" id="editData" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document" style="margin-top: 50px">
					<div class="modal-content">
						<form id="formedit">
							<div class="modal-header">
								<h5 class="modal-title" style="font-weight: bold;">Sửa món ăn</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body row" style="margin-left: 0;">
								<div class="col-md-6">
									
									<div class="form-group">
										<label for="category" class="title-input">Thể loại</label>
										<input type="text"
											class="form-control" placeholder="" id="type1"
											name="type">
									</div>
									<div class="form-group">
										<label for="name" class="title-input">Tên món</label> <input type="text"
											class="form-control" placeholder="" required="" id="namefoodedit"
											name="name">
									</div>
									<div class="form-group">
										<label for="price" class="title-input">Giá</label> <input type="number"
											class="form-control" placeholder="Giá..." id="price1" name="price" min="1"
											onkeypress="return (event.charCode != 45)">
											 
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="description">Miêu tả</label>
										<textarea class="form-control" id="description1" name="description"
											rows="9"></textarea>
										<input type="text" class="form-control" style ="visibility:hidden"  id="FoodIdEdit" name="foodId">
									</div>
								</div>
								
							</div>
							<div class="modal-footer" style="width: 100%">
								<button id = "btnEdit" type="submit" class="btn btn-primary">Sửa</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Sửa order -->
			<div class="modal fade" id="editOrder" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document" style="margin-top: 50px">
					<div class="modal-content">
						<form id="formedit">
							<div class="modal-header">
								<h5 class="modal-title" style="font-weight: bold;">Test</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body row" style="margin-left: 0;">
								<div class="col-md-6">
									
									<div class="form-group">
										<label for="category" class="title-input">Thể loại</label>
										<input type="text"
											class="form-control" placeholder="" id="type1"
											name="type">
									</div>
									<div class="form-group">
										<label for="name" class="title-input">Tên món</label> <input type="text"
											class="form-control" placeholder="" required="" id="namefoodedit"
											name="name">
									</div>
									<div class="form-group">
										<label for="price" class="title-input">Giá</label> <input type="number"
											class="form-control" placeholder="Giá..." id="price1" name="price" min="1"
											onkeypress="return (event.charCode != 45)">
											 
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="description">Miêu tả</label>
										<textarea class="form-control" id="description1" name="description"
											rows="9"></textarea>
										<input type="text" class="form-control" style ="visibility:hidden"  id="FoodIdEdit" name="foodId">
									</div>
								</div>
								
							</div>
							<div class="modal-footer" style="width: 100%">
								<button id = "btnEdit" type="submit" class="btn btn-primary">Sửa</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- Start Update Modal tab 2 -->
			<div class="modal fade" id="updateDataTab2" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document" style="margin-top: 50px">
					<div class="modal-content">
						<form method="post" action="/service/update-service">
							<div class="modal-header">
								<h5 class="modal-title" style="font-weight: bold;">Thêm đơn đặt món</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body row" style="margin-left: 0;">
								<div class="col-md-6">
									<div class="form-group">
										<label for="name-S" class="title-input">Tên khách hàng</label> <input type="text"
											class="form-control" placeholder="Tên khách hàng..." required="" id=""
											name="name-S">
									</div>
									<div class="form-group">
										<label for="price-S" class="title-input">SĐT</label> <input type="text"
											class="form-control" placeholder="SĐT..." required="" id=""
											name="price-S">
									</div>
									<div class="form-group">
										<label for="price-S" class="title-input">Phòng</label> <input type="text"
											class="form-control" placeholder="Phòng..." required="" id=""
											name="price-S">
									</div>
									<div class="form-group">
										<label for="price-S" class="title-input">Tên món</label> <input type="text"
											class="form-control" placeholder="Tên món..." required="" id="price-S"
											name="price-S">
									</div>
									<div class="form-group">
										<label for="price-S" class="title-input">Giá</label> <input type="text"
											class="form-control" placeholder="Giá..." required="" id="price-S"
											name="price-S">
									</div>
									<div class="form-group">
										<label for="price-S" class="title-input">Ngày đặt</label> <input type="date"
											class="form-control" placeholder="Ngày đặt..." required="" id="price-S"
											name="price-S">
									</div>
									
								</div>
								<div class="col-md-6">
								<div class="form-group">
										<label for="unit-S" class="title-input">Số lượng</label> <input type="text"
											class="form-control" placeholder="Số lượng..." required="" id="unit-S"
											name="unit-S">
									</div>
									<div class="form-group">
										<label for="unit-S" class="title-input">Số người</label> <input type="text"
											class="form-control" placeholder="Số người..." required="" id="unit-S"
											name="unit-S">
									</div>
									<div class="form-group">
										<label for="unit-S" class="title-input">Đã thanh toán</label> <input type="checkbox" id="unit-S" name="unit-S">
									</div>
									<div class="form-group">
										<label for="note-S">Ghi chú</label>
										<textarea class="form-control" id="note-S" name="note-S" rows="8"></textarea>
									</div>
								</div>
							</div>
							<div class="modal-footer" style="width: 100%">
								<button type="submit" class="btn btn-primary">Lưu</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- End Update Modal tab 2 -->

			<!--Delete Modal Tab 1 -->
			<div class="modal fade" tabindex="-1" id="deleteModal" role="dialog">
				<div class="modal-dialog" role="document" style="margin-top: 100px">
					<form>
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Xác nhận xóa</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<p>
									<i class="fas fa-exclamation-triangle text-warning"
										style="margin-right: 5px"></i>Bạn có chắc chắn muốn xóa món ăn
									này không? <input type="text" name="id" id="delete_id" style="display: none;">
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success" data-dismiss="modal">Hủy</button>
								<button id="btnXacNhanXoaFood" type="submit" class="btn btn-danger">Xóa</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--Delete Modal Tab 2 -->
			<div class="modal fade" tabindex="-1" id="deleteModalTab2" role="dialog">
				<div class="modal-dialog" role="document" style="margin-top: 100px">
					<form action="/service/delete-service" method="post">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Xác nhận xóa</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<p>
									<i class="fas fa-exclamation-triangle text-warning"
										style="margin-right: 5px"></i>Bạn có chắc chắn muốn xóa dịch
									vụ này không? <input type="text" name="idService" id="idService"
										style="display: none;">
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success" data-dismiss="modal">Hủy</button>
								<button type="submit" class="btn btn-danger">Xóa</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="parallax_background parallax-window" data-parallax="scroll"
			data-image-src="homepage/images/footer.jpg" data-speed="0.8"></div>
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
								<div class="footer_info d-flex flex-column align-items-center justify-content-start">
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
						Copyright © 2019 All rights reserved | This template is made
						with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com"
							target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
				</div>
			</div>
		</div>
	</footer>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
		
		
		
		$(document).ready(function () {
			
			$('.aBtn').click(function (e) {
				e.preventDefault();
				var href = $(this).attr('href');
				var text = $(this).text();
				if (text == '') {
					$.get(href, function (food, status) {
						$('#name').val(food.name);
						$('#price').val(food.price);
						$('#description').val(food.description);
						$('#id').val(food.id);
					});
					$('#updateData').modal();
				} else {
					$('#name').val('');
					$('#price').val('');
					$('#description').val('');
					$('#id').val('');
					$('#updateData').modal();
				}
			});
			

			$('.dBtn').click(function (e) {
				e.preventDefault();
				var href = $(this).attr('href'); 
				$.get(href, function (food, status) {
					$('#delete_id').val(food.id);
				});
				$('#deleteModal').modal();
			});

			$('.eBtn-S,.aBtn-S').click(function (e) {
				e.preventDefault();
				var href = $(this).attr('href');
				var text = $(this).text();
				if (text == '') {
					$.get(href, function (service, status) {
						$('#name-S').val(service.name);
						$('#price-S').val(service.price);
						$('#unit-S').val(service.unit);
						$('#note-S').val(service.note);
						$('#description-S').val(service.description);
						$('#id-S').val(service.id);
					});
					$('#updateDataTab2').modal();
				} else {
					$('#name-S').val("");
					$('#price-S').val("");
					$('#unit-S').val("");
					$('#note-S').val("");
					$('#description-S').val("");
					$('#id-S').val("");
					$('#updateDataTab2').modal();
				}
			});

			$('.dBtn-S').click(function (e) {
				e.preventDefault(); 
				var href = $(this).attr('href');
				$.get(href, function (service, status) {
					$('#idService').val(service.id);
				});
				$('#deleteModalTab2').modal();
			});

			$('input').click(function () {
				this.select();
			});

			$('#tab1').click(function () {
				$(this).addClass("active");
				$('#tab2').removeClass("active");
				$('#tab1-table').show();
				$('#tab2-table').hide();
			});

			$('#tab2').click(function () {
				$(this).addClass("active");
				$('#tab1').removeClass("active");
				$('#tab1-table').hide();
				$('#tab2-table').show();
			});
		});
	
		
		

		// sửa món ăn 
		function edit(id){
			var link = $("#flink"+id).src;
			var name = $("#fname"+id).html();
			var price = $("#fprice"+id).html();
			var description = $("#fdescription"+id).html();
			var type = $("#ftype"+id).html();
			
			$('#theloai').val(theloai);
			$('#namefoodedit').val(name);
			$('#price1').val(""+price);
			$('#description1').text(description);
			$('#type1').val(type);
			$('#FoodIdEdit').val(id);
			$('#editData').modal();
		}
		
		$('#btnEdit').click(function (e){
			  e.preventDefault();
		        var data = {};
		        var formData = $('#formedit').serializeArray();
		        $.each(formData, function (i, v) {
		           data[""+v.name+""] = v.value;
		        });
		        if(data['name']=="" || data['type']=="" || data['description']==""){
		        	alert("Nhập đầy đủ thông tin")
		        }
		        else if( data['price'] <= 0){
		        	alert("giá sản phẩm phải lớn hơn 0")
		        }
		        else{
		        	updateFood(data);
		        }
		        
		});
		function updateFood(data) {
	        $.ajax({
	            url: '${APIurlEdit}',
	            type: 'PUT',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	alert("Sửa thành công");
	            	location.reload();
	            },
	            error: function (error) {
	            	alert("Không thành công");
	            	alert(error);
	            }
	        });
	    }
		
		//xóa món ăn
		var foodId;
		function btndeleteFood(id){
			foodId = id;
		}
		
		function deleteFood(data) {
	        $.ajax({
	            url: '${APIurlEdit}',
	            type: 'DELETE',
	            contentType: 'application/json',
	            data: JSON.stringify(data),
	            //dataType: 'json',
	            success: function (result) {
	            	alert("Xóa thành công");
	            	location.reload();
	            },
	            error: function (error) {
	            	alert("Không thành công");
	            	//alert(error);
	            }
	        });
	    }
		
		$('#btnXacNhanXoaFood').click(function (e){
			 e.preventDefault();
			 var data = {};
			 data['foodId'] = foodId;
			 deleteFood(data);
		});
		
		function editQLDon(){
			$('#editOrder').modal();
		}
	
		
		
		
	</script>

</body>

</html>