<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<h2 class="text-center mb-3"><s:message code="ol.title"/></h2>
<div class="container mb-5">
	<table class="table align-middle mb-0 bg-white">
		<thead class="bg-light">
			<tr>
				<th><s:message code="ol.id"/></th>
				<th><s:message code="ol.date"/></th>
				<th><s:message code="ol.shipAddr"/></th>
				<th><s:message code="ol.total"/></th>
				<th><s:message code="ol.status"/></th>
				<th></th> <!-- Cột nút xóa -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="o" items="${orders}">
				<tr>
					<td>
						<p class="fw-normal mb-1">${o.id}</p>
					</td>
					<td>
						<p class="fw-normal mb-1">
							<fmt:formatDate value="${o.date}" pattern="dd/MM/yyyy"/>
						</p>
					</td>
					<td><p class="fw-normal mb-1">${o.address}</p></td>
					<td>
						<p class="fw-normal mb-1">
							$<fmt:formatNumber type="currency" pattern="###,###.00" value="${o.totalMoney}" />
						</p>
					</td>
					<s:message code="ol.status.confirmed" var="conf"/>
					<s:message code="ol.status.unconfirmed" var="unconf"/>
					<td>
						<p class="fw-normal mb-1">${o.status eq false ? unconf : conf}</p>
					</td>
					<td>
						<a href="order/detail/${o.id}" type="button" class="btn btn-link btn-sm btn-rounded">
							<s:message code="ol.btn.detail"/></a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>