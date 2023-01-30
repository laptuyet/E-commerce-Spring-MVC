<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<h2 class="text-center mb-3"><s:message code="edit.title"/></h2>
<div class="d-flex justify-content-center align-items-center">
	<form:form action="account/edit" method="post" modelAttribute="edit"
		enctype="multipart/form-data" cssClass="row g-3 register-form">
		
		<!-- Avatar -->
		<div class="text-center">
			<img src="static/assets/images/customers/${empty(edit.photo) ? 'user.jpg' :  edit.photo}"
				class="img-thumbnail mb-2 rounded-circle uploaded-img" alt="Avatar"
				style="width: 150px; height: 150px" />
		</div>
		
		<!-- Message -->
		<div class="text-center">${msg}</div>
		
		<div class="col-12">
			<!-- Username input -->
			<div class="form-outline mb-1">
				<form:input path="id" id="form1Example1" cssClass="form-control"
					readonly="true" />
				<label class="form-label" for="form1Example1"><s:message code="login.username"/></label>
			</div>
			<form:errors path="id" cssClass="error" />
		</div>

		<!-- Fname input -->
		<div class="col-md-6 col-sm-12">
			<div class="form-outline mb-1">
				<form:input path="fname" id="form1Example5" cssClass="form-control" />
				<label class="form-label" for="form1Example5"><s:message code="register.fname"/></label>
			</div>
			<form:errors path="fname" cssClass="error" />
		</div>

		<div class="col-md-6 col-sm-12">
			<!-- Lname input -->
			<div class="form-outline mb-1">
				<form:input path="lname" id="form1Example16" cssClass="form-control" />
				<label class="form-label" for="form1Example6"><s:message code="register.lname"/></label>
			</div>
			<form:errors path="lname" cssClass="error" />
		</div>

		<div class="col-12">
			<!-- Email input -->
			<div class="form-outline mb-1">
				<form:input path="email" id="form1Example4" cssClass="form-control" />
				<label class="form-label" for="form1Example4"><s:message code="register.email"/></label>
			</div>
			<form:errors path="email" cssClass="error" />
		</div>

		<div class="col-12">
			<!-- Phone input -->
			<div class="form-outline mb-1">
				<form:input path="phone" id="form1Example4" cssClass="form-control" />
				<label class="form-label" for="form1Example4"><s:message code="edit.phone"/></label>
			</div>
			<form:errors path="phone" cssClass="error" />
		</div>

		<div class="col-12">
			<!-- Address input -->
			<div class="form-outline mb-1">
				<form:input path="address" id="form1Example8"
					cssClass="form-control" />
				<label class="form-label" for="form1Example8"><s:message code="edit.addr"/></label>
			</div>
			<form:errors path="address" cssClass="error" />
		</div>


		<div class="col-12">
			<!-- Chọn avatar -->
			<label class="form-label" for="customFile"><s:message code="edit.chooseImage"/></label>
			<input type="file" class="form-control" id="customFile"
				name="photo_file" accept="image/*" />
			<form:hidden path="photo" />
			<form:hidden path="password" />
			<form:hidden path="role.id" />
			<!-- Submit button -->
			<button type="submit" class="btn btn-primary btn-block mt-4 mb-4"><s:message code="edit.submit"/></button>
		</div>
	</form:form>
</div>