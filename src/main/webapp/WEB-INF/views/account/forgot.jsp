<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<h2 class="text-center mb-3"><s:message code="forgot.title"/></h2>
<div class="d-flex justify-content-center">
	<form:form action="account/forgot" method="post"
		modelAttribute="forgot" cssClass="row g-3 register-form">

		<div class="col-12">
			<!-- Username input -->
			<div class="form-outline mb-1">
				<form:input path="id" id="form1Example1" cssClass="form-control" />
				<label class="form-label" for="form1Example1"><s:message code="forgot.username"/></label>
			</div>
			<form:errors path="id" cssClass="error"/>
		</div>

		<div class="col-12">
			<!-- Email input -->
			<div class="form-outline mb-1">
				<form:input path="email" id="form1Example4" cssClass="form-control" />
				<label class="form-label" for="form1Example4"><s:message code="forgot.email"/></label>
			</div>
			<form:errors path="email" cssClass="error"/>
		</div>
		
		<!-- Submit button -->
		<button type="submit" class="btn btn-primary btn-block"><s:message code="forgot.submit"/></button>
	</form:form>
</div>
