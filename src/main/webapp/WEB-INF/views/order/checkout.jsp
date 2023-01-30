<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<h2 class="text-center mb-3"><s:message code="co.title"/></h2>

<div class="container mb-5">
	<table class="table align-middle mb-0 bg-white">
		<thead class="bg-light">
			<tr>
				<th><s:message code="prod.title"/></th>
				<th><s:message code="prod.size"/></th>
				<th><s:message code="prod.qty"/></th>
				<th><s:message code="prod.price"/></th>
				<th><s:message code="prod.total"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="cartItem" items="${sessionScope['scopedTarget.cartService'].items}">
				<c:set var="prod" value="${cartItem.product}"/>
				<tr data-id="${prod.id}" data-price="${prod.price}" data-discount="${prod.discount}">
					<td>
						<div class="d-flex align-items-center">
							<a href="product/detail/${prod.id}">
								<img src="static/assets/images/products/${prod.image}" alt="prod-img"
									style="width: 45px; height: 45px" class="rounded-circle" />
							</a>
							<div class="ms-3">
								<p class="fw-bold mb-1 text-capitalize">${prod.title}</p>
								<!-- <p class="text-muted mb-0">blabla</p> -->
							</div>
						</div>
					</td>
					<td>
						<p class="fw-normal mb-1">${cartItem.prodSize}</p>
					</td>
					<td><p class="fw-normal mb-1">${cartItem.quantity}</p></td>
					<td>
						<c:if test="${prod.discount != null}">
							<span class="fw-normal text-dark pe-1">
								$ <fmt:formatNumber type="currency" pattern="###,###.00" value="${prod.discount}" />
							</span>
						</c:if>
						<span class="fw-normal ${prod.discount != null ? 'text-decoration-line-through text-danger' : ''}">
							$ <fmt:formatNumber type="currency" pattern="###,###.00" value="${prod.price}" />
						</span>
					</td>
					<td>
						<p class="fw-normal cart-total">
							$ <fmt:formatNumber
								type="currency"
								value="${cartItem.quantity * (prod.discount != null ? prod.discount : prod.price)}" 
								pattern="###,###.00"/>
						</p>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="d-flex justify-content-center">
	<form:form action="order/checkout" method="post" modelAttribute="order" cssClass="row g-3 register-form">

		<!-- Fname input -->
		<div class="col-md-6 col-sm-12">
			<div class="form-outline mb-1">
				<form:input path="user.fname" id="form1Example5" cssClass="form-control"/>
				<label class="form-label" for="form1Example5"><s:message code="co.fname"/></label>
			</div>
			<form:errors path="user.fname" cssClass="error"/>
		</div>

		<div class="col-md-6 col-sm-12">
			<!-- Lname input -->
			<div class="form-outline mb-1">
				<form:input path="user.lname" id="form1Example16" cssClass="form-control"/>
				<label class="form-label" for="form1Example6"><s:message code="co.lname"/></label>
			</div>
			<form:errors path="user.lname" cssClass="error"/>
		</div>
		<div class="col-12">
			<!-- Username input -->
			<div class="form-outline mb-1">
				<form:input path="user.id" id="form1Example1" cssClass="form-control" readonly="true"/>
				<label class="form-label" for="form1Example1"><s:message code="co.acc"/></label>
			</div>
			<form:errors path="user.id" cssClass="error"/>
		</div>

		<div class="col-12">
			<!-- Date input -->
			<div class="form-outline mb-1">
				<form:input path="date" id="form1Example2" cssClass="form-control" readonly="true"/>
				<label class="form-label" for="form1Example2"><s:message code="co.date"/></label>
			</div>
			<form:errors path="date" cssClass="error"/>
		</div>

		<div class="col-12">
			<!-- Email -->
			<div class="form-outline mb-1">
				<form:input path="email" id="form1Example3" cssClass="form-control" />
				<label class="form-label" for="form1Example3"><s:message code="co.email"/></label>
			</div>
			<form:errors path="email" cssClass="error"/>
		</div>

		<div class="col-12">
			<!-- Phone input -->
			<div class="form-outline mb-1">
				<form:input path="phone" id="form1Example4" cssClass="form-control"/>
				<label class="form-label" for="form1Example4"><s:message code="co.phone"/></label>
			</div>
			<form:errors path="phone" cssClass="error"/>
		</div>
		
		<div class="col-12">
			<!-- Address input -->
			<div class="form-outline mb-1">
				<form:input path="address" id="form1Example8" cssClass="form-control" />
				<label class="form-label" for="form1Example8"><s:message code="co.shipAddr"/></label>
			</div>
			<form:errors path="address" cssClass="error"/>
		</div>
		
		<div class="col-12">
			<!-- Note input -->
			<div class="form-outline mb-1">
			  <form:textarea path="note" cssClass="form-control" id="textAreaExample" rows="4"/>
			  <label class="form-label" for="textAreaExample"><s:message code="co.note"/></label>
			</div>
			<form:errors path="note" cssClass="error"/>
		</div>
		
		<div class="col-12">
			<!-- Total_money input -->
			<div class="form-outline mb-1">
			  <form:input path="totalMoney" id="form1Example7" cssClass="form-control" readonly="true"/>
			  <label class="form-label" for="form1Example7"><s:message code="co.total"/></label>
			</div>
			<form:errors path="totalMoney" cssClass="error"/>
		</div>
		
		<form:hidden path="status"/>
		
		<div class="d-flex justify-content-center mt-3">
			<button type="submit" class="btn btn-success me-5"><s:message code="co.submit"/></button>
			<a class="btn btn-primary" role="button" href="cart/view-detail"
				data-mdb-toggle="tooltip" data-mdb-placement="bottom" 
				title="<s:message code="co.backToCart"/>">
				<i class="fas fa-sign-out-alt"></i>
			</a>
		</div>
		
	</form:form>
</div>

