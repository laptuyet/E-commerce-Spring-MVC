<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="d-flex justify-content-center mt-5">
	<div>
		<form:form action="${base}/index" method="post" modelAttribute="cate" cssClass="row g-3 cate-form">
	
			<!-- name input -->
			<div class="form-outline mb-1">
				<form:input path="name" id="form1Example2" cssClass="form-control" />
				<label class="form-label" for="form1Example2">Tên danh mục</label>
			</div>
			<form:errors path="name" cssClass="error" />
			
			<div class="form-check-inline">
				<form:radiobutton path="is_accessory" value="false" 
				label="Danh mục sản phẩm" cssClass="form-check-input me-3" checked="checked"/>
			</div>
			<div class="form-check-inline">
				<form:radiobutton path="is_accessory" value="true" 
				label="Danh mục phụ kiện" cssClass="form-check-input me-3" />
			</div>	

			<form:hidden path="id"/>
			
			<!-- Submit button -->
			<div class="d-flex justify-content-center mt-5">
				<c:choose>
					<c:when test="${option == 'addnew'}">
						<button type="submit" class="btn btn-success me-5" formaction="${base}/create">Tạo</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn btn-warning me-5" formaction="${base}/update">Cập nhật</button>
					</c:otherwise>
				</c:choose>
				<a class="btn btn-primary" role="button" href="${base}/index">Quaylại</a>
			</div>
		</form:form>
	</div>
	
</div>
