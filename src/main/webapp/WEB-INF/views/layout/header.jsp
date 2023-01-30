<%@ page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<div class="container-fluid">
	<a class="navbar-brand" href="home/index">SkateMe</a>
	<button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
		data-mdb-target="#navbarText" aria-controls="navbarText"
		aria-expanded="false" aria-label="Toggle navigation">
		<i class="fas fa-bars"></i>
	</button>
	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="home/index"><s:message code="layout.home"/></a></li>
			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-mdb-toggle="dropdown"
				aria-expanded="false"><s:message code="layout.product"/></a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<li>
						<a class="dropdown-item" href="product/all">Tất cả</a>
					</li>
					<c:forEach var="c" items="${prodCates}">
						<li><a class="dropdown-item"
							href="product/list-by-category/${c.id}">${c.name}</a>
						</li>
					</c:forEach>
				</ul>
			</li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" role="button" data-mdb-toggle="dropdown"
				aria-expanded="false"><s:message code="layout.accessory"/></a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<c:forEach var="c" items="${acsCates}">
						<li><a class="dropdown-item"
							href="product/list-by-category/${c.id}">${c.name}</a>
						</li>
					</c:forEach>
				</ul>
			</li>
			<%-- <li class="nav-item"><a class="nav-link" href="product/accessories"><s:message code="layout.accessory"/></a>
			
			</li> --%>
			<%-- <li class="nav-item"><a class="nav-link" href="#"><s:message code="layout.about"/></a></li> --%>
		</ul>
	</div>
</div>
<div class="container-fluid d-flex justify-content-end">
	<form class="d-flex input-group w-auto" action="product/list-by-keywords">
		<s:message code="layout.search" var="search"/>
		<input id="searchBox" name="keywords" value="${param.keywords}" type="search" 
			class="form-control rounded" placeholder="${search}"
			aria-label="Search" aria-describedby="search-addon" /> <span
			class="input-group-text border-0" id="search-addon">
			<i class="fas fa-search" style="cursor: pointer;"></i>
		</span>
	</form>
	
	<!-- Lấy số lượng item trong giỏ hàng và tổng tiền từ session -->
	<c:set var="cartInfo" value="${sessionScope['scopedTarget.cartService']}" />
	
	<ul class="navbar-nav d-flex flex-row">
		<!-- Icons -->
		<li class="nav-item me-3 me-lg-0 dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="cartDropDown"
					role="button" data-mdb-toggle="dropdown" aria-expanded="false">
					<i class="fas fa-shopping-cart"></i>
					<span class="badge rounded-pill badge-notification bg-danger" id="cartMini-count">
						${cartInfo.count eq null ? '0' : cartInfo.count}
					</span>
			</a>
			<ul class="dropdown-menu dropdown-menu-end miniCart"
				aria-labelledby="cartDropDown">
				<li class="mt-2">
					<div class="text-center ps-3 pe-3">
						<span class="fw-bold"><s:message code="layout.cart.total"/></span><br>
						<span id="cartMini-total" class="mt-2">
							$ <fmt:formatNumber value="${cartInfo.total}" maxFractionDigits="2"/>
						</span>
					</div>
				</li>
				<li>
					<hr class="dropdown-divider" />
				</li>
				<li>
					<a class="dropdown-item text-center mt-2 fw-bold" href="cart/view-detail">
						<s:message code="layout.cart.detail"/>
					</a>
				</li>
			</ul>
		</li>
		
		<c:set value="${pageContext.response.locale.language}" var="lang"/>
		
		<li class="nav-item me-3 me-lg-0 dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="cartDropDown"
					role="button" data-mdb-toggle="dropdown" aria-expanded="false">
					<c:choose>
						<c:when test="${lang eq 'vi'}">
							<i class="flag flag-vietnam"></i>
						</c:when>
						<c:otherwise>
							<i class="flag-united-kingdom flag"></i>
						</c:otherwise>
					</c:choose>
					
			</a>
			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="cartDropDown">
				<li>
					<a class="dropdown-item" href="#" data-lang="vi"><i class="flag flag-vietnam"></i>
						<s:message code="layout.lang.vi"/></a>
				</li>
				<li>
					<a class="dropdown-item" href="#" data-lang="en"><i class="flag-united-kingdom flag"></i>
						<s:message code="layout.lang.en"/></a>
				</li>
			</ul>
		</li>
		<!-- Icon dropdown -->
		<li class="nav-item me-3 me-lg-0 dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="userDropDown"
				role="button" data-mdb-toggle="dropdown" aria-expanded="false">
				<c:choose>
					<c:when test="${sessionScope.user eq null}">
						<i class="fas fa-user"></i>
					</c:when>
					<c:otherwise>
					<img src="static/assets/images/customers/${user.photo}" alt="avt"
               			 style="width: 25px; height: 25px;"
      					 class="rounded-circle" />
      				</c:otherwise>
				</c:choose>
				
			</a>
			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="userDropDown">
				<c:choose>
					<c:when test="${sessionScope.user eq null}"> <!-- Đã đăng xuất mới có nút login -->
						<li><a class="dropdown-item" href="account/login"><s:message code="layout.acc.login"/></a></li>
						<li><a class="dropdown-item" href="account/register"><s:message code="layout.acc.register"/></a></li>
						<li><a class="dropdown-item" href="account/forgot"><s:message code="layout.acc.forgot"/></a></li>
					</c:when>
					<c:otherwise> <!-- Đã đăng nhập mới có nút logout -->
						<li><a class="dropdown-item" href="account/edit"><s:message code="layout.acc.info"/></a></li>
						<li><a class="dropdown-item" href="order/list"><s:message code="layout.acc.order"/></a></li>
						<li><a class="dropdown-item" href="account/change"><s:message code="layout.acc.changePass"/></a></li>
						<li><hr class="dropdown-divider" /> </li>
						<li><a class="dropdown-item" href="account/logout"><s:message code="layout.acc.logout"/></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</li>
	</ul>
</div>