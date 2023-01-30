<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<h2 class="text-center mb-3"><s:message code="change.title"/></h2>
<div class="d-flex justify-content-center">
	<form:form action="account/change" method="post"
		modelAttribute="change" cssClass="row g-3 register-form">

		<!-- Message -->
		<div class="text-center">${msg}</div>

		<div class="col-12">
			<!-- Username input -->
			<div class="form-outline mb-1">
				<form:input path="id" id="form1Example1" cssClass="form-control" />
				<label class="form-label" for="form1Example1"><s:message code="login.title"/></label>
			</div>
			<form:errors path="id" cssClass="error"/>
		</div>

		<div class="col-12">
			<!-- Email input -->
			<div class="form-outline mb-1">
				<form:password path="password" id="form1Example2" cssClass="form-control" />
				<label class="form-label" for="form1Example2"><s:message code="change.currPass"/></label>
			</div>
			<form:errors path="password" cssClass="error"/>
		</div>
		
		<div class="col-12">
			<!-- Email input -->
			<div class="form-outline mb-1">
				<input name="pwd1" type="password" id="form1Example3" class="form-control" />
				<label class="form-label" for="form1Example3"><s:message code="change.newPass"/></label>
			</div>
			<div class="error">${passwrong1}</div>
		</div>
		
		<div class="col-12">
			<!-- Email input -->
			<div class="form-outline mb-1">
				<input name="pwd2" type="password" id="form1Example4" class="form-control" />
				<label class="form-label" for="form1Example4"><s:message code="change.reNewPass"/></label>
			</div>
			<div class="error">${passwrong2}</div>
		</div>
		
		<!-- Submit button -->
		<button type="submit" class="btn btn-primary btn-block"><s:message code="change.submit"/></button>
	</form:form>
</div>
