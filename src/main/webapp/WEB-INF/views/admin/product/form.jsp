<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="mt-5">
	<div>
		<form:form action="${base}/index" method="post" modelAttribute="prod"
			enctype="multipart/form-data" cssClass="row g-3">
			<div class="col-2">
				<!-- Avatar -->
				<div class="text-center">
					<img
						src="static/assets/images/${type}/${empty(prod.image) ? 'product.png' :  prod.image}"
						class="img-thumbnail mb-2 uploaded-img" alt="Avatar"
						style="width: 150px; height: 150px" />
				</div>
			</div>
			<div class="col-10 prod-input-field ps-5 pe-5">
				<div class="col-12">
					<!-- Id input -->
					<div class="form-outline mb-1">
						<form:input path="id" id="form1Example1" cssClass="form-control"
							readonly="${option != 'addnew'}" />
						<label class="form-label" for="form1Example1">Mã sản phẩm</label>
					</div>
					<form:errors path="id" cssClass="error" />
				</div>

				<!-- Title input -->
				<div class="col-12">
					<div class="form-outline mb-1">
						<form:input path="title" id="form1Example2"
							cssClass="form-control" />
						<label class="form-label" for="form1Example2">Tên sản phẩm</label>
					</div>
					<form:errors path="title" cssClass="error" />
				</div>

				<!-- Price input -->
				<div class="col-md-6 col-sm-12">
					<div class="form-outline mb-1">
						<form:input path="price" id="form1Example3"
							cssClass="form-control" />
						<label class="form-label" for="form1Example3">Giá gốc</label>
					</div>
					<form:errors path="price" cssClass="error" />
				</div>

				<!-- Discount input -->
				<div class="col-md-6 col-sm-12">
					<div class="form-outline mb-1">
						<form:input path="discount" id="form1Example4"
							cssClass="form-control" />
						<label class="form-label" for="form1Example4">Giá khuyến mãi</label>
					</div>
					<form:errors path="discount" cssClass="error" />
				</div>

				<div class="col-12">
					<!-- Description input -->
					<div class="form-outline mb-1">
						<form:textarea path="description" cssClass="form-control"
							id="textAreaExample" rows="4" />
						<label class="form-label" for="textAreaExample">Ghi chú</label>
					</div>
					<form:errors path="description" cssClass="error" />
				</div>

				<!-- Danh mục choose -->
				<div class="row">
					<div class="col-3">
						<div class="form-outline mb-1">
							<form:select path="category.id">
								<form:options items="${type eq 'products' ? prodCates : acsCates}" itemValue="id" itemLabel="name" />
							</form:select>
						</div>
					</div>
					<div class="col-3">
						<div class="form-outline mb-1" style="width: 100px;">
							<select name="sizes" multiple>
								<c:forEach var="s" items="${sizes}">
									<option value="${s.sizeNum}" 
										${prodSizes.contains(s.sizeNum) ? 'selected' : ''}>
										Size ${s.sizeNum}
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				
				<form:hidden path="is_accessory"/>

				<div class="col-12">
					<!-- Chọn ảnh sản phẩm -->
					<label class="form-label" for="customFile">Chọn ảnh sản phẩm</label>
						<input type="file" class="form-control input-choose-image" 
							id="customFile" name="image_file" accept="image/*"/>
				</div>
				
				<c:if test="${option == 'addnew'}">
					<div class="col-12">
					<!-- Default checkbox -->
						<div class="form-check">
						  <input class="form-check-input" type="checkbox" value="" id="notifyCheck" name="notifyCheck"/>
						  <label class="form-check-label" for="notifyCheck">
						  	Gửi mail thông báo sản phẩm mới cho tất cả khách đăng ký
						  </label>
						</div>
					</div>
				</c:if>

				<form:hidden path="createAt" />
				<form:hidden path="viewCount" />
				<form:hidden path="image" />

				<!-- Submit button -->
				<div class="d-flex justify-content-center mt-5">
					<c:choose>
						<c:when test="${option == 'addnew'}">
							<button type="submit" class="btn btn-success me-5"
								formaction="${base}/create">Tạo</button>
						</c:when>
						<c:when test="${option == 'edit'}">
							<button type="submit" class="btn btn-warning me-5"
								formaction="${base}/update">Cập nhật</button>
						</c:when>
					</c:choose>
					<a class="btn btn-primary" role="button" href="${baseOption}/index">Quaylại</a>
				</div>
			</div>
		</form:form>
	</div>
</div>
