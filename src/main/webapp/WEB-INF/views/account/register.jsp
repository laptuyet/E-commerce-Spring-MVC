<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<h2 class="text-center mb-3"><s:message code="register.title"/></h2>
<div class="d-flex justify-content-center">
	<form:form action="account/register" method="post"
		modelAttribute="register" enctype="multipart/form-data"
		cssClass="row g-3 register-form">

		<!-- Fname input -->
		<div class="col-md-6 col-sm-12">
			<div class="form-outline mb-1">
				<form:input path="fname" id="form1Example5" cssClass="form-control" />
				<label class="form-label" for="form1Example5"><s:message code="register.fname"/></label>
			</div>
			<form:errors path="fname" cssClass="error"/>
		</div>

		<div class="col-md-6 col-sm-12">
			<!-- Lname input -->
			<div class="form-outline mb-1">
				<form:input path="lname" id="form1Example16" cssClass="form-control" />
				<label class="form-label" for="form1Example6"><s:message code="register.lname"/></label>
			</div>
			<form:errors path="lname" cssClass="error"/>
		</div>
		<div class="col-12">
			<!-- Username input -->
			<div class="form-outline mb-1">
				<form:input path="id" id="form1Example1" cssClass="form-control" />
				<label class="form-label" for="form1Example1"><s:message code="register.username"/></label>
			</div>
			<form:errors path="id" cssClass="error"/>
		</div>

		<div class="col-12">
			<!-- Password input -->
			<div class="form-outline mb-1">
				<form:password path="password" id="form1Example2"
					cssClass="form-control" />
				<label class="form-label" for="form1Example2"><s:message code="register.password"/></label>
			</div>
			<form:errors path="password" cssClass="error"/>
		</div>

		<div class="col-12">
			<!-- Password repeat -->
			<div class="form-outline mb-1">
				<input type="password" name="repassword" id="form1Example3"
					class="form-control" /> <label class="form-label"
					for="form1Example3"><s:message code="register.repassword"/></label>
			</div>
			<div class="error">${repass}</div>
		</div>

		<div class="col-12">
			<!-- Email input -->
			<div class="form-outline mb-1">
				<form:input path="email" id="form1Example4" cssClass="form-control" />
				<label class="form-label" for="form1Example4"><s:message code="register.email"/></label>
			</div>
			<form:errors path="email" cssClass="error"/>
		</div>

		<div class="col-12">
			<!-- Chọn avatar -->
			<label class="form-label" for="customFile"><s:message code="register.chooseImage"/></label>
			<input type="file" class="form-control" id="customFile"
				name="photo_file" />
			<form:hidden path="photo" />

			<!-- Submit button -->
			<button type="submit" class="btn btn-primary btn-block mt-4"><s:message code="register.submit"/></button>
		</div>

	</form:form>
</div>
