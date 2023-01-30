<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container">
	<table class="table align-middle mb-0 bg-white">
		<thead class="bg-light">
			<tr>
				<th><s:message code="prod.title"/></th>
				<th><s:message code="prod.size"/></th>
				<th><s:message code="prod.qty"/></th>
				<th><s:message code="prod.price"/></th>
				<th><s:message code="prod.total"/></th>
				<th></th>
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
							</div>
						</div>
					</td>
					<td>
						<select class="chooseSise">
							<c:forEach items="${prod.productSize}" var="sizes">
								<option value="${sizes.size.sizeNum}" label="${sizes.size.sizeNum}">
							</c:forEach>
						</select>
					</td>
					<td><input class="detail-qty" type="number" value="${cartItem.quantity}" min="0"></td>
					<td>
						<p class="fw-normal">
							$ <fmt:formatNumber
								type="currency"
								value="${prod.discount != null ? prod.discount : prod.price}" 
								pattern="###,###.00"/>
						</p>
					</td>
					<td>
						<p class="fw-normal cart-total">
							$ <fmt:formatNumber
								type="currency"
								value="${cartItem.quantity * (prod.discount != null ? prod.discount : prod.price)}" 
								pattern="###,###.00"/>
						</p>
					</td>
					<td>
						<button type="button" class="btn btn-link btn-sm btn-rounded btn-cart-remove"
							data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="<s:message code="prod.tooltip.clear"/>">
							<i class="fas fa-trash"></i>
						</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="d-flex justify-content-center mt-5">
		<a class="btn btn-primary me-5" role="button" href="product/all"><s:message code="prod.btn.buyMore"/></a>
		<a class="btn btn-success me-5" role="button" href="order/checkout"><s:message code="prod.btn.checkout"/></a>
		<button type="button" class="btn btn-danger btn-cart-clear"><s:message code="prod.btn.clearAll"/></button>
	</div>
</div>

