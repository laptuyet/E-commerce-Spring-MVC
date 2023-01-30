<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<h2 class="text-center mb-3"><s:message code="od.title"/></h2>
<div class="container mb-5">
	<table class="table align-middle mb-0 bg-white">
		<thead class="bg-light">
			<tr>
				<th><s:message code="ol.id"/></th>
				<th><s:message code="ol.date"/></th>
				<th><s:message code="ol.shipAddr"/></th>
				<th><s:message code="ol.total"/></th>
				<th><s:message code="ol.status"/></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<p class="fw-normal mb-1">${order.id}</p>
				</td>
				<td>
					<p class="fw-normal mb-1">
					<fmt:formatDate value="${order.date}" pattern="dd/MM/yyyy"/>
				</p>
				</td>
				<td><p class="fw-normal mb-1">${order.address}</p></td>
				<td>
					<p class="fw-normal mb-1">
						$<fmt:formatNumber type="currency" pattern="###,###.00" value="${order.totalMoney}" />
					</p>
				</td>
				<s:message code="ol.status.confirmed" var="conf"/>
				<s:message code="ol.status.unconfirmed" var="unconf"/>
				<td>
					<p class="fw-normal mb-1">${order.status eq false ? unconf : conf}</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>


<div class="container mb-5">
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
			<c:forEach var="d" items="${detail}">
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
								<!-- <p class="text-muted mb-0">blabla</p> -->
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