<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<h2 class="text-center mb-3"><s:message code="login.title"/></h2>
<div class="d-flex justify-content-center">
	<form:form action="account/login" method="post" modelAttribute="cus" cssClass="row g-3 register-form">

		<!-- Username input -->
		<div class="form-outline mb-1">
			<form:input path="id" id="form1Example1" cssClass="form-control"
				value="${uid}" />
			<label class="form-label" for="form1Example1"><s:message code="login.username"/></label>
		</div>
		<form:errors path="id" cssClass="error" />

		<!-- Password input -->
		<div class="form-outline mb-1">
			<form:password path="password" id="form1Example2"
				cssClass="form-control" value="${pass}" />
			<label class="form-label" for="form1Example2"><s:message code="login.password"/></label>
		</div>
		<form:errors path="password" cssClass="error" />

		<!-- 2 column grid layout for inline styling -->
		<div class="row mb-1 mt-1">
			<div class="col d-flex justify-content-center">
				<!-- Checkbox -->
				<div class="form-check">
					<input name="rmb" class="form-check-input" type="checkbox"
						id="form1Example3" ${!empty(uid) ? 'checked' : ''}/> <label class="form-check-label"
						for="form1Example3"><s:message code="login.remember"/></label>
				</div>
			</div>

			<div class="col">
				<!-- Simple link -->
				<a href="account/forgot"><s:message code="login.forgot"/></a>
			</div>
		</div>

		<!-- Submit button -->
		<button type="submit" class="btn btn-primary btn-block"><s:message code="login.submit"/></button>
	</form:form>
</div>