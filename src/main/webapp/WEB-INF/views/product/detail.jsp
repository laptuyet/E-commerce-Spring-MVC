<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="row">
	<div class="col-sm-5 text-center">
		<img class="detail-img img-thumbnail" alt="detail-img"
			src="static/assets/images/products/${prod.image}">
	</div>
	<div class="col-sm-7 d-flex align-items-center">
		<ul class="detail-prod">
			<li><b><s:message code="prod.title"/></b><span class="text-capitalize">${prod.title}</span></li>
			<li><b><s:message code="prod.price"/></b>
				<c:if test="${prod.discount != null}">
					<span class="text-dark pe-3">
						$<fmt:formatNumber type="currency" pattern="###,###.00" value="${prod.discount}" />
					</span>
				</c:if>
				<span class="${prod.discount != null ? 'text-decoration-line-through text-danger' : ''}">
					$<fmt:formatNumber type="currency" pattern="###,###.00" value="${prod.price}" />
				</span>
			</li>
			<li><b><s:message code="prod.size"/></b>
				<c:forEach var="s" items="${prod.productSize}">
					<div class="form-check form-check-inline">
						<input class="form-check-input size-radio" type="radio"
							name="sizeOption" id="size${s.size.sizeNum}"
							value="${s.size.sizeNum}" /><label class="form-check-label"
							for="size${s.size.sizeNum}">${s.size.sizeNum}</label>
					</div>
				</c:forEach>
			</li>
			<li><b><s:message code="prod.views"/></b><span>${prod.viewCount}</span><i class="fas fa-eye ms-2"></i></li>
			<li data-id="${prod.id}">
				<a href="product/buy-now/${prod.id}" role="button" class="btn btn-success btn-sm me-3 btn-buy-now"
					data-mdb-toggle="tooltip" data-mdb-placement="bottom" 
					title="<s:message code="prod.tooltip.buyNow"/>">
					<i class="fas fa-hand-holding-usd"></i></i>
				</a>
				<button type="button" class="btn btn-warning btn-sm me-3 btn-add-check" 
					data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="<s:message code="prod.tooltip.addToCart"/>">
					<i class="fas fa-cart-plus"></i>
				</button>
				<button type="button" class="btn btn-primary btn-sm btn-favor" style="background-color: #ed302f;"
					data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="<s:message code="prod.tooltip.fav"/>">
					<i class="fas fa-heart"></i>
				</button>
			</li>
		</ul>
	</div>
</div>

<div class="container mt-5">${prod.description}</div>

<!-- Other lists -->
<!-- Tabs navs -->
<ul class="nav nav-tabs mt-5 mb-3" id="ex-with-icons" role="tablist">
	<li class="nav-item" role="presentation"><a
		class="nav-link active" id="ex-with-icons-tab-1" data-mdb-toggle="tab"
		href="#ex-with-icons-tabs-1" role="tab"
		aria-controls="ex-with-icons-tabs-1" aria-selected="true"><i
			class="fas fa-bars fa-fw me-2"></i><s:message code="prod.relate"/></a></li>
	<li class="nav-item" role="presentation"><a class="nav-link"
		id="ex-with-icons-tab-2" data-mdb-toggle="tab"
		href="#ex-with-icons-tabs-2" role="tab"
		aria-controls="ex-with-icons-tabs-2" aria-selected="false"><i
			class="fas fa-heart fa-fw me-2"></i><s:message code="prod.fav"/></a></li>
	<li class="nav-item" role="presentation"><a class="nav-link"
		id="ex-with-icons-tab-3" data-mdb-toggle="tab"
		href="#ex-with-icons-tabs-3" role="tab"
		aria-controls="ex-with-icons-tabs-3" aria-selected="false"><i
			class="fas fa-eye fa-fw me-2"></i><s:message code="prod.viewed"/></a></li>
</ul>
<!-- Tabs navs -->

<!-- Tabs content -->
<div class="tab-content" id="ex-with-icons-content">
	<div class="tab-pane fade show active" id="ex-with-icons-tabs-1"
		role="tabpanel" aria-labelledby="ex-with-icons-tab-1">
		<!-- Related prods -->
		<div class="container mt-2">
			<div class="row">
				<c:forEach var="rl" items="${list}">
					<c:if test="${rl.id != prod.id}">
						<div class="related-prod">
							<a href="product/detail/${rl.id}"> <img
								class="img-thumbnail relate-img" alt="relate-img"
								src="static/assets/images/products/${rl.image}"
								data-mdb-toggle="tooltip" data-mdb-placement="bottom"
								title="${rl.title}">
							</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<!-- Related prods -->
	</div>
	<div class="tab-pane fade" id="ex-with-icons-tabs-2" role="tabpanel"
		aria-labelledby="ex-with-icons-tab-2">
		<!-- Favor prods -->
		<div class="container mt-2">
			<div class="row">
				<c:forEach var="f" items="${favors}">
					<div class="related-prod">
						<a href="product/detail/${f.id}"> <img
							class="img-thumbnail relate-img" alt="relate-img"
							src="static/assets/images/products/${f.image}"
							data-mdb-toggle="tooltip" data-mdb-placement="bottom"
							title="${f.title}">
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- Favor prods -->
	</div>
	<div class="tab-pane fade" id="ex-with-icons-tabs-3" role="tabpanel"
		aria-labelledby="ex-with-icons-tab-3">
		<!-- Viewed prods -->
		<div class="container mt-2">
			<div class="row">
				<c:forEach var="v" items="${viewed}">
					<div class="related-prod">
						<a href="product/detail/${v.id}"> <img
							class="img-thumbnail relate-img" alt="relate-img"
							src="static/assets/images/products/${v.image}"
							data-mdb-toggle="tooltip" data-mdb-placement="bottom"
							title="${v.title}">
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- Viewed prods -->
	</div>
</div>
<!-- Tabs content -->
