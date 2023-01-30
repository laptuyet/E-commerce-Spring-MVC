<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set value="${orderList}" var="orderPageList"/>

<div class="container mb-5">
	<div class="d-flex justify-content-center mt-5 mb-5">
		<a class="btn btn-primary" role="button" href="${base}/page/${orderList.page + 1}"
			data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Làm mới">
				<i class="fas fa-sync"></i>
		</a>
	</div>
	<table class="table align-middle mb-0 bg-white">
		<thead class="bg-light">
			<tr>
				<th>Mã đơn hàng</th>
				<th>Ngày</th>
				<th>Khách hàng</th>
				<th>Số điện thoại</th>
				<th>Địa chỉ giao hàng</th>
				<th>Tổng tiền</th>
				<th>Trạng thái</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="o" items="${orderList.pageList}">
				<tr class="${highlighted == o.id ? 'table-success' : ''}">
					<td>
						<p class="fw-normal mb-1">${o.id}</p>
					</td>
					<td>
						<p class="fw-normal mb-1">
							<fmt:formatDate value="${o.date}" pattern="dd/MM/yyyy"/>
						</p>
					</td>
					<td>
						<p class="fw-normal mb-1">${o.fullname}</p>
					</td>
					<td>
						<p class="fw-normal mb-1">${o.phone}</p>
					</td>
					<td>
						<p class="fw-normal mb-1 order-address">${o.address}</p>
					</td>
					<td>
						<p class="fw-normal mb-1">
							$<fmt:formatNumber value="${o.totalMoney}" type="currency" pattern="###,###.00"/>
						</p>
					</td>
					<td>
						<p class="fw-normal mb-1">${o.status eq false ? "Đợi xác nhận" : "Đã xác nhận"}</p>
					</td>
					<td>
						<a href="${base}/edit/${o.id}" type="button" class="btn btn-link btn-sm btn-rounded"
							data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Chỉnh sửa">
							<i class="fas fa-edit" ></i>
						</a>
						<%-- <a href="${base}/delete/${o.id}" type="button" class="btn btn-link btn-sm btn-rounded"
							data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Xóa">
							<i class="fas fa-trash-alt"></i>
						</a> --%>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		<li class="page-item ${orderList.firstPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/${1}"
				data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Trang đầu">
				<i class="fas fa-angle-double-left"></i>
			</a>
		</li>
		<li class="page-item ${orderList.firstPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/prev">Trước</a>
		</li>
		<c:forEach begin="1" end="${orderList.pageCount}" step="1" varStatus="stt">
			<li class="page-item ${orderList.page + 1 == stt.index ? 'active' : ''}">
				<a class="page-link" href="${base}/page/${stt.index}">${stt.index}</a>
			</li>
		</c:forEach>
		<li class="page-item ${orderList.lastPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/next">Sau</a>
		</li>
		<li class="page-item ${orderList.lastPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/${orderList.pageCount}"
				data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Trang cuối">
				<i class="fas fa-angle-double-right"></i>
			</a>
		</li>
	</ul>
</nav>