<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="user" value="${admin}" />

<div class="sidebar">
	<div class="text-center mt-3">
		<img class="img-thumbnail rounded-circle" alt="avatar" 
			src="static/assets/images/customers/${empty(user) ? 'user.jpg' : admin.photo}" 
			style="width: 100px; height: 100px;">
	</div>
	
	<c:if test="${ !empty(admin) }">
		<div class="text-center mt-3">
			Xin chào: ${admin.fname.concat(' ').concat(admin.lname)}
		</div>
		<div class="text-center mt-3">
			<a href="admin/account/logout" class="text-decoration-underline">
				Đăng xuất <i class="fas fa-sign-out-alt ms-2"></i>
			</a>
		</div>
		
		<div class="accordion accordion-flush mt-5" id="accordionExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button id="tab1" class="accordion-button collapsed" type="button"
						data-mdb-toggle="collapse" data-mdb-target="#collapseOne"
						aria-expanded="false" aria-controls="collapseOne">
						<i class="fas fa-cogs me-2"></i>Quản lý</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse"
					aria-labelledby="headingOne" data-mdb-parent="#accordionExample">
					<div class="accordion-body ms-4">
						<!-- items -->
						<a href="admin/category/index">Danh mục</a><br>
						<a href="admin/product/index">Sản phẩm</a><br>
						<a href="admin/accessory/index">Phụ kiện</a><br>
						<a href="admin/customer/index">Khách hàng</a><br>
						<a href="admin/order/index">Đơn hàng</a>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button id="tab2" class="accordion-button collapsed" type="button"
						data-mdb-toggle="collapse" data-mdb-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">
						<i class="fas fa-chart-line me-2"></i>Thống kê</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="headingTwo" data-mdb-parent="#accordionExample">
					<div class="accordion-body">
						<!-- items -->
						<a href="admin/report/revenue-by-category">Doanh thu theo từng danh mục</a><br>
						<a href="admin/report/revenue-by-customer">Doanh thu theo khách hàng</a><br>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingThree">
					<button id="tab3" class="accordion-button collapsed" type="button"
						data-mdb-toggle="collapse" data-mdb-target="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree">
						<i class="fas fa-user-cog me-2"></i>Khác</button>
				</h2>
				<div id="collapseThree" class="accordion-collapse collapse"
					aria-labelledby="headingThree" data-mdb-parent="#accordionExample">
					<div class="accordion-body">
						<!-- items -->
						<a href="admin/other/cus-email">Danh sách email đăng ký</a><br>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</div>