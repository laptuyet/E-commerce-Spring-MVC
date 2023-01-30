<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container mb-5">
	<div class="d-flex justify-content-center mt-5 mb-5">
		<a class="btn btn-primary" role="button" href="${base}/page/${emailList.page + 1}"
			data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Làm mới">
				<i class="fas fa-sync"></i>
		</a>
	</div>
	<table class="table align-middle mb-0 bg-white">
		<thead class="bg-light">
			<tr>
				<th>Email</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="e" items="${emailList.pageList}">
				<tr>
					<td>
						<p class="fw-normal mb-1">${e.email}</p>
					</td>

					<td>
						<%-- <a href="${base}/edit/${o.id}" type="button" class="btn btn-link btn-sm btn-rounded"
							data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Chỉnh sửa">
							<i class="fas fa-edit" ></i>
						</a> --%>
						<button type="button" class="btn-del-item btn btn-link btn-sm btn-rounded"
							data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Xóa"
							data-href="${base}/delete/${e.id}">
							<i class="fas fa-trash-alt"></i>
						</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<jsp:include page="../confirmDeleteModal/confirmDeleteDialog.jsp"/>
</div>

<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		<li class="page-item ${emailList.firstPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/${1}"
				data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Trang đầu">
				<i class="fas fa-angle-double-left"></i>
			</a>
		</li>
		<li class="page-item ${emailList.firstPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/prev">Trước</a>
		</li>
		<c:forEach begin="1" end="${emailList.pageCount}" step="1" varStatus="stt">
			<li class="page-item ${emailList.page + 1 == stt.index ? 'active' : ''}">
				<a class="page-link" href="${base}/page/${stt.index}">${stt.index}</a>
			</li>
		</c:forEach>
		<li class="page-item ${emailList.lastPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/next">Sau</a>
		</li>
		<li class="page-item ${emailList.lastPage ? 'disabled' : ''}">
			<a class="page-link" href="${base}/page/${emailList.pageCount}"
				data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Trang cuối">
				<i class="fas fa-angle-double-right"></i>
			</a>
		</li>
	</ul>
</nav>