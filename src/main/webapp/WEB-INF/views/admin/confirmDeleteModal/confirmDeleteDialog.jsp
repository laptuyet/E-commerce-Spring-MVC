<%@ page pageEncoding="UTF-8"%>
<button
  type="button"
  class="btn btn-primary btn-modal-del d-none"
  data-mdb-toggle="modal"
  data-mdb-target="#deleteModal"></button>

<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog-centered modal-dialog modal-sm .modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Chú ý</h5>
        <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	Bạn chắn chắn muốn xóa chứ ?
      </div>
      <div class="modal-footer">
        <a href="" type="button" class="btn btn-primary btn-confirm-del">Đồng ý</a>
        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Hủy</button>
      </div>
    </div>
  </div>
</div>