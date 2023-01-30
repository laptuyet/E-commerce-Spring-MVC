<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="mt-5">
	<div class="row justify-content-center">
		<div class="col-8">
			<form:form action="${base}/index" method="post" modelAttribute="order"
				cssClass="row g-3">
				<div class="col-md-6 col-sm-12">
					<!-- Id input -->
					<div class="form-outline mb-1">
						<form:input path="id" id="form1Example1" cssClass="form-control"
							readonly="true" />
						<label class="form-label" for="form1Example1">Mã đơn hàng</label>
					</div>
					<form:errors path="id" cssClass="error" />
				</div>
	
				<!-- Date input -->
				<div class="col-md-6 col-sm-12">
					<div class="form-outline mb-1">
						<form:input path="date" id="form1Example2" readonly="true"
							cssClass="form-control" />
						<label class="form-label" for="form1Example2">Ngày</label>
					</div>
					<form:errors path="date" cssClass="error" />
				</div>
	
				<!-- Date input -->
				<div class="col-md-6 col-sm-12">
					<div class="form-outline mb-1">
						<form:input path="fullname" id="form1Example3" readonly="true"
							cssClass="form-control" />
						<label class="form-label" for="form1Example3">Họ tên khách</label>
					</div>
					<form:errors path="fullname" cssClass="error" />
				</div>
				
				<div class="col-md-6 col-sm-12">
					<div class="form-outline mb-1">
						<form:input path="user.id" id="form1Example8" readonly="true"
							cssClass="form-control" />
						<label class="form-label" for="form1Example8">Mã khách</label>
					</div>
					<form:errors path="user.id" cssClass="error" />
				</div>
	
				<!-- Price input -->
				<div class="col-md-6 col-sm-12">
					<div class="form-outline mb-1">
						<form:input path="email" id="form1Example4" readonly="true"
							cssClass="form-control" />
						<label class="form-label" for="form1Example4">Email</label>
					</div>
					<form:errors path="email" cssClass="error" />
				</div>
	
				<!-- Discount input -->
				<div class="col-md-6 col-sm-12">
					<div class="form-outline mb-1">
						<form:input path="phone" id="form1Example5" readonly="true"
							cssClass="form-control" />
						<label class="form-label" for="form1Example5">Số điện thoại</label>
					</div>
					<form:errors path="phone" cssClass="error" />
				</div>
	
				<!-- Date input -->
				<div class="col-12">
					<div class="form-outline mb-1">
						<form:input path="address" id="form1Example6" readonly="true"
							cssClass="form-control" />
						<label class="form-label" for="form1Example6">Địa chỉ giao
							hàng</label>
					</div>
					<form:errors path="address" cssClass="error" />
				</div>
	
				<div class="col-12">
					<!-- Description input -->
					<div class="form-outline mb-1">
						<form:textarea path="note" cssClass="form-control" id="textAreaExample" rows="3" readonly="true"/>
						<label class="form-label" for="textAreaExample">Ghi chú</label>
					</div>
					<form:errors path="note" cssClass="error" />
				</div>
	
				<!-- Discount input -->
				<div class="col-12">
					<div class="form-outline mb-1">
						<form:input path="totalMoney" id="form1Example7" readonly="true"
							cssClass="form-control" />
						<label class="form-label" for="form1Example7">Tổng tiền</label>
					</div>
					<form:errors path="totalMoney" cssClass="error" />
				</div>
				
				<div class="text-center">
					<div class="col-12">
						<form:radiobutton path="status" value="true" label="Đã xác nhận" cssClass="me-3"/>
						<span class="me-5"></span>
						<form:radiobutton path="status" value="false" label="Đợi xác nhận" cssClass="me-3"/>
					</div>
				</div>
				
				<!-- Submit button -->
				<div class="d-flex justify-content-center mt-5">
					<c:if test="${option == 'edit'}">
						<button type="submit" class="btn btn-warning me-5"
							formaction="${base}/update">Cập nhật</button>
						<a class="btn btn-primary" role="button" href="${base}/index">Quaylại</a>
					</c:if>
				</div>
			</form:form>
		</div>
	</div>
</div>

<div class="container mt-5 mb-5">
	<h2 class="text-center">Chi tiết đơn hàng</h2>
	<table class="table align-middle mb-0 bg-white">
		<thead class="bg-light">
			<tr>
				<th>Tên</th>
				<th>Kích thước</th>
				<th>Số lượng</th>
				<th>Đơn giá</th>
				<th>Tổng</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="d" items="${details}">
				<c:set var="prod" value="${d.product}" />
				<tr>
					<td>
						<div class="d-flex align-items-center">
							<a href="product/detail/${prod.id}">
								<img src="static/assets/images/products/${prod.image}" alt="prod-img"
									style="width: 45px; height: 45px" class="rounded-circle" />
							</a>
							<div class="ms-3">
								<p class="fw-bold mb-1 text-capitalize">${prod.title}</p>
							</div>
						</div>
					</td>
					<td>
						<p class="fw-normal mb-1">${d.prod_size}</p>
					</td>
					<td><p class="fw-normal mb-1">${d.quantity}</p></td>
					<td>
						<p class="fw-normal mb-1">
							<fmt:formatNumber type="currency" value="${d.price}" pattern="###,###.00"/>
						</p>
					</td>
					<td>
						<p class="fw-normal mb-1">
							<fmt:formatNumber type="currency" value="${d.totalMoney}" pattern="###,###.00"/>
						</p>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>