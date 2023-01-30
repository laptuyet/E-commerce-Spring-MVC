<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set value="${cateList}" var="catePageList"/>

<div class="container mb-5">
	<div class="d-flex justify-content-center mt-5 mb-5">
		<a class="btn btn-success me-5" role="button" href="${base}/addnew"
			data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Thêm mới">
			<i class="fas fa-plus"></i>
		</a>
		<a class="btn btn-primary" role="button" href="${base}/page/${cateList.page + 1}"
			data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Làm mới">
				<i class="fas fa-sync"></i>
		</a>
	</div>
	<table class="table align-middle mb-0 bg-white">
		<thead class="bg-light">
			<tr>
				<th>Mã danh mục</th>
				<th>Tên danh mục</th>
				<th>Loại danh mục</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${cateList.pageList}">
				<tr class="${highlighted == c.id ? 'table-success' : ''}">
					<td>
						<p class="fw-normal mb-1">${c.id}</p>
					</td>
					<td>
						<p class="fw-normal mb-1">${c.name}</p>
					</td>
					<td>
						<p class="fw-normal mb-1">${c.is_accessory ? 'Phụ kiện' : 'Sản phẩm'}</p>
					</td>
					<td>
						
						<a href="${base}/edit/${c.id}" type="button" class="btn btn-link btn-sm btn-rounded"
							data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Chỉnh sửa">
							<i class="fas fa-edit" ></i>
						</a>

						<button type="button" class="btn-del-item btn btn-link btn-sm btn-rounded"
							data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Xóa"
							data-href="${base}/delete/${c.id}">
							<i class="fas fa-trash-alt"></i>
						</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- Confirm delete Modal -->
	<jsp:include page="../confirmDeleteModal/confirmDeleteDialog.jsp"></jsp:include>
	
</div>

<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		<li class="page-item ${cateList.firstPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/${1}"
				data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Trang đầu">
				<i class="fas fa-angle-double-left"></i>
			</a>
		</li>
		<li class="page-item ${cateList.firstPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/prev">Trước</a>
		</li>
		<c:forEach begin="1" end="${cateList.pageCount}" step="1" varStatus="stt">
			<li class="page-item ${cateList.page + 1 == stt.index ? 'active' : ''}">
				<a class="page-link" href="${base}/page/${stt.index}">${stt.index}</a>
			</li>
		</c:forEach>
		<li class="page-item ${cateList.lastPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/next">Sau</a>
		</li>
		<li class="page-item ${cateList.lastPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/${cateList.pageCount}"
				data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Trang cuối">
				<i class="fas fa-angle-double-right"></i>
			</a>
		</li>
	</ul>
</nav>