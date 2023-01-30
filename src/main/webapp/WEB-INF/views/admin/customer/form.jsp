<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="d-flex justify-content-center mt-5 mb-5">
	<div>
		<form:form action="${base}/index" method="post" modelAttribute="cus" enctype="multipart/form-data"
			cssClass="row g-3 cate-form">

			<!-- Avatar -->
			<div class="text-center">
				<img src="static/assets/images/customers/${empty(cus.photo) ? 'user.jpg' :  cus.photo}"
					class="img-thumbnail mb-2 rounded-circle uploaded-img" alt="Avatar"
					style="width: 150px; height: 150px" />
			</div>
				
			<div class="col-12">
				<!-- Username input -->
				<div class="form-outline mb-1">
					<form:input path="id" id="form1Example1" cssClass="form-control" readonly="${option != 'addnew'}"/>
					<label class="form-label" for="form1Example1">Tài khoản</label>
				</div>
				<form:errors path="id" cssClass="error" />
			</div>

			<!-- Fname input -->
			<div class="col-md-6 col-sm-12">
				<div class="form-outline mb-1">
					<form:input path="fname" id="form1Example2" cssClass="form-control" />
					<label class="form-label" for="form1Example2">Họ</label>
				</div>
				<form:errors path="fname" cssClass="error" />
			</div>

			<div class="col-md-6 col-sm-12">
				<!-- Lname input -->
				<div class="form-outline mb-1">
					<form:input path="lname" id="form1Example13"
						cssClass="form-control" />
					<label class="form-label" for="form1Example3">Tên</label>
				</div>
				<form:errors path="lname" cssClass="error" />
			</div>

			<div class="col-12">
				<!-- Email input -->
				<div class="form-outline mb-1">
					<form:input path="email" id="form1Example4" cssClass="form-control" />
					<label class="form-label" for="form1Example4">Email</label>
				</div>
				<form:errors path="email" cssClass="error" />
			</div>

			<div class="col-12">
				<!-- Phone input -->
				<div class="form-outline mb-1">
					<form:input path="phone" id="form1Example5" cssClass="form-control" />
					<label class="form-label" for="form1Example5">Số điện thoại</label>
				</div>
				<form:errors path="phone" cssClass="error" />
			</div>

			<div class="col-12">
				<!-- Address input -->
				<div class="form-outline mb-1">
					<form:input path="address" id="form1Example6"
						cssClass="form-control" />
					<label class="form-label" for="form1Example6">Địa chỉ</label>
				</div>
				<form:errors path="address" cssClass="error" />
			</div>

			<div class="col-12 d-flex justify-content-evenly">
				<form:radiobuttons path="role.id" items="${roles}" itemValue="id" itemLabel="name" 
					cssClass="form-check-inline form-check-input"/>
			</div>
			
			<div class="col-12">
			<!-- Chọn avatar -->
			<label class="form-label" for="customFile">Chọn ảnh đại diện</label>
			<input type="file" class="form-control" id="customFile" name="photo_file" accept="image/*"/>
			</div>
			
			<form:hidden path="password" />
			<form:hidden path="photo" />
			
			<!-- Submit button -->
			<div class="d-flex justify-content-center mt-5">
				<c:choose>
					<c:when test="${option == 'addnew'}">
						<button type="submit" class="btn btn-success me-5"formaction="${base}/create">Tạo</button>
						<a class="btn btn-primary" role="button" href="${base}/index">Quaylại</a>
					</c:when>
					<c:when test="${option == 'edit'}">
						<button type="submit" class="btn btn-warning me-5"formaction="${base}/update">Cập nhật</button>
						<a class="btn btn-primary" role="button" href="${base}/index">Quaylại</a>
					</c:when>
				</c:choose>
			</div>
		</form:form>
	</div>
</div>
