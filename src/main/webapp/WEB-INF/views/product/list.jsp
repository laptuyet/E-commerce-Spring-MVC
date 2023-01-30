<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<%-- <c:set value="${prodList}" var="prodPageList"/> --%>

<!-- shop -->
<section class="shop container">
	<h2 class="shop-title heading">
		<%-- Kết quả tìm kiếm: <span>${requestScope.numsOfProd} sản phẩm</span> --%>
	</h2>
	
	<div class="container">
		<div class="row justify-content-center mb-3">
			<div class="col-lg-6 col-sm-12">
				<form action="product/filter-price" class="row gy-2 gx-3 align-items-center">
					<div class="col-8">
						<label for="customRange1" class="form-label me-3"><s:message code="list.minPrice"/>:</label>
						<span class="fw-bold minPrice">${ !empty(minPrice) ? '$ ' += minPrice : '$ 0'}</span>
						<div class="range">
						  <input type="range" class="form-range priceRange" min="0" max="1000" step="10" 
						  	id="customRange1" name="minPrice" value="${empty(minPrice) ? 0 : minPrice}"/>
						</div>
						<label for="customRange2" class="form-label me-3"><s:message code="list.maxPrice"/>:</label>
						<span class="fw-bold maxPrice">${ !empty(maxPrice) ? '$ ' += maxPrice : '$ 0'}</span>
						<div class="range">
						  <input type="range" class="form-range priceRange" min="0" max="1000" step="10" 
						  	id="customRange2" name="maxPrice" value="${empty(maxPrice) ? 0 : maxPrice}"/>
						</div>
					</div>
					<div class="col-3 ms-3">
						<button type="submit" class="btn btn-info"
							data-mdb-toggle="tooltip" data-mdb-placement="bottom" 
							title="<s:message code="list.filter"/>">
								<i class="fas fa-filter"></i>
						</button>
					</div>
					
					<!-- CateID(nếu có) để lọc sp theo danh mục -->
					<input type="hidden" value="${cateId}" name="cateId">
				</form>
			</div>
		</div>
	</div>
	
	<!-- content -->
	<div class="row gx-3 gy-3">
		<c:forEach var="p" items="${prodList.pageList}">

			<!-- shop item -->
			<div class="col-12 col-md-6 col-lg-3">
				<div class="card prod-card">
					<div class="bg-image hover-overlay ripple text-center"
						data-mdb-ripple-color="light">
						<img src="static/assets/images/products/${empty(p.image) ? 'product.png' :  p.image}"
							class="img-fluid h-100"/> <a href="product/detail/${p.id}">
							<div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
						</a>
					</div>
					<div class="card-body">
						<h5 class="card-title text-capitalize">${p.title}</h5>
						<c:if test="${p.discount != null}">
							<span class="text-dark pe-3">
								$<fmt:formatNumber type="currency" pattern="###,###.00" value="${p.discount}"/>
							</span>
						</c:if>
						<span class="${p.discount != null ? 'text-decoration-line-through text-danger' : ''}">
							$<fmt:formatNumber type="currency" pattern="###,###.00" value="${p.price}"/>
						</span>
						<div class="mt-3 pull-right text-end" data-id="${p.id}">
							<a href="product/buy-now/${p.id}" role="button" class="btn btn-success btn-sm btn-buy-now"
								data-mdb-toggle="tooltip" data-mdb-placement="bottom" 
								title="<s:message code="prod.tooltip.buyNow"/>">
								<i class="fas fa-shopping-cart"></i>
							</a>
							<button type="button" class="btn btn-warning btn-sm btn-add-to-cart" 
								data-mdb-toggle="tooltip" data-mdb-placement="bottom" 
								title="<s:message code="prod.tooltip.addToCart"/>">
								<i class="fas fa-shopping-cart"></i></button>
							<button type="button" class="btn btn-primary btn-sm btn-favor" style="background-color: #ed302f;"
								data-mdb-toggle="tooltip" data-mdb-placement="bottom" 
								title="<s:message code="prod.tooltip.fav"/>">
								<i class="fas fa-heart"></i></button>
						</div>
					</div>
				</div>
			</div>
			<!-- end shop item -->
			
		</c:forEach>
	</div>
	
	<!-- Pagination -->
	<div class="mt-5">
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center">
				<li class="page-item ${prodList.firstPage ? 'disabled' : ''}">
					<a class="page-link" href="product/${baseOption}/page/${1}"
						data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="<s:message code="list.tooltip.firstPage"/>">
						<i class="fas fa-angle-double-left"></i>
					</a>
				</li>
				<li class="page-item ${prodList.firstPage ? 'disabled' : ''}">
					<a class="page-link" href="product/${baseOption}/page/prev"><s:message code="list.tooltip.prevPage"/></a>
				</li>
				<c:forEach begin="1" end="${prodList.pageCount}" step="1" varStatus="stt">
					<li class="page-item ${prodList.page + 1 == stt.index ? 'active' : ''}">
						<a class="page-link" href="product/${baseOption}/page/${stt.index}">${stt.index}</a>
					</li>
				</c:forEach>
				<li class="page-item ${prodList.lastPage ? 'disabled' : ''}">
					<a class="page-link" href="product/${baseOption}/page/next"><s:message code="list.tooltip.nextPage"/></a>
				</li>
				<li class="page-item ${prodList.lastPage ? 'disabled' : ''}">
					<a class="page-link" href="product/${baseOption}/page/${prodList.pageCount}"
						data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="<s:message code="list.tooltip.lastPage"/>">
						<i class="fas fa-angle-double-right"></i>
					</a>
				</li>
			</ul>
		</nav>		
	</div>
	
</section>
<!-- end shop -->